import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_auth_api.dart';

class AuthRepository {
  final _firebaseAuthAPI = FirebaseAuthAPI();
  Future<UserCredential?> signInFireBase() => _firebaseAuthAPI.signIn();

  signOut()=> _firebaseAuthAPI.signOut();

  //getLogedUser()=> _firebaseAuthAPI.getLogedUser();
  

} 