import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kratos_pdd/Participacion/model/propuesta.dart';
import 'package:kratos_pdd/User/model/user.dart' as u;

class ApiCloudPart {
  static final String USERS = "users";
  static final String PROPUESTAS = "propuestas";

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> updatePropuestaDB(Propuesta prop) async {
    CollectionReference refProp = _db.collection(PROPUESTAS);
    //var user = _auth.currentUser;
    refProp.add({
      'nomprop': prop.nomprop,
      'problema': prop.problema,
      'solucion': prop.solucion,
      'argumento': prop.argumento,
      'categoria': prop.categoria,
      'orden': prop.orden,
      'ownerTipo': prop.ownerTipo,
      'ownerName': prop.ownerName,
      'imageUrl': prop.imageUrl,
      'owner':
          _db.doc("$USERS/${prop.ownerUid}"), //reference - tipo de dato referencia
      'estlike': FieldValue.arrayUnion([]),
      'doclike': FieldValue.arrayUnion([]),
      'adlike': FieldValue.arrayUnion([]),
      'exlike': FieldValue.arrayUnion([]),
      'estno': FieldValue.arrayUnion([]),
      'docno': FieldValue.arrayUnion([]),
      'adno': FieldValue.arrayUnion([]),
      'exno': FieldValue.arrayUnion([]),
      'fecha': prop.fecha,
      'comentarios': FieldValue.arrayUnion([])
    }).then((DocumentReference dr) {
      dr.get().then((DocumentSnapshot snapshot) {
       
        DocumentReference refUsers = _db.collection(USERS).doc(prop.ownerUid);
        refUsers.update({
          'propuestas':
              FieldValue.arrayUnion([_db.doc("$PROPUESTAS/${snapshot.id}")])
        });
      });
    }).then((value) => print('CARGA DE PROPUESTA TERMINADA'));
  }
}
