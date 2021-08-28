import 'package:componentes2/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Estilos del boton flotante
    final style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.fromLTRB(25, 5, 25, 5));

    return Scaffold(
      appBar: AppBar(
        title: Text("Página de Alerta"),
      ),
      body: Center(
        //Boton flotante que tiene la accion de donde mostraremos la alerta.
        child: ElevatedButton(
          child: Text("Mostrar Alerta"),
          onPressed: () => _showAlert(context),
          style: style,
        ),
      ),
      //Crearemos nuestro boton personalizado de regreso.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Objeto navigator pop y le pasamos el context.
          Navigator.pop(context);
        },
        child: Icon(Icons.keyboard_arrow_left_rounded),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    //Future que tiene la propiedad de mostrar el dialogo con el widget AlertDialog.
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Esto es una alerta"),
            //Este es el contenido de la alerta.
            content: Column(
              //Esto me ocupa el ancho minimo del contenido de la columna.
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Estamos usando un alert dialog en flutter."),
                Divider(
                  color: Colors.amber,
                  height: 30.0,
                ),
                FlutterLogo(
                  size: 100.0,
                )
              ],
            ),
            //Propiedad para dar estilos al titulo del texto.
            titleTextStyle: TextStyle(
                color: Colors.amber[50],
                fontWeight: FontWeight.bold,
                fontSize: 25),
            //Acciones donde tendre botones que navegaran entre las rutas.
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Cancelar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePape())),
                child: const Text('Aceptar',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
            backgroundColor: Colors.blue[600],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          );
        });
  }
}
