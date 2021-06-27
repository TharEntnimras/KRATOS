import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kratos_pdd/Debate/model/Comentario.dart';

class ApiCloudComment {
  static final String USERS = "users";
  static final String PROPUESTAS = "propuestas";
  static final String COMENTARIOS = "comentarios";
  static final String RESPUESTAS = "respuestas";

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  //final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> subirComentario(Comentario com, String pid) async {
    CollectionReference refCom =
        _db.collection(PROPUESTAS).doc(pid).collection(COMENTARIOS);

    refCom.add({
      'autor': com.autor,
      'autorTipo': com.autorTipo,
      'posicion': com.posicion,
      'conclusion': com.conclusion,
      'argumento': com.argumento,
      'owner': _db
          .doc("$USERS/${com.ownerid}"), //reference - tipo de dato referencia
      'estlike': 0,
      'doclike': 0,
      'adlike': 0,
      'exlike': 0,
      'estno': 0,
      'docno': 0,
      'adno': 0,
      'exno': 0,
      'fecha': com.fecha,
    }).then((value) => print('CARGA DE COMENTARIO TERMINADA'));
  }

  Future<void> subirRespuesta(Comentario com, String pid, String cid) async {
    CollectionReference refResp = _db
        .collection(PROPUESTAS)
        .doc(pid)
        .collection(COMENTARIOS)
        .doc(cid)
        .collection(RESPUESTAS);

    refResp.add({
      'autor': com.autor,
      'autorTipo': com.autorTipo,
      'posicion': com.posicion,
      'conclusion': com.conclusion,
      'argumento': com.argumento,
      'owner': _db
          .doc("$USERS/${com.ownerid}"), //reference - tipo de dato referencia
      'estlike': 0,
      'doclike': 0,
      'adlike': 0,
      'exlike': 0,
      'estno': 0,
      'docno': 0,
      'adno': 0,
      'exno': 0,
      'fecha': com.fecha,
      'respuestaA':com.respuestaA
    }).then((value) => print('CARGA DE RESPUESTA TERMINADA'));
  }

  Stream<QuerySnapshot> comentariosStream(String pid) =>
      FirebaseFirestore.instance
          .collection(PROPUESTAS)
          .doc(pid)
          .collection(COMENTARIOS)
          .snapshots();

  Stream<QuerySnapshot> respuestasStream(String pid, String cid) =>
      FirebaseFirestore.instance
          .collection(PROPUESTAS)
          .doc(pid)
          .collection(COMENTARIOS)
          .doc(cid)
          .collection(RESPUESTAS).orderBy('fecha', descending: false)
          .snapshots();
}
