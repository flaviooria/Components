import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _currentValue = 100;
  bool isChecked = false;
  bool isCheckedTile = false;
  bool _lights = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliders"),
      ),
      body: Container(
        child: Column(children: <Widget>[
          _createSlider(),
          _createCheckBoxTile(),
          _createCheckbox(),
          _createSwitchTile(),
          _createImage(),
        ]),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
        //Color del track activo
        activeColor: Colors.pink,
        //Igual pero inactivo
        inactiveColor: Colors.purple.shade100,
        value: _currentValue,
        min: 0.0,
        max: 400.0,
        divisions: 5,
        label: _currentValue.round().toString() + "%",
        onChanged: (isChecked)
            ? null
            : (double valueState) {
                setState(() {
                  _currentValue = valueState;
                });
              });
  }

  Widget _createImage() {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image(
          image: NetworkImage(
              "https://media.revistagq.com/photos/60b4a531a091477bf296bfdd/master/pass/LOKI.jpg"),
          width: _currentValue,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _createCheckbox() {
    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
          isCheckedTile = false;
          _currentValue = isChecked ? 200.0 : _currentValue;
          print(isChecked);
        });
      },
    );
  }

  Widget _createCheckBoxTile() {
    return CheckboxListTile(
        title: Text("Activar Slider"),
        value: isCheckedTile,
        onChanged: (valor) {
          setState(() {
            isCheckedTile = valor!;
            isChecked = !isCheckedTile;
          });
        });
  }

  Widget _createSwitchTile() {
    return SwitchListTile(
      title: const Text('Luces'),
      value: _lights,
      onChanged: (bool value) {
        setState(() {
          _lights = value;
        });
      },
      secondary: const Icon(Icons.lightbulb_outline),
    );
  }
}
