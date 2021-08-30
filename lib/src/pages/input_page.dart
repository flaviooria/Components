import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = "";
  String _email = "";
  String _pass = "";
  String _date = "";
  String _optionSelected = "Volar";

  List<String> _powers = ["Volar", "Rayos X", "Veloz", "Super Fuerza"];

  late TextEditingController _controller;

  @override
  void initState() {
    //Inicio el controller esto no servira para manejar la informacion
    //Entre nuestros widgets.
    _controller = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página de Inputs"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: <Widget>[
          _createInput(),
          Divider(
            height: 30.0,
          ),
          _createContactUser(),
          Divider(
            height: 30.0,
          ),
          _createDate(context),
          Divider(
            height: 30.0,
          ),
          _createDropDown(),
          Divider(
            height: 30.0,
          ),
          _createUser(),
          Divider(
            height: 30.0,
          ),
        ],
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
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
        print(_name);
      },
    );
  }

  Widget _createUser() {
    return Column(
      children: [
        ListTile(
          title: Text("Nombre del usuario: $_name"),
          subtitle: Text("Poder: $_optionSelected"),
        ),
        ListTile(
          title: Text("Correo electronico: $_email"),
        ),
        ListTile(
          title: Text("Contraseña: $_pass"),
        )
      ],
    );
  }

  Widget _createContactUser() {
    return Column(
      children: <Widget>[
        TextField(
          //Esta propiedad define el tipo de campo que es.
          keyboardType: TextInputType.emailAddress,
          autofocus: true,
          decoration: InputDecoration(
              //El hintext es igual al placeholder en html
              hintText: "Ingresa tu correo",
              //Es el texto de ayuda
              helperText: 'Ingresa un correo valido',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              //Label para indicar el nombre del input
              labelText: "Correo",
              //Propiedad para agregar un icono en la parte final del input
              suffixIcon: Icon(Icons.alternate_email),
              icon: Icon(Icons.email)),
          onChanged: (value) {
            setState(() {
              _email = value;
            });
            print(_name);
          },
        ),
        Divider(),
        TextField(
          //Esta propiedad define el tipo de campo que es.
          keyboardType: TextInputType.text,
          //Propiedad que nos sirve para ocultar la contraseña
          obscureText: true,
          autofocus: true,
          decoration: InputDecoration(
              //El hintext es igual al placeholder en html
              hintText: "Ingresa tu contraseña",
              //Es el texto de ayuda
              helperText: 'Ingresa un contraseña valida',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              //Label para indicar el nombre del input
              labelText: "Contraseña",
              //Propiedad para agregar un icono en la parte final del input
              suffixIcon: Icon(Icons.lock_outlined),
              icon: Icon(Icons.password_outlined)),
          onChanged: (value) {
            setState(() {
              _pass = value;
            });
          },
        )
      ],
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      //Llamo al controller, el cual manejara la información que se le enviara.
      controller: _controller,
      //Propiedad que sirve para habilitar las opciones de texto, como copiar,pegar y cortar.
      enableInteractiveSelection: false,
      //Esta propiedad define el tipo de campo que es.
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          //El hintext es igual al placeholder en html
          hintText: "Fecha de nacimiento",
          //Es el texto de ayuda
          helperText: 'Ingresa tu fecha',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          //Label para indicar el nombre del input
          labelText: "Fecha Naciemiento",
          //Propiedad para agregar un icono en la parte final del input
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        //Desactiva el focus del input
        FocusScope.of(context).requestFocus(new FocusNode());
        //Obtenemos el calendario con sus propiedades.
        _getDatePicked(context);
      },
    );
  }

  Future _getDatePicked(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1999 - 01 - 01),
      lastDate: DateTime(2030),
      helpText: "Selecciona una fecha",
      locale: Locale("es", "ES"),
    );

    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _controller.text = _date;
      });
    }
    return picked;
  }

  List<DropdownMenuItem<String>> getOptionsDropDown() {
    List<DropdownMenuItem<String>> lists = [];

    _powers.forEach((element) {
      lists.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });

    return lists;
  }

  Widget _createDropDown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: <Widget>[
            Icon(Icons.select_all),
            SizedBox(
              width: 10.0,
            ),
            Text("Selecciona una opción")
          ],
        ),
        DropdownButton(
            items: getOptionsDropDown(),
            onChanged: (opt) {
              setState(() {
                //Manejo el estado y asigno la opción selecionada al valor que escoga en el menú
                _optionSelected = opt.toString();
              });
            },
            //Valor por defecto que aparecera, en la lista
            value: _optionSelected,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            )),
      ],
    );
  }
}
