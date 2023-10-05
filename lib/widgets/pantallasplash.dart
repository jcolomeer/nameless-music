import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class PantallaSplash extends StatefulWidget {
  const PantallaSplash({Key? key}) : super(key: key);

  @override
  _PantallaSplashState createState() => _PantallaSplashState();
}

class _PantallaSplashState extends State<PantallaSplash> {
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp().then(_onValue, onError: _onError);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          child: Image(
            image: AssetImage("assets/logo.JPG"),
          ),
        ),
      ),
    );
  }

  FutureOr _onValue(FirebaseApp value) {
    User? user = FirebaseAuth.instance.currentUser;
    late String ruta;
    if (user != null)
      ruta = "/top"; //llista top seria recomanable
    else
      ruta = "/login";
    Navigator.of(context).pushReplacementNamed(ruta);
  }

  void _onError(Object error) {
    error as FirebaseException;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("ERROR"),
              content: Text((error.message != null
                      ? "error message: ${error.message!}"
                      : "") +
                  "error code: ${error.code}\n\n" +
                  "Contacta amb els desenvolupadors"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("OK"))
              ],
            ));
  }
}
