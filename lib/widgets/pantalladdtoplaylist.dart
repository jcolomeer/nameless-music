import 'package:flutter/material.dart';
import '/datos.dart';

class PantallaAddtoPlaylist extends StatefulWidget {
  const PantallaAddtoPlaylist({Key? key}) : super(key: key);

  @override
  State<PantallaAddtoPlaylist> createState() => _PantallaAddtoPlaylistState();
}

class _PantallaAddtoPlaylistState extends State<PantallaAddtoPlaylist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Añadir a playlist'),
      ),
      body: _mainBodyAddtoPlaylist(),
    );
  }

  Widget _mainBodyAddtoPlaylist() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(child: _mostrarPlaylist()),
          ],
        ),
      ),
    );
  }

  Widget _mostrarPlaylist() {
    return ListView.builder(
      itemBuilder: _itemBuilder,
      itemCount: user.playlists.length,
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, user.playlists.keys.toList()[index]);
      },
      child: Card(
        child: ListTile(
          leading: Icon(Icons.playlist_play_rounded),
          title: Text('${user.playlists.keys.toList()[index]}'),
        ),
      ),
    );
  }
}
