import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  AnimatedContainerPage({Key? key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  //Vamos a definir unas propiedades que se utilizaran en nuestro contendor
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.amber;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Página de Animación Contenedor")),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color,
          ),
          child: Text(""),
          duration: Duration(seconds: 1),
          curve: Curves.easeIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateAnimation,
        child: Icon(Icons.play_circle),
      ),
    );
  }

  void _generateAnimation() {
    setState(() {
      //Aqui importo el random,de la libreria dart math
      final random = Random();

      // Generate a random width and height.
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();

      // Generate a random color.
      _color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
    });
  }
}
