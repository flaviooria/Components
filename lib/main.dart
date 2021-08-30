import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:componentes2/src/routes/routes.dart';
import 'package:componentes2/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      //Estas propiedades sirve para tener tanto el idioma ingles o español
      //https://flutter.dev/docs/development/accessibility-and-localization/internationalization#introduction-to-localizations-in-flutter
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'), // English, no country code
        Locale('es', 'ES'), // Spanish, no country code
      ],
      initialRoute: "/",
      //Aquí agrego mis rutas, la cual necesitan estar definidas par ser utilizadas
      //en mi pagina de home_page
      routes: getRoutesAplication(),
      //Aquí agregaremos el onGenerateRoute que nos devuelve una ruta de tipo dinamico.
      /*Este generate route nos servira tambien por si no tenemos una ruta definida y hacemos click,te redirige a la ruta que le indiques.
      */
      onGenerateRoute: (RouteSettings route) {
        return MaterialPageRoute(builder: (context) => HomePape());
      },
    );
  }
}
