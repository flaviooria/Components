import 'package:flutter/material.dart';

import 'package:componentes2/src/pages/animated_container.dart';
import 'package:componentes2/src/pages/card_page.dart';
import 'package:componentes2/src/pages/alert_page.dart';
import 'package:componentes2/src/pages/avatar_page.dart';
import 'package:componentes2/src/pages/home_page.dart';
import 'package:componentes2/src/pages/input_page.dart';

//Creo mi metodo que me devuelve mis lista de rutas, de esta forma es mucha mas dinamico y
//modularizado
Map<String, WidgetBuilder> getRoutesAplication() {
  return <String, WidgetBuilder>{
    "/": (context) => HomePape(),
    "alert": (context) => AlertPage(),
    "avatar": (context) => AvatarPage(),
    "card": (BuildContext context) => CardPage(),
    "animatedContainer": (context) => AnimatedContainerPage(),
    "inputs": (context) => InputPage()
  };
}
