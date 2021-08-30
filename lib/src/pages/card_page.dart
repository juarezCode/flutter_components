import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Page"),
      ),
      body: ListView(
          children: [_cardType1(), SizedBox(), _cardType2()],
          padding: EdgeInsets.all(10)),
    );
  }

  Widget _cardType1() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            title: Text("I am title"),
            subtitle: Text("This is a description example in card"),
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text("Cancel"),
                onPressed: () {},
              ),
              TextButton(
                child: Text("Ok"),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  final imageUrl =
      'https://store-images.s-microsoft.com/image/apps.13801.13777613854529434.257959da-c3a7-4c0c-bc46-4eab0d9b3b45.74fd1573-5988-4d86-bbaa-911fc4e99efe?mode=scale&q=90&h=1080&w=1920';

  Widget _cardType2() {
    final card = Container(
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage("assets/jar-loading.gif"),
            image: NetworkImage(imageUrl),
            fadeInDuration: Duration(milliseconds: 350),
            height: 300,
            fit: BoxFit.cover,
          ),
          Container(padding: EdgeInsets.all(10), child: Text("description"))
        ],
      ),
    );

    return Container(
        child: ClipRRect(
          child: card,
          borderRadius: BorderRadius.circular(30),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(1, 2))
            ]));
  }
}
