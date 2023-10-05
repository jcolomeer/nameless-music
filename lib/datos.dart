import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:http/http.dart' as http;

class Artista {
  late String iddoc;
  String id;
  String nombre;
  Map<String, int> tags;
  List<String> albums;
  List<String> canciones;
  int? nacimiento;
  int? muerte;
  List<String?> redes;
  String? origen;
  List<String> integrantes;

  Artista.FromFirestore(DocumentSnapshot doc)
      : iddoc = doc.id,
        id = doc.data().toString().contains('id') ? doc.get('id') : '',
        nombre =
            doc.data().toString().contains('nombre') ? doc.get('nombre') : '',
        tags = doc.data().toString().contains('tags') ? doc.get('tags') : '',
        albums =
            doc.data().toString().contains('albums') ? doc.get('albums') : '',
        canciones = doc.data().toString().contains('canciones')
            ? doc.get('canciones')
            : '',
        nacimiento = doc.data().toString().contains('nacimiento')
            ? doc.get('nacimiento')
            : '',
        muerte =
            doc.data().toString().contains('muerte') ? doc.get('muerte') : '',
        redes = doc.data().toString().contains('redes') ? doc.get('redes') : '',
        origen =
            doc.data().toString().contains('origen') ? doc.get('origen') : '',
        integrantes = doc.data().toString().contains('integrantes')
            ? doc.get('integrantes')
            : '';

  Artista(
      {required this.id,
      required this.nombre,
      required this.tags,
      required this.albums,
      required this.nacimiento,
      required this.canciones,
      required this.muerte,
      required this.redes,
      required this.origen,
      required this.integrantes});

  Artista.fromAPI(Map<String, dynamic> json)
      : this(
            id: json["idArtist"],
            nombre: json["strArtist"],
            tags: json['strGenre'] == null ? {} : {json['strGenre']: 0},
            albums: [],
            nacimiento: json['intBornYear'] == null
                ? null
                : int.tryParse(json['intBornYear']),
            canciones: [],
            muerte: json['intDiedYear'] == null
                ? null
                : int.tryParse(json['intDiedYear']),
            redes: [
              json['strWebsite'],
              json['strFacebook'],
              json['strTwitter']
            ],
            origen: null,
            integrantes: []);

  Map<String, dynamic> toJson() => {
        'id': id,
        'nombre': nombre,
        'tags': tags,
        'albums': albums,
        "nacimiento": nacimiento,
        "canciones": canciones,
        "muerte": muerte,
        "redes": redes,
        "origen": origen,
        "integrantes": origen
      };

  Artista.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            nombre: json['nombre'],
            tags: json['tags'],
            albums: json['albums'],
            nacimiento: json['nacimiento'],
            canciones: json['canciones'].cast<Cancion>(),
            muerte: json['muerte'],
            redes: json['muerte'],
            origen: json['origen'],
            integrantes: json['integrantes']);
}

List<Artista> listaArtistas(QuerySnapshot query) =>
    query.docs.map((e) => Artista.FromFirestore((e))).toList();

///////////////////////////////////////////////////

class Album {
  late String iddoc;
  String id;
  String idart;
  String titulo;
  int? release;
  int likes;
  Map<String, int> tags;
  List<String> canciones;
  String? caratula;

  Album.FromFirestore(DocumentSnapshot doc)
      : iddoc = doc.id,
        id = doc.data().toString().contains('id') ? doc.get('id') : '',
        idart = doc.data().toString().contains('idart') ? doc.get('idart') : '',
        titulo =
            doc.data().toString().contains('titulo') ? doc.get('titulo') : '',
        release =
            doc.data().toString().contains('release') ? doc.get('release') : '',
        likes = doc.data().toString().contains('likes') ? doc.get('likes') : '',
        tags = doc.data().toString().contains('tags') ? doc.get('tags') : '',
        canciones = doc.data().toString().contains('canciones')
            ? doc.get('canciones')
            : '',
        caratula = doc.data().toString().contains('caratula')
            ? doc.get('caratula')
            : '';

  Album(
      {required this.id, //
      required this.idart, //
      required this.titulo, //
      required this.release, //
      required this.likes,
      required this.tags, //
      required this.canciones, //
      required this.caratula});

  Map<String, dynamic> toJson() => {
        'id': id,
        'idart': idart,
        'titulo': titulo,
        "release": release,
        "canciones": canciones,
        "likes": likes,
        "tags": tags,
        "canciones": canciones,
        "caratula": caratula
      };

  Album.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          idart: json['idart'],
          titulo: json['titulo'],
          release: json['release'],
          likes: json['likes'],
          tags: json['tags'],
          canciones: json['canciones'],
          caratula: json['caratula'],
        );

/*
  Album.fromAPI(Map<String, dynamic> json)
      : this(
          id: json["idAlbum"],
          idart: json["idArtist"],
          tags: json['strGenre'] == null ? {} : {json['strGenre']: 0},
          titulo: json['strAlbum'],
          release: json['intYearReleased'] == null
              ? null
              : int.tryParse(json['intYearReleased']),
          canciones: [],
          caratula:
              json['strAlbumThumb'] == null ? null : (json['strAlbumThumb']),
          likes: 0,
        );
*/
}

