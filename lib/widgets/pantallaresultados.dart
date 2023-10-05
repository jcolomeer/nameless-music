import 'package:flutter/material.dart';

class PantallaResultados extends StatelessWidget {
  const PantallaResultados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search),
            Text(
              " Resultados de la búsqueda",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        actions: [
          ElevatedButton(
            onPressed: () {},
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
    );
  }
}
