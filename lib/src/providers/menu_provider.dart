//Con el show lo que hacemos es exponer solo el paquete vayamos a utilizar
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  List options = [];

  _MenuProvider() {
    //Aqui ya no es necesario tener que cargar el loadData al instanciar el constructor.
    //ya que podemos hacer directamente llamando al metodo y realizando un future builder.
    // loadData();
  }

  //Este metodo devuelve una promesa asincrona,teniendo como resultado las rutas del json que
  //estamos cargando.
  Future<List<dynamic>> loadData() async {
    final resp = await rootBundle.loadString("data/menu_opts.json");
    Map dataMap = json.decode(resp);
    options = dataMap["rutas"];

    return options;
  }
}

//Creamos una instancia del menu provider, la cual estaremos exponiendo.
final menuProvider = new _MenuProvider();
