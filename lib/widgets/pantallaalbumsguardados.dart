import 'package:flutter/material.dart';
import '../datos.dart';

class PantallaAlbumsGuardados extends StatelessWidget {
  const PantallaAlbumsGuardados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Albums guardados"),
      ),
      body: _mainBodyAlbumsGuardados(),
    );
  }

  Widget _mainBodyAlbumsGuardados() {
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
        leading: Icon(Icons.album_rounded),
        title: Text("" /*"${user.albums_guardados[index].titulo}"*/),
      ),
    );
  }
}
