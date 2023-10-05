import 'package:flutter/material.dart';
import 'widgets/pantallacancionesguardadas.dart';
import 'widgets/pantallasuggeriments.dart';
import 'widgets/pantallaabout.dart';
import 'widgets/pantallaalbumsguardados.dart';
import 'widgets/pantallaafegirc.dart';
import 'widgets/pantallaafegir.dart';
import 'widgets/pantallarecomanacions.dart';
import 'widgets/pantallausuari.dart';
import 'widgets/pantallalogin.dart';
import 'widgets/pantallaregistre.dart';
import 'widgets/pantallaresultados.dart';
import 'widgets/pantallasplash.dart';
import 'widgets/pantallabusqueda.dart';
import 'widgets/pantallatop.dart';
import 'widgets/pantallalibrary.dart';
import 'widgets/pantallaplaylist.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projecte Musica',
      theme: ThemeData(primaryColor: Color(0xFF151026)),
      //home: PantallaLogin(),
      routes: {
        "/": (context) => PantallaLogin(),
        "/register": (context) => PantallaRegistre(),
        "/splash": (context) => PantallaSplash(),
        "/top": (context) => PantallaTop(),
        "/busqueda": (context) => PantallaBusqueda(),
        "/resultados": (context) => PantallaResultados(),
        "/recomanacions": (context) => PantallaRecomanacions(),
        "/usuari": (context) => PantallaUsuari(),
        "/afegir": (context) => PantallaAfegir(),
        "/afegirc": (context) => PantallaAfegirCanco(),
        "/about": (context) => PantallaAbout(),
        "/llibreria": (context) => PantallaLibrary(),
        "/suggeriment": (context) => PantallaSuggeriment(),
        "/canciones": (context) => PantallaCancionesGuardadas(),
        "/albums": (context) => PantallaAlbumsGuardados(),
        "/playlist": (context) => PantallaPlaylist()
      },
      initialRoute: "/",
    );
  }
}
