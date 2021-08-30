import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  AnimatedContainerPage({Key? key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double width = 50.0;
  double height = 50.0;
  Color color = Colors.pink;
  BorderRadius borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Animated container"),
        ),
        body: Center(
            child: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          curve: Curves.fastLinearToSlowEaseIn,
          width: width,
          height: height,
          decoration: BoxDecoration(borderRadius: borderRadius, color: color),
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: changeForm,
          child: Icon(Icons.play_arrow),
        ));
  }

  void changeForm() {
    final random = Random();

    setState(() {
      width = random.nextInt(300).toDouble();
      height = random.nextInt(300).toDouble();
      color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}
