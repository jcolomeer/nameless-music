import 'package:flutter/material.dart';

class PantallaTop extends StatefulWidget {
  PantallaTop({Key? key}) : super(key: key);

  @override
  State<PantallaTop> createState() => _PantallaTopState();
}

class _PantallaTopState extends State<PantallaTop> {
  late String texto;
  bool _listacancion = true, _listaalbum = false, _listaartista = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          "Top",
          style: TextStyle(color: Colors.white),
        ),
        leading: Image(
          image: AssetImage("assets/logo.JPG"),
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
                  onPressed: () {},
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
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
      body: _mainBodyTop(),
    );
  }

  @override
  void initState() {
    super.initState();
    texto = 'Cancion';
  }

  Widget _mainBodyTop() {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        texto = 'Cancion';
                        _listacancion = true;
                        _listaalbum = false;
                        _listaartista = false;
                      });
                    },
                    child: Text(
                      'Top Canicones',
                    ),
                  ),
                  Container(
                    color:
                        _listacancion == true ? Colors.blue : Colors.grey[900],
                    height: 2,
                    width: 100,
                  )
                ],
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        texto = 'Album';
                        _listacancion = false;
                        _listaalbum = true;
                        _listaartista = false;
                      });
                    },
                    child: Text('Top Albums'),
                  ),
                  Container(
                    color: _listaalbum == true ? Colors.blue : Colors.grey[900],
                    height: 2,
                    width: 100,
                  )
                ],
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        texto = 'Artista';
                        _listacancion = false;
                        _listaalbum = false;
                        _listaartista = true;
                      });
                    },
                    child: Text('Top Artistas'),
                  ),
                  Container(
                    color:
                        _listaartista == true ? Colors.blue : Colors.grey[900],
                    height: 2,
                    width: 100,
                  )
                ],
              )
            ],
          ),
          Expanded(
            child: _showList(),
          ),
        ],
      ),
    );
  }

  Widget _showList() {
    return ListView.builder(
      itemBuilder: _itemBuilder,
      itemCount: 100,
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return ListTile(
      leading: Text(
        '${index + 1}',
        style: TextStyle(color: Colors.white),
      ),
      title: Text(
        '$texto ${index + 1} ',
        style: TextStyle(color: Colors.white),
      ),
      trailing: Icon(
        Icons.favorite,
        color: Colors.white,
      ),
    );
  }
}
