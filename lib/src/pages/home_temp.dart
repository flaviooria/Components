import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ["Uno", "Dos", "Tres", "Cuatro", "Cinco"];

  //Aquí de momento trabajaremos con las listas!
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Componentes de mi lista"),
        ),
        body: ListView(
          //Tienes sus hijos que puede ser cualquier widget
          //children: _crearItems(),
          children: _crearItemsFormaCorta(),
        ));
  }

  //Metodo para retornar lista de widgets
  List<Widget> _crearItems() {
    //variable la cual se va a retornar
    List<Widget> list = <Widget>[];

    for (var opt in options) {
      //Itero en la lista de opciones y la añado en una variable de tipo listTile con los elementos
      final tempWidget = ListTile(
        title: Text(opt),
      );
      /*
      //Agrego los widgets creados a la lista
      list.add(tempWidget);
      //Agrego la división con el divider
      list.add(Divider(
        color: Colors.blue[400],
        height: 5
      ));
      */

      //Una forma más facíl que la anterior seria esta, que lo que hace es añadir los
      //elemtos y luego regresar a la lista y realizar de nuevo la siguiente operación

      list..add(tempWidget)..add(Divider(color: Colors.blue[400], height: 5));
    }
    return list;
  }

  List<Widget> _crearItemsFormaCorta() {
    return options.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item + "!"),
            subtitle: Text("Este es un subtitulo"),
            //Ahora colocaremos un widget al inicio llamado leadign
            leading: Icon(Icons.access_alarms),
            //Ahora colocaremos un widget al final llamado trailing
            trailing: Icon(Icons.keyboard_arrow_right_outlined),
          ),
          Divider(color: Colors.blue[400], height: 5),
        ],
      );
    }).toList();
  }
}
