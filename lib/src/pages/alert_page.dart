import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert page"),
      ),
      body: Center(
          child: ElevatedButton(
              child: Text("Mostra alerta"),
              style: ElevatedButton.styleFrom(
                  primary: Colors.red, shape: StadiumBorder()),
              onPressed: () => showAlert(context))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("titulo"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Este es un texto parte de una alerta"),
                  FlutterLogo(
                    size: 100,
                  )
                ],
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Cancel")),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Ok"))
              ],
            ),
        barrierDismissible: true);
  }
}
