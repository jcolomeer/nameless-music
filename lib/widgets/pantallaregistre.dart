import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projecte_mobils/datos.dart';

class PantallaRegistre extends StatefulWidget {
  const PantallaRegistre({Key? key}) : super(key: key);

  @override
  State<PantallaRegistre> createState() => _PantallaRegistreState();
}

class _PantallaRegistreState extends State<PantallaRegistre> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  late TextEditingController _emailController,
      _passwordController,
      _nameController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "Registre",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Builder(
          builder: (BuildContext context) => Container(
            height: MediaQuery.of(context).size.height -
                Scaffold.of(context).widget.appBar!.preferredSize.height -
                79,
            child: Form(
              key: _registerFormKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage("assets/logo.JPG")),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 100, left: 32.0, right: 32, bottom: 30),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: TextFormField(
                            controller: _nameController,
                            keyboardType: TextInputType.name,
                            validator: _nameValidator,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                labelText: "Usuario",
                                labelStyle: TextStyle(color: Colors.white),
                                hintText: "Introduzca su nombre de usuario",
                                hintStyle: TextStyle(color: Colors.white)),
                            cursorColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 32.0, right: 32, bottom: 30),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: _emailValidator,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                labelText: "Correo electrónico",
                                labelStyle: TextStyle(color: Colors.white),
                                hintText: "Introduzca su correo electrónico",
                                hintStyle: TextStyle(color: Colors.white)),
                            cursorColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 32.0, right: 32, bottom: 50),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: TextFormField(
                            controller: _passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: _passwordValidator,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                labelText: "Contraseña",
                                labelStyle: TextStyle(color: Colors.white),
                                hintText: "Introduzca su contraseña",
                                hintStyle: TextStyle(color: Colors.white)),
                            cursorColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            _register();
                          },
                          child: Text(
                            "Registrar",
                            style: TextStyle(fontSize: 25),
                          ),
                          style: TextButton.styleFrom(
                              primary: Colors.black,
                              backgroundColor: Colors.white,
                              minimumSize: Size(80, 50)),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Cancelar",
                            style: TextStyle(fontSize: 25),
                          ),
                          style: TextButton.styleFrom(
                              primary: Colors.black,
                              backgroundColor: Colors.white,
                              minimumSize: Size(80, 50)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? _emailValidator(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value != null && !regex.hasMatch(value)) {
      return 'El format del correu és invàlid';
    } else {
      return null;
    }
  }

  String? _passwordValidator(String? value) {
    if (value != null && value.length >= 6) return null;
    return 'La contrassenya ha de contenir més de 6 caràcters';
  }

  String? _nameValidator(String? value) {
    if (value != null && value.length >= 3) return null;
    return 'El nom ha de tenir més de 3 caràcters';
  }

  void _register() {
    if (_registerFormKey.currentState!.validate()) {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then(_onvalue, onError: _onerror);
    }
  }

  FutureOr _onvalue(UserCredential userCredential) {
    Usuario user = Usuario(
        id: userCredential.user!.uid,
        nombre: _nameController.text,
        correo: _emailController.text,
        password: 'password',
        canciones_guardadas: [],
        albums_guardados: [],
        playlists: []);
    FirebaseFirestore.instance.collection('users').add(user.toJson());
    FirebaseAuth.instance.currentUser!.updateDisplayName(_nameController.text);
    /*.then(
        (value) => Navigator.of(context)
            .pushNamedAndRemoveUntil("/top", (route) => false));*/
    /* FirebaseFirestore.instance
        .collection("users")
        .doc(userCredential.user!.uid)
        .set({
      "nombre": _nameController.text,
      "email": _emailController.text, // user.toJson
    }); // et crea el document on anirà l'usuari i li fiquem un map on li inicilaitzem el nom de l'usuari
    */
    Navigator.of(context).pushNamedAndRemoveUntil("/top", (route) => false);
  }

  _onerror(Object error) {
    error as FirebaseAuthException;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("ERROR"),
              content: Text((error.message != null
                      ? "Error message: ${error.message}"
                      : "") +
                  "\nError code: ${error.code}\n\n"),
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
