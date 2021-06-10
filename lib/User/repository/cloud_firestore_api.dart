import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kratos_pdd/User/model/user.dart' as u;

class CloudFirestoreAPI {
  static final String USERS = "users";
  static final String PROPUESTAS = "propuestas";

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  StreamController estaverificado = StreamController.broadcast();
  Stream get getestaverificado => estaverificado.stream;

  StreamSink get verifsink => estaverificado.sink;

  void updateNewUserData(u.User user) async {
    DocumentReference ref = _db.collection(USERS).doc(user.uid);
    return ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'tipo': user.tipo,
      'grado': user.grado,
      'semestre': user.semestre,
      'antiguedad': user.antiguedad,
      'cargo': user.cargo,
      'nuevo': true,
      'fecgrad': user.fecgrad,
    }).then((value) => {

          estaverificado.sink.add(false),

          print('CARGA DE DATOS DE USUARIO TERMINADA')
    });
  }

  // jala un campo de la firestore como un FUTURO
  // aca esta verificando si los documentos estan VACIOS
  //al realizar al consulta
  getverif(String uid) async {
    await _db.doc('$USERS/$uid').get().then((docu) => {
          estaverificado.sink.add(docu.data()?.isEmpty),

          print('ESTE EES EL VALOR DEL GET : ${docu.data()?.isEmpty}')
        });

    // return docu.data()!.isEmpty;
  }

  void disposeStreamVerficado() {
    estaverificado.close();
  }

  Future getDocUserDB(String uid) async {
    var document = await _db.doc('$USERS/$uid').get();
    return document;
    // document.get() => then(function(document){
    // print(document("name"));
  }
}

// Future<void> updatePlaceData(Place place) async {
//   CollectionReference refPlaces = _db.collection(PLACES);
//   var user = _auth.currentUser;
//   refPlaces.add(
//     {
//     'name' : place.name,
//     'description' : place.description,
//     'likes' : place.likes,
//     'urlImage' : place.urlImage,
//     'liked': place.liked,
//     'userOwner' : _db.doc("$USERS/${user.uid}"), //reference - tipo de dato referencia
//     'usersLiked': FieldValue.arrayUnion([ ])
//     }
//   ).then((DocumentReference dr) {
//     dr.get().then((DocumentSnapshot snapshot){
//         snapshot.id; // ID del LUGAR  - EN UN ARRAY
//         DocumentReference refUsers = _db.collection(USERS).doc(user.uid);

//         refUsers.update({
//           'myPlaces': FieldValue.arrayUnion([_db.doc("$PLACES/${snapshot.id}")])
//         });

//     });
//   });

// }

//  // Se encarga de procesor los datos del snapshot que se trae de Firestore
// // y ponerlos en una lista creada aca para ser mostrada

// List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot){
//   List<ProfilePlace> profilePlaces = List<ProfilePlace>();
//   placesListSnapshot.forEach((p) {
//     profilePlaces.add(ProfilePlace(
//       Place(
//         name: p.get('name'),//p.data['name'],
//         description: p.get('description'),
//         urlImage: p.get('urlImage'),
//         likes:  p.get('likes')

//         )
//     ));
//    });

//   return profilePlaces;
// }

// List<Place> buildPlaces(List<DocumentSnapshot> placesListsnapshot, u.User user){
//   List<Place> places = List<Place>();
//   //List usersLikedRefs;

//   placesListsnapshot.forEach((p) {
//     Place place = Place(
//       id: p.id ,
//       name: p.get("name"),
//       description: p.get('description'),
//       urlImage: p.get('urlImage'),
//       liked: p.get('liked'),
//       likes: p.get('likes')

//       );

//       // verificacion de imagenes likeadas por el usuario
//       List usersLikedRefs = p.get('usersLiked');
//             place.liked = false;
//             usersLikedRefs?.forEach((drUL) {
//             if(user.uid == drUL.id){
//             place.liked = true;
//         }
//        });

//     places.add(place);

//   });

//   return places;

// }

// Future likePlace (Place place, String uid) async {
//   await _db.collection(PLACES).doc(place.id).get()
//   .then(( DocumentSnapshot ds) {
//       int likes = ds.get("likes");

//       _db.collection(PLACES).doc(place.id).
//       update({
//         'liked': place.liked,
//         'likes': place.liked?likes+1:likes-1,
//         'usersLiked': place.liked?
//                       FieldValue.arrayUnion([_db.doc("$USERS/$uid")]):
//                       FieldValue.arrayRemove([_db.doc("$USERS/$uid")])

//       });

//   });

// }
