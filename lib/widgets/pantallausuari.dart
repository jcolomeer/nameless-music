import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../datos.dart';

class PantallaUsuari extends StatefulWidget {
  const PantallaUsuari({Key? key}) : super(key: key);

  @override
  State<PantallaUsuari> createState() => _PantallaUsuariState();
}

class _PantallaUsuariState extends State<PantallaUsuari> {
  late final CollectionReference<Map<String, dynamic>> _usuarios;

  var currentUser = FirebaseAuth.instance.currentUser;

  void initState() {
    _usuarios = FirebaseFirestore.instance.collection('users');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? _name = currentUser!.displayName;
    String? _email = currentUser!.email;

    final FirebaseAuth _auth = FirebaseAuth.instance;

    Future<void> _signOut() async {
      await _auth.signOut();
    }

    Usuario? encontrarUsuarioConectado(BuildContext context,
        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
      var currentUser = FirebaseAuth.instance.currentUser;
      Usuario? u;
      int longitud = snapshot.data!.size;
      for (int i = 0; i < longitud; i++) {
        if (Usuario.fromJson(snapshot.data!.docs[i].data()).id ==
            currentUser!.uid) {
          u = Usuario.fromJson(snapshot.data!.docs[i].data());
        }
      }
      return u;
    }

    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/top");
                  },
                  child: Icon(Icons.favorite),
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                )),
            Container(
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/busqueda");
                    },
                    child: Icon(Icons.search),
                    style: ElevatedButton.styleFrom(primary: Colors.black))),
            Container(
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/recomanacions");
                    },
                    child: Icon(Icons.star),
                    style: ElevatedButton.styleFrom(primary: Colors.black))),
            Container(
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/llibreria");
                    },
                    child: Icon(Icons.list),
                    style: ElevatedButton.styleFrom(primary: Colors.black)))
          ],
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: StreamBuilder(
        stream: _usuarios.snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(backgroundColor: Colors.red),
              ),
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Usuario: ",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(encontrarUsuarioConectado(context, snapshot)!.nombre,
                      style: TextStyle(color: Colors.white, fontSize: 18))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Correo electrónico: ",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Text(encontrarUsuarioConectado(context, snapshot)!.correo,
                      style: TextStyle(color: Colors.white, fontSize: 15))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                          "${encontrarUsuarioConectado(context, snapshot)!.getNumeroDeLikes()}",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Playlists",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                          "${encontrarUsuarioConectado(context, snapshot)!.getNumeroDePlaylists()}",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  TextButton.icon(
                    onPressed: () {
                      _signOut();
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil("/", (route) => false);
                    },
                    label: Text(
                      'Log out',
                      style: TextStyle(fontSize: 20),
                    ),
                    icon: Icon(
                      Icons.exit_to_app,
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Colors.white,
                      minimumSize: Size(80, 50),
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person_rounded),
          Text(
            " Perfil de usuario",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      centerTitle: true,
    );
  }
}
