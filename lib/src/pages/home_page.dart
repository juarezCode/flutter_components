import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/alert_page.dart';
import 'package:flutter_components/src/providers/menu_provider.dart';
import 'package:flutter_components/src/utils/icono_string.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Components"),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    // print(menuProvider.opciones);

    return FutureBuilder(
        future: menuProvider.cargarData(),
        initialData: [],
        builder:
            (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) =>
                ListView(
                  children: listaItems(snapshot.data!, context),
                ));
  }

  List<Widget> listaItems(List<dynamic> lista, BuildContext context) {
    final List<Widget> opciones = [];
    lista.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blue,
        ),
        onTap: () {
          // final route = MaterialPageRoute(builder: (context) => AlertPage());
          // Navigator.push(context, route);

          Navigator.pushNamed(context, opt['ruta']);
        },
      );

      opciones.add(widgetTemp);
      opciones.add(Divider());
    });

    return opciones;
  }
}
