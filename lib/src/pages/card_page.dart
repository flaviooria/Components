import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  final _sizeBorder = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página Card"),
      ),
      body: ListView(
        //Estoy aplicando padding a todo
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          _cardType1(),
          SizedBox(
            height: 20.0,
          ),
          _cardType2(),
          SizedBox(
            height: 20.0,
          ),
          _cardType3(),
          SizedBox(
            height: 20.0,
          ),
          _cardType1(),
          SizedBox(
            height: 20.0,
          ),
          _cardType2(),
          SizedBox(
            height: 20.0,
          ),
          _cardType3(),
          SizedBox(
            height: 20.0,
          ),
          _cardType1(),
          SizedBox(
            height: 20.0,
          ),
          _cardType2(),
          SizedBox(
            height: 20.0,
          ),
          _cardType3(),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      //Esto servira para mostrar aun más la sombra de la card.
      elevation: 5.0,
      //Con el shape dibujamos la forma de la card, como bordes.
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_sizeBorder)),
      child: Column(
        children: [
          ListTile(
            title: Text("Tarjeta de Regalo"),
            subtitle: Text("Cupon de 25%"),
            leading: Icon(
              Icons.card_giftcard_outlined,
              color: Colors.blueGrey[300],
              size: 24.0,
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey.shade300)),
                child: Text(
                  "Aceptar",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              width: 20.0,
            )
          ]),
        ],
      ),
      color: Colors.blue[200],
    );
  }

  Widget _cardType2() {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_sizeBorder)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          //El FadeInImage servira para generar una imagen de loading
          //hasta que cargue la imagen que estemos recibiendo.
          FadeInImage(
            placeholder: AssetImage("assets/jar-loading.gif"),
            image: NetworkImage(
                "https://www.ninoversace.com/wp-content/uploads/landscape-mountains-sky-4843193.jpg"),
            fadeInDuration: Duration(milliseconds: 800),
            height: 250.0,
            fit: BoxFit.cover,
          ),

          //Aqui cogeremos una imagen con la propiedad networkImage
          // Image(
          //     image: NetworkImage(
          //         "https://www.ninoversace.com/wp-content/uploads/landscape-mountains-sky-4843193.jpg")),
          Container(padding: EdgeInsets.all(10), child: Text("Himalaya"))
        ],
      ),
    );
  }

  Widget _cardType3() {
    //Otra forma de crear una card
    return Container(
        decoration: BoxDecoration(
            color: Colors.amber.shade100,
            borderRadius: BorderRadius.circular(_sizeBorder),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  blurRadius: 8,
                  color: Colors.blueGrey,
                  spreadRadius: 2,
                  offset: Offset(0, 5))
            ]),
        child:
            //La propiedad cliprrect nos permite corta cualquier cosa que este fuera del contenedor
            ClipRRect(
          borderRadius: BorderRadius.circular(_sizeBorder),
          child: Column(
            children: <Widget>[
              FadeInImage(
                placeholder: AssetImage("assets/jar-loading.gif"),
                image: NetworkImage(
                    "https://www.ninoversace.com/wp-content/uploads/landscape-mountains-sky-4843193.jpg"),
                fit: BoxFit.cover,
                fadeInDuration: Duration(milliseconds: 800),
              ),
              Container(
                child: ListTile(
                  title: Text(
                    "Tour Himalaya",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
