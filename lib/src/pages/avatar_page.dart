import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  final avatarUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDqjgfphhuHg6odmgVgf6wBPAglPzkSn2kKg&usqp=CAU";
  final spidermanAvatar =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbmMQMRMZ1lXbBIiBtNULCzm4Kur_AZWJz8Q&usqp=CAU";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Avatar page"),
          actions: [
            Container(
              padding: EdgeInsets.all(5),
              child: CircleAvatar(
                backgroundImage: NetworkImage(avatarUrl),
                radius: 20,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                child: Text("SP"),
                backgroundColor: Colors.purple,
              ),
            )
          ],
        ),
        body: Center(
          child: FadeInImage(
            placeholder: AssetImage("assets/jar-loading.gif"),
            image: NetworkImage(spidermanAvatar),
          ),
        ));
  }
}
