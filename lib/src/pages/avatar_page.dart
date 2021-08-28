import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página Avatar"),
        actions: <Widget>[
          //Aqui crearemos un circle de avatar, que son las que usan para los perfiles
          Container(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              child: Text(
                "FO",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blue[300],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              //Aqui estamos dandole una imagen de fondo al avatar
              backgroundImage: NetworkImage(
                  "https://resizer.lasprovincias.es/resizer/resizer.php?imagen=/deliverty/demo/resources/jpg/9/0/1339500520209.jpg&nuevoancho=950&nuevoalto=570&copyright=conCopyright&encrypt=false"),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: FadeInImage(
            image: NetworkImage(
                "https://pbs.twimg.com/profile_images/1284902610890358785/rvfVQkGK_400x400.jpg"),
            placeholder: AssetImage("assets/jar-loading.gif"),
            fadeOutDuration: Duration(milliseconds: 800),
          ),
        ),
      ),
    );
  }
}
