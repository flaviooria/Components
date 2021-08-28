import 'package:flutter/material.dart';

import 'package:componentes2/src/utils/icono_string_util.dart';
import 'package:componentes2/src/providers/menu_provider.dart';

class HomePape extends StatelessWidget {
  const HomePape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
        //Sirve para quitar el boton de retroceso en la appbar
        automaticallyImplyLeading: false,
      ),
      body: _list(),
    );
  }

  Widget _list() {
    //Llamamos al loadData, que nos retorna un futureBuilder.
    return FutureBuilder(
      //El future propiedad, recibe el future con el metodo loadData.
      future: menuProvider.loadData(),
      //InitialData, de momento no trabajamos en el
      initialData: [],
      //builder se tiene que implementar, siempre servira para construir nuetra lista de widgets.
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        //Retornamos un listView de nuestra lista que vamos a construir a base del future data.
        return ListView(
          //Obtengo los datos del future snapshot.
          children: _listItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listItems(data, BuildContext context) {
    final List<Widget> options = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt["texto"]),
        leading: getIcon(opt["icon"]),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue[400]),
        onTap: () {
          //Aquí vamos a navegar a otra pantalla
          //De forma tradicional, usamos el objeto navigator

          //Creare la ruta, la cual llamo con el objet materialPageRoute y en el builder llamo a la pagina alertPage, estaria solo llamando a una sola ruta. ahora veremos
          //pasando por nombre de rutas.
          // final route = MaterialPageRoute(builder: (context) => AlertPage());
          // Navigator.push(context, route);

          //Ahora lo haremos pasando rutas por nombre.
          Navigator.pushNamed(context, opt["ruta"]);
        },
      );

      options..add(widgetTemp)..add(Divider());
    });

    return options;
  }
}
