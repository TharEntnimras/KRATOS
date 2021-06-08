import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {
  
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? purl;
  late User user;


  Future<UserCredential?> signIn() async {
    
    GoogleSignInAccount googleSignInAccount = (await googleSignIn.signIn())!;
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;
 
    UserCredential userc = await _auth.signInWithCredential(
    GoogleAuthProvider.credential(idToken: gSA.idToken, accessToken: gSA.accessToken)
    );
    return userc; 
  }


  signOut() async {
    await _auth.signOut().then((value) => print("sesion cerrada prro"));
    
    googleSignIn.signOut();
    print("sesiones cerradas");
  }


}