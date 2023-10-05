import 'package:flutter/material.dart';

class PantallaSuggeriment extends StatelessWidget {
  const PantallaSuggeriment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          "Suggereix un canvi",
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
                    child: Icon(Icons.list),
                    style: ElevatedButton.styleFrom(primary: Colors.black)))
          ],
        ),
      ),
      body: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String nomAssociat =
      "Atrapasueños"; // se li passarà si es un àlbum, canço, artista i el titol associat

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: [
          Text(
            "Form associat a " + nomAssociat,
            style: TextStyle(color: Colors.white, fontSize: 28),
          ), // se li haura de passar a que correspon el form per variable
          Container(
            height: 10,
          ),
          Container(
            color: Colors.grey[600],
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: 20,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  labelText: "Raó del suggeriment",
                  labelStyle: TextStyle(color: Colors.white),
                  hintText:
                      "Introdueixi la raó per la qual ha iniciat el suggeriment",
                  hintStyle: TextStyle(color: Colors.white)),
              cursorColor: Colors.white,
            ),
          ),
          Container(
            height: 10,
          ),
          Container(
            color: Colors.grey[600],
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  labelText: "Dades noves en cas que s'hi apliqui",
                  labelStyle: TextStyle(color: Colors.white),
                  hintText:
                      "En cas de suggerir un canvi de dades, afegeixi les actualitzades",
                  hintStyle: TextStyle(color: Colors.white)),
              cursorColor: Colors.white,
            ),
          ),

          Container(
            height: 100,
          ),
          Center(
            child: TextButton(
              child: Text("Submit"),
              onPressed:
                  null, //-------------------------------------------------------------------------------------on pressed
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.grey[200],
                padding: EdgeInsets.all(20),
                minimumSize: Size(200, 25),
                shape: StadiumBorder(),
              ),
            ),
          )
        ],
      ),
    );
  }
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
