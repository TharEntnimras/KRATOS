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
      'owner': _db
          .doc("$USERS/${prop.ownerUid}"), //reference - tipo de dato referencia
      'Apoyo': FieldValue.arrayUnion([]),
      'Me encanta': FieldValue.arrayUnion([]),
      'Revisar': FieldValue.arrayUnion([]),
      'No Apoyo': FieldValue.arrayUnion([]),
      'fecha': prop.fecha,
      'comentarios': prop.comentarios
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

  Future<QuerySnapshot<Map<String, dynamic>>> propfuture = FirebaseFirestore.instance
      .collection(PROPUESTAS)
      .orderBy('fecha', descending: true).get(); // toList();

  Future<QuerySnapshot<Map<String, dynamic>>> get getpropfuture => propfuture;
  // escucha los cambios hechos a PROPUESTAS y actualiza automaticamente
  Stream<QuerySnapshot> propuestasStreamDB = FirebaseFirestore.instance
      .collection(PROPUESTAS)
      .orderBy('fecha', descending: true)
      .snapshots();
  Stream<QuerySnapshot> get propuestasStream => propuestasStreamDB;

  Future<void> reaccionarProp(String pid, u.User user, int index) async {
    DocumentReference refProp = _db.doc('$PROPUESTAS/$pid');


    if (index == 0) {
      await refProp.update({
        'Apoyo': FieldValue.arrayUnion([_db.doc("$USERS/${user.uid}")])
      }).then((value) => print('reaccion subida'));
    } else {
      if (index == 1) {
        await refProp.update({
          'Me encanta': FieldValue.arrayUnion([_db.doc("$USERS/${user.uid}")])
        });
      } else {
        if (index == 2) {
          await refProp.update({
            'Revisar': FieldValue.arrayUnion([_db.doc("$USERS/${user.uid}")])
          });
        } else {
          await refProp.update({
            'No Apoyo': FieldValue.arrayUnion([_db.doc("$USERS/${user.uid}")])
          });
        }
      }
    }

  }

  Future<void> borrarReacdeProp(String pid, u.User user) async {
    DocumentReference refProp = _db.doc('$PROPUESTAS/$pid');

    refProp.update({
      'Apoyo': FieldValue.arrayRemove([_db.doc("$USERS/${user.uid}")])
    });
    refProp.update({
      'Me encanta': FieldValue.arrayRemove([_db.doc("$USERS/${user.uid}")])
    });
    refProp.update({
      'Revisar': FieldValue.arrayRemove([_db.doc("$USERS/${user.uid}")])
    });
    refProp.update({
      'No Apoyo': FieldValue.arrayRemove([_db.doc("$USERS/${user.uid}")])
    });
  }
}
