import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kratos_pdd/Participacion/model/propuesta.dart';
import 'package:kratos_pdd/Participacion/repository/api_cloud_part.dart';
import 'package:kratos_pdd/User/model/user.dart';

import 'package:kratos_pdd/User/repository/cloud_firestore_api.dart';

class RepCloudPart {

  final _cloudPartAPI = ApiCloudPart();

  void updatePropuestaDB(Propuesta prop)=> _cloudPartAPI.updatePropuestaDB(prop);
  


  
  // Future<void> updatePlaceData(Place place) => _cloudFirestoreAPI.updatePlaceData(place);
  // List<Place> buildPlaces(List<DocumentSnapshot> placesListsnapshot, User user)=> _cloudFirestoreAPI.buildPlaces(placesListsnapshot, user);
  // //List<CardImageWithFabIcon> buildPlaces(List<DocumentSnapshot> placesListSnapshot ) => _cloudFirestoreAPI.buildPlaces(placesListSnapshot);
  // List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreAPI.buildMyPlaces(placesListSnapshot);

  // Future likePlace(Place place, String uid) => _cloudFirestoreAPI.likePlace(place,uid);
}