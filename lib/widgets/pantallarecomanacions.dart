import 'package:flutter/material.dart';

class PantallaRecomanacions extends StatefulWidget {
  PantallaRecomanacions({Key? key}) : super(key: key);

  @override
  State<PantallaRecomanacions> createState() => _PantallaRecomanacionsState();
}

class _PantallaRecomanacionsState extends State<PantallaRecomanacions> {
  late String texto;
  bool _listacancion = true, _listaalbum = false, _listaartista = false;
  bool _selectag1 = true, _selectag2 = false, _selectag3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[700],
        onPressed: () {
          Navigator.of(context).pushNamed("/afegir");
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          "Recomanacions",
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
                    onPressed: () {},
                    child: Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
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
      child: SingleChildScrollView(
        child: Builder(
          builder: (BuildContext context) => Container(
            height: MediaQuery.of(context).size.height -
                Scaffold.of(context).widget.appBar!.preferredSize.height -
                79,
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      height: 60,
                      color: Colors.grey[800],
                      child: Center(
                        child: Row(
                          children: [
                            Container(
                                height: 60,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Icon(Icons.search),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.grey[800]),
                                )),
                            Expanded(
                              child: Container(
                                child: TextField(),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _selectag1 = true;
                                      _selectag2 = false;
                                      _selectag3 = false;
                                    });
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    child: Text(
                                      "Tag1",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                color: _selectag1 == true
                                    ? Colors.white
                                    : Colors.grey[900],
                                height: 2,
                                width: 70,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _selectag1 = false;
                                      _selectag2 = true;
                                      _selectag3 = false;
                                    });
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    child: Text(
                                      "Tag2",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                color: _selectag2 == true
                                    ? Colors.white
                                    : Colors.grey[900],
                                height: 2,
                                width: 70,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _selectag1 = false;
                                      _selectag2 = false;
                                      _selectag3 = true;
                                    });
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    child: Text(
                                      "Tag3",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                color: _selectag3 == true
                                    ? Colors.white
                                    : Colors.grey[900],
                                height: 2,
                                width: 70,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
                            'Canicones',
                          ),
                        ),
                        Container(
                          color: _listacancion == true
                              ? Colors.blue
                              : Colors.grey[900],
                          height: 2,
                          width: 70,
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
                          child: Text('Albums'),
                        ),
                        Container(
                          color: _listaalbum == true
                              ? Colors.blue
                              : Colors.grey[900],
                          height: 2,
                          width: 70,
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
                          child: Text('Artistas'),
                        ),
                        Container(
                          color: _listaartista == true
                              ? Colors.blue
                              : Colors.grey[900],
                          height: 2,
                          width: 70,
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
          ),
        ),
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
