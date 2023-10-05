import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class PantallaLogin extends StatefulWidget {
  const PantallaLogin({Key? key}) : super(key: key);

  @override
  State<PantallaLogin> createState() => _PantallaLoginState();
}

class _PantallaLoginState extends State<PantallaLogin> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  late TextEditingController _emailController, _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
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
          "Login",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Builder(
          builder: (BuildContext context) => Container(
            height: MediaQuery.of(context).size.height -
                Scaffold.of(context).widget.appBar!.preferredSize.height -
                152,
            child: Center(
              child: Form(
                key: _loginFormKey,
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
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                labelText: "Usuario",
                                labelStyle: TextStyle(color: Colors.white),
                                hintText: "Introduzca su nombre de usuario",
                                hintStyle: TextStyle(color: Colors.white)),
                            cursorColor: Colors.white,
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: _emailValidator,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 32.0, right: 32, bottom: 40),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                labelText: "Contraseña",
                                labelStyle: TextStyle(color: Colors.white),
                                hintText: "Introduzca su contraseña",
                                hintStyle: TextStyle(color: Colors.white)),
                            cursorColor: Colors.white,
                            controller: _passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: _passwordValidator,
                            obscureText: true,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: TextButton(
                        onPressed: () {
                          _login();
                        },
                        child: Text(
                          "Accedeix",
                          style: TextStyle(fontSize: 30),
                        ),
                        style: TextButton.styleFrom(
                            primary: Colors.black,
                            backgroundColor: Colors.white,
                            minimumSize: Size(200, 80)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "Encara no estàs registrat?",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/register");
              },
              child: Text(
                "Registra't aquí!",
                style: TextStyle(fontSize: 25),
              ),
              style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.white,
                  minimumSize: Size(200, 80)),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  String? _emailValidator(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value != null && !regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String? _passwordValidator(String? value) {
    if (value != null && value.length >= 6) return null;
    return 'Password must be longer than 6 characters';
  }

  void _login() {
    if (_loginFormKey.currentState!.validate()) {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then(_onValue, onError: _onError);
    }
  }

  FutureOr _onValue(UserCredential userCredential) {
    User? user = userCredential.user;
    if (user != null) {
      Navigator.of(context).pushNamedAndRemoveUntil("/top", (route) => false);
    }
  }

  void _onError(Object error) {
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
