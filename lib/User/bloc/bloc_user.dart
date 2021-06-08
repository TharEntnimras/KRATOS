import 'dart:async';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_storage/firebase_storage.dart';

import 'package:kratos_pdd/User/model/user.dart' as u;
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:kratos_pdd/User/repository/auth_repository.dart';
import 'package:kratos_pdd/User/repository/repository_cloud_firestore.dart';


class UserBloc implements Bloc {

  final _authrepository=AuthRepository();
  final _cloudFirestoreRepository = CloudFirestoreRepository();

  getstring(){
    return 'patata';
  }


  //FLUJO DE DATOS - stream
  //Stream - firebase 
  // Streamcontroller - se usa para definir nuestro propio flujod e datos, 
  // para definirlo o alterarlo, PERO firebase ya tiene su flujo asi que 
  // solo usaremos STREAM 
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;
  
  User? getcurrentUser() => FirebaseAuth.instance.currentUser;
  Future<UserCredential?> signIn()=> _authrepository.signInFireBase();




  // // registrar usuario en base de datos 
 
  void updateNewUserData(u.User user)=> _cloudFirestoreRepository.updateNewUserDataFirestore(user);
  
   getverif(String uid)=>_cloudFirestoreRepository.getverif(uid);

  Stream getestaverificado ()=> _cloudFirestoreRepository.getestaverificado();

  StreamSink get verifsink => _cloudFirestoreRepository.verifsink;

  // Future<void> updatePlaceData(Place place)=>_cloudFirestoreRepository.updatePlaceData(place);

  // // escucha los cambios hechos a PLACES y actualiza automaticamente
  // Stream <QuerySnapshot> placesListStream = FirebaseFirestore.instance.collection(CloudFirestoreAPI().PLACES).snapshots();
  // Stream<QuerySnapshot> get placesStream => placesListStream;

  // //lista de lugares - llamada y procesamiento del snapshot de firestore
  // List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreRepository.buildMyPlaces(placesListSnapshot);
  // Stream<QuerySnapshot> myPlacesListStream(String uid) => 
  //     FirebaseFirestore.instance.collection(CloudFirestoreAPI().PLACES)
  //     .where("userOwner", isEqualTo: FirebaseFirestore.instance.doc('${CloudFirestoreAPI().USERS}/$uid'))
  //     .snapshots();
  
  // Future likePlace(Place place, String uid) => _cloudFirestoreRepository.likePlace(place,uid);

  // List<Place> buildPlaces(List<DocumentSnapshot> placesListsnapshot, u.User user) => _cloudFirestoreRepository.buildPlaces(placesListsnapshot, user);
 
  // //List<CardImageWithFabIcon> buildPlaces(List<DocumentSnapshot> placesListSnapshot ) => _cloudFirestoreRepository.buildPlaces(placesListSnapshot);

  // final _firebaseStorageRepository = FirebaseStorageRepository();

  // Future<UploadTask> uploadFile(String path, File image) => _firebaseStorageRepository.uploadFile(path, image);

  @override 
  void dispose(){
   
  }


  signOut(){
    _authrepository.signOut(); 
  }



}