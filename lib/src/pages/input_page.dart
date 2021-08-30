import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String name = "";
  String email = "";
  String password = "";
  String date = "";
  String selectedOption = 'fly';
  List<String> powers = ['fly', 'x-ray', 'super-force'];
  TextEditingController inputDateCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Page"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          createInput(),
          Divider(),
          createEmail(),
          Divider(),
          createPasswod(),
          Divider(),
          createDate(context),
          Divider(),
          createDropdown(),
          Divider(),
          showFieldText(),
        ],
      ),
    );
  }

  Widget createInput() => TextField(
        //autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            counter: Text("letters ${name.length}"),
            hintText: "name",
            labelText: "name",
            helperText: "only name",
            suffixIcon: Icon(Icons.accessibility),
            icon: Icon(Icons.account_circle)),
        onChanged: (value) => setState(() => name = value),
      );

  Widget showFieldText() => ListTile(
        title: Text('Your name is: $name'),
        subtitle: ListTile(
          title: Text('email: $email'),
          subtitle: Text('password: $password'),
          trailing: Text(selectedOption),
        ),
      );

  Widget createEmail() => TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: "enter email",
            labelText: "email",
            suffixIcon: Icon(Icons.alternate_email),
            icon: Icon(Icons.email)),
        onChanged: (value) => setState(() {
          email = value;
        }),
      );

  Widget createPasswod() => TextField(
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: "enter pass",
            labelText: "Password",
            suffixIcon: Icon(Icons.lock),
            icon: Icon(Icons.lock)),
        onChanged: (value) => setState(() {
          password = value;
        }),
      );

  Widget createDate(BuildContext context) => TextField(
        controller: inputDateCtrl,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: "enter date",
            labelText: "date",
            suffixIcon: Icon(Icons.calendar_today),
            icon: Icon(Icons.calendar_today)),
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          selectDate(context);
        },
      );

  selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        date = picked.toString();
        inputDateCtrl.text = date;
      });
    }
  }

  List<DropdownMenuItem<String>> getDropdownOptions() {
    List<DropdownMenuItem<String>> list = [];

    powers.forEach((item) {
      list.add(DropdownMenuItem(
        child: Text(item),
        value: item,
      ));
    });

    return list;
  }

  Widget createDropdown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(
          width: 30,
        ),
        Expanded(
          child: DropdownButton(
            value: selectedOption,
            items: getDropdownOptions(),
            onChanged: (opt) {
              setState(() {
                selectedOption = opt.toString();
              });
            },
          ),
        )
      ],
    );
  }
}
