import 'package:flutter/material.dart';

class PantallaAfegir extends StatelessWidget {
  const PantallaAfegir({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          "Afegir",
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
            Text(
              "Què t'agradaria afegir?",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed("/afegirc");
              },
              label: Text(
                'Afegir cançó',
                style: TextStyle(fontSize: 25),
              ),
              icon: Icon(
                Icons.add,
              ),
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.white,
                minimumSize: Size(240, 100),
                alignment: Alignment.center,
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              label: Text(
                'Afegir àlbum',
                style: TextStyle(fontSize: 25),
              ),
              icon: Icon(
                Icons.add,
              ),
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.white,
                minimumSize: Size(240, 100),
                alignment: Alignment.center,
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              label: Text(
                'Afegir artista',
                style: TextStyle(fontSize: 25),
              ),
              icon: Icon(
                Icons.add,
              ),
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.white,
                minimumSize: Size(240, 100),
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
