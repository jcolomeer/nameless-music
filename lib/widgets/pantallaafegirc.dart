import 'package:flutter/material.dart';

class PantallaAfegirCanco extends StatelessWidget {
  const PantallaAfegirCanco({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          "Afegir cançó",
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
                      onPressed: () {Navigator.of(context).pushNamed("/llibreria");},
                    child: Icon(Icons.list),
                    style: ElevatedButton.styleFrom(primary: Colors.black)))
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[800],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: "Títol de la cançó",
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: "Escriu el títol de la cançó",
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[800],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: "Nom de l'artista",
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: "Escriu el nom de l'artista de la cançó",
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[800],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: "Durada de la cançó",
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: "Format: minuts:segons",
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[800],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: "URL de la cançó",
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: "Escriu la URL de la cançó",
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              label: Text(
                'Afegir la cançó',
                style: TextStyle(fontSize: 20),
              ),
              icon: Icon(
                Icons.add,
              ),
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.white,
                minimumSize: Size(120, 60),
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
