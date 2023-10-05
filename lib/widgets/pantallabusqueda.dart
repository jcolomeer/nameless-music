import 'package:flutter/material.dart';

class PantallaBusqueda extends StatelessWidget {
  const PantallaBusqueda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search),
              Text(
                "Búsqueda",
                style: TextStyle(color: Colors.white),
              ),
            ],
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
                      onPressed: () {
                        Navigator.of(context).pushNamed("/llibreria");
                      },
                      child: Icon(Icons.list),
                      style: ElevatedButton.styleFrom(primary: Colors.black)))
            ],
          ),
        ),
        body: Container(
          color: Colors.grey[900],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Icon(Icons.search),
                        style:
                            ElevatedButton.styleFrom(primary: Colors.grey[800]),
                      )),
                  Expanded(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                        color: Colors.grey[700],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: "Búsqueda simple",
                              labelStyle: TextStyle(color: Colors.white),
                              hintText:
                                  "Introduzca el contenido de la búsqueda simple",
                              hintStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              Text(
                "Búsqueda avanzada",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      Text(
                        "Canción",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      Text(
                        "Álbum",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      Text(
                        "Artista",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )
                ],
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
                          labelText: "Buscar por título",
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: "Introduzca el título de la búsqueda",
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
                          labelText: "Buscar por nombre del artista",
                          labelStyle: TextStyle(color: Colors.white),
                          hintText:
                              "Introduzca el nombre del artista o artistas separado por comas",
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
                          labelText: "Buscar por tags",
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: "Separar los tags por comas '' , ''",
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                label: Text(
                  'Realizar búsqueda avanzada',
                  style: TextStyle(fontSize: 20),
                ),
                icon: Icon(
                  Icons.search,
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
        ));
  }
}
