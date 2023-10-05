import 'package:flutter/material.dart';

class PantallaAbout extends StatelessWidget {
  const PantallaAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          "About Us",
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
      body: ListView(
        children: [
          Container(
            height: 8,
          ),
          Text("  Contacte",
              style: TextStyle(color: Colors.white, fontSize: 28)),
          Text("""

          Correu 1
          Correu 2
          Telèfon

          """, style: TextStyle(color: Colors.white, fontSize: 18)),
          _divisor(),
          Text("  Sobre Nosaltres",
              style: TextStyle(color: Colors.white, fontSize: 28)),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
                "Som tres estudiants de l'ESEIAAT, de diferents enginyeries, però coincidim en l'amor per el coneixement i la tecnologia.",
                style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
          _divisor(),
          _personer(
              nom: "Nom 1",
              about: "Descripcio 1",
              fotoPerfil: 'https://picsum.photos/250?image=9'),
          _personer(nom: "nom2", about: "about2"),
          _personer(nom: "nom3", about: "about3"),
        ],
      ),
    );
  }

  Container _divisor({double? ample}) {
    return Container(
      margin: EdgeInsets.all(20),
      width: ample,
      height: 10,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(40)),
    );
  }

  Widget _personer(
      {required String nom,
      required String about,
      String? fotoPerfil =
          'https://img.vixdata.io/pd/jpg-large/es/sites/default/files/t/tomb_raider_1_videojuego.jpg'}) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      fotoPerfil!), //petara, pero no passa res, no espantarsus
                  fit: BoxFit.cover,
                ),
                color: Colors.black,
                border: Border.all(color: Colors.white, width: 3),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
          Container(
            height: 12,
          ),
          Text(
            nom,
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          Text(
            about,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          _divisor(ample: 350),
        ],
      ),
    );
  }
}
