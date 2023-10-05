import 'package:flutter/material.dart';
import '../datos.dart';

class PantallaCancionesGuardadas extends StatelessWidget {
  const PantallaCancionesGuardadas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Canciones guardadas"),
      ),
      body: _mainBodyCancionesGuardadas(),
    );
  }

  Widget _mainBodyCancionesGuardadas() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: _itemBuilder,
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.music_note_rounded),
        title: Text("" /*"${user.canciones_guardadas[index].titulo}"*/),
      ),
    );
  }
}