List<Album> listaAlbums(QuerySnapshot query) =>
    query.docs.map((e) => Album.FromFirestore((e))).toList();

class Cancion {
  late String iddoc;
  String id;
  String idalbum;
  String idart;
  String titulo;
  int likes;
  int? min, seg;
  Map<String, int> tags;
  String? url;
  //List<Artista> artistas;
  //List<String?> caratulaalbum;

  Cancion({
    required this.id, //
    required this.idalbum, //
    required this.idart, //
    required this.titulo, //
    required this.likes, //
    required this.min, //
    required this.seg, //
    required this.tags, //
    required this.url,
    //required this.artistas,
    //required this.caratulaalbum,
  });

  Cancion.FromFirestore(DocumentSnapshot doc)
      : iddoc = doc.id,
        id = doc.data().toString().contains('id') ? doc.get('id') : '',
        idalbum =
            doc.data().toString().contains('idalbum') ? doc.get('idalbum') : '',
        idart = doc.data().toString().contains('idart') ? doc.get('idart') : '',
        titulo =
            doc.data().toString().contains('titulo') ? doc.get('titulo') : '',
        likes = doc.data().toString().contains('likes') ? doc.get('likes') : '',
        min = doc.data().toString().contains('min') ? doc.get('min') : '',
        seg = doc.data().toString().contains('seg') ? doc.get('seg') : '',
        tags = doc.data().toString().contains('tags') ? doc.get('tags') : '',
        url = doc.data().toString().contains('url') ? doc.get('url') : '';

/*
  Cancion.fromAPI(Map<String, dynamic> json)
      : this(
          id: json["idTrack"],
          idalbum: json["idAlbum"],
          idart: json["idArtist"],
          titulo: json['strTrack'],
          likes: 0,
          min: null,
          seg: null,
          tags: json['strGenre'] == null ? {} : {json['strGenre']: 0},
          url: null,
        );
*/
  Map<String, dynamic> toJson() => {
        'id': id,
        'idart': idart,
        'idalbum': idalbum,
        "titulo": titulo,
        "likes": likes,
        "min": min,
        "seg": seg,
        "tags": tags,
        "url": url,
      };

  Cancion.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          idart: json['idart'],
          idalbum: json['idalbum'],
          titulo: json['titulo'],
          likes: json['likes'],
          min: json['min'],
          seg: json['seg'],
          tags: json['tags'],
          url: json['url'],
        );
}

List<Cancion> listaCancion(QuerySnapshot query) =>
    query.docs.map((e) => Cancion.FromFirestore((e))).toList();

class Usuario {
  late String iddoc;
  String? id;
  String nombre;
  String correo;
  String? password;
  List<String> canciones_guardadas;
  List<String> albums_guardados;
  List<String> playlists;

  Usuario.FromFirestore(DocumentSnapshot doc)
      : iddoc = doc.id,
        id = doc.data().toString().contains('id') ? doc.get('id') : '',
        nombre =
            doc.data().toString().contains('nombre') ? doc.get('nombre') : '',
        correo =
            doc.data().toString().contains('correo') ? doc.get('correo') : '',
        password = doc.data().toString().contains('password')
            ? doc.get('password')
            : '',
        canciones_guardadas =
            doc.data().toString().contains('canciones_guardadas')
                ? doc.get('canciones_guardadas')
                : '',
        albums_guardados = doc.data().toString().contains('albums_guardados')
            ? doc.get('albums_guardados')
            : '',
        playlists = doc.data().toString().contains('playlists')
            ? doc.get('playlists')
            : '';

  Usuario(
      {this.id,
      required this.nombre,
      required this.correo,
      required this.password,
      required this.canciones_guardadas,
      required this.albums_guardados,
      required this.playlists});

  Map<String, dynamic> toJson() => {
        'id': id,
        'nombre': nombre,
        "correo": correo,
        "canciones_guardadas": canciones_guardadas,
        "albums_guardados": albums_guardados,
        "playlists": playlists,
      };

  Usuario.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          nombre: json['nombre'],
          correo: json['correo'],
          password: json['password'],
          canciones_guardadas: json['canciones_guardadas'].cast<String>(),
          albums_guardados: json['albums_guardados'].cast<String>(),
          playlists: json['playlists'].cast<String>(),
        );

  int getNumeroDeLikes() {
    return this.albums_guardados.length + this.canciones_guardadas.length;
  }

  int getNumeroDePlaylists() {
    return this.playlists.length;
  }
}

List<Usuario> listaUsuario(QuerySnapshot query) =>
    query.docs.map((e) => Usuario.FromFirestore((e))).toList();

/*
List<Artista> Artistes = [
  Artista(
      nombre: "System of a Down",
      tags: {"Rock": 100, "Metal": 2, "Hard rock": 1, "Metal alternativo": 8},
      albums: [Albums[0]],
      nacimiento: 1994,
      canciones: [Canciones[0]],
      muerte: null,
      redes: null,
      origen: "EEUU",
      integrantes: 4),
  for (int i = 1; i <= 100; i++)
    Artista(
        nombre: "Artista $i",
        tags: {"Tag $i": 1},
        albums: [Albums[i]],
        nacimiento: 1,
        canciones: [Canciones[i]],
        muerte: 1,
        redes: null,
        origen: "x",
        integrantes: 1)
];
*/
