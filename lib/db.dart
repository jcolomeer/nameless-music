import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projecte_mobils/datos.dart';

Stream<List<Artista>> getListaArtistas() {
  return FirebaseFirestore.instance
      .collection('artistes')
      .snapshots()
      .map(listaArtistas);
}

Stream<List<Album>> getListaAlbums() {
  return FirebaseFirestore.instance
      .collection('albums')
      .snapshots()
      .map(listaAlbums);
}

Stream<List<Cancion>> getListaCanciones() {
  return FirebaseFirestore.instance
      .collection('canciones')
      .snapshots()
      .map(listaCancion);
}

Stream<List<Usuario>> getListaUsuarios() {
  return FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map(listaUsuario);
}
