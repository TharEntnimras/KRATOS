import 'dart:async';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kratos_pdd/Participacion/model/propuesta.dart';
import 'package:kratos_pdd/Participacion/repository/api_cloud_part.dart';
import 'package:kratos_pdd/User/model/user.dart';


class RepCloudPart {

  final _cloudPartAPI = ApiCloudPart();

  void updatePropuestaDB(Propuesta prop)=> _cloudPartAPI.updatePropuestaDB(prop);
  

  Stream<QuerySnapshot> get propuestasStream => _cloudPartAPI.propuestasStream; 

  Future<void> reaccionarProp(String pid, User user, int index)=> _cloudPartAPI.reaccionarProp(pid, user, index);
  
  Future<void> borrarReacdeProp(String pid, User user) => _cloudPartAPI.borrarReacdeProp(pid, user);
  // Future<void> updatePlaceData(Place place) => _cloudFirestoreAPI.updatePlaceData(place);
  // List<Place> buildPlaces(List<DocumentSnapshot> placesListsnapshot, User user)=> _cloudFirestoreAPI.buildPlaces(placesListsnapshot, user);
  // //List<CardImageWithFabIcon> buildPlaces(List<DocumentSnapshot> placesListSnapshot ) => _cloudFirestoreAPI.buildPlaces(placesListSnapshot);
  // List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreAPI.buildMyPlaces(placesListSnapshot);

  // Future likePlace(Place place, String uid) => _cloudFirestoreAPI.likePlace(place,uid);

Future<QuerySnapshot<Map<String, dynamic>>> get  getpropfuture => _cloudPartAPI.getpropfuture;
}