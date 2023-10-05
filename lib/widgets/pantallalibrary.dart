import 'package:flutter/material.dart';

class PantallaLibrary extends StatefulWidget {
  const PantallaLibrary({Key? key}) : super(key: key);

  @override
  _PantallaLibraryState createState() => _PantallaLibraryState();
}

class _PantallaLibraryState extends State<PantallaLibrary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          "Llibreria",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/usuari");
            },
            child: Icon(Icons.person_rounded),
            style: ElevatedButton.styleFrom(primary: Colors.grey[900]),
          ),
        ],
        centerTitle: true,
      ),
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
                    onPressed: () {},
                    child: Icon(
                      Icons.list,
                      color: Colors.green[300],
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.black)))
          ],
        ),
      ),
      body: mainBodyLibrary(),
    );
  }

  Widget mainBodyLibrary() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: _itemBuilder,
                itemCount:
                    6, //canciones guardadas, albums guardados, nº de playlists, crear playlist
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    if (index == 0)
      return _builderCanciones();
    else if (index == 1)
      return _builderAlbums();
    else if (index < /*nº de playlist*/ 3 + 2 /*builders anteriores*/)
      return _builderPlaylist(index - 1);
    else
      return _builderAddPlaylist();
  }

  Widget _builderCanciones() {
    return _elementCard(
      Icons.favorite,
      'Canciones guardadas',
    );
  }

  Widget _builderAlbums() {
    return _elementCard(
      Icons.album,
      'Albums guardados',
    );
  }

  Widget _builderPlaylist(int i) {
    return _elementCard(
      Icons.playlist_play_rounded,
      'Playlist $i',
    );
  }

  Widget _builderAddPlaylist() {
    return _elementCard(
      Icons.playlist_add_rounded,
      'Crear una playlist',
    );
  }

  Card _elementCard(IconData icon, String text) {
    return Card(
      child: ListTile(
        leading: Icon(
          icon,
        ),
        title: Text(text),
      ),
    );
  }
}
