import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kratos_pdd/User/model/user.dart';

import 'package:kratos_pdd/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository {

  final _cloudFirestoreAPI = CloudFirestoreAPI();
  void updateNewUserDataFirestore(User user)=> _cloudFirestoreAPI.updateNewUserData(user);
  
  getverif(String uid)=> _cloudFirestoreAPI.getverif(uid);
  Stream getestaverificado ()=> _cloudFirestoreAPI.getestaverificado;
  StreamSink get verifsink => _cloudFirestoreAPI.verifsink;
  disposeStreamVerificado() => _cloudFirestoreAPI.disposeStreamVerficado();

  Future getDocUserDB(String uid)=> _cloudFirestoreAPI.getDocUserDB(uid);

  
  // Future<void> updatePlaceData(Place place) => _cloudFirestoreAPI.updatePlaceData(place);
  // List<Place> buildPlaces(List<DocumentSnapshot> placesListsnapshot, User user)=> _cloudFirestoreAPI.buildPlaces(placesListsnapshot, user);
  // //List<CardImageWithFabIcon> buildPlaces(List<DocumentSnapshot> placesListSnapshot ) => _cloudFirestoreAPI.buildPlaces(placesListSnapshot);
  // List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreAPI.buildMyPlaces(placesListSnapshot);

  // Future likePlace(Place place, String uid) => _cloudFirestoreAPI.likePlace(place,uid);
}