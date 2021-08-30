import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ["uno", "dos", "tres", "cuatro", "cinco"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Components")),
      body: ListView(children: crearItemsCorta()),
    );
  }

  List<Widget> crearItems() {
    List<Widget> list = [];

    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );

      list.add(tempWidget);
      list.add(Divider(
        thickness: 1,
        color: Colors.tealAccent,
      ));
    }
    return list;
  }

  List<Widget> crearItemsCorta() {
    return opciones
        .map((opt) => Column(
              children: [
                ListTile(
                  title: Text(opt),
                  subtitle: Text('subtitle'),
                  leading: Icon(Icons.ac_unit),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
                Divider(
                  thickness: 1,
                  color: Colors.amberAccent,
                )
              ],
            ))
        .toList();
  }
}
