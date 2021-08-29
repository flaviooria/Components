import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página de Inputs"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: <Widget>[_createInput(), Divider(), _createUser()],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      maxLength: 250,
      decoration: InputDecoration(
          //EL contador de palabras que se estan escribiendo
          counter: Text("Letras ${_name.length}"),
          //El hintext es igual al placeholder en html
          hintText: "Ingresa tu nombre",
          //Es el texto de ayuda
          helperText: 'No se aceptan números',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          //Label para indicar el nombre del input
          labelText: "Nombre",
          //Propiedad para agregar un icono en la parte final del input
          suffixIcon: Icon(Icons.accessibility)),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
        print(_name);
      },
    );
  }

  Widget _createUser() {
    //if (_name == null) _name = "";
    return ListTile(
      title: Text("Nombre del usuario: $_name"),
    );
  }
}
