import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kratos_pdd/Debate/model/Comentario.dart';
import 'package:kratos_pdd/Debate/repository/api_cloud_comment.dart';

class RepoCloudComment {
  final _cloudComtAPI = ApiCloudComment();

  void subirComentario(Comentario com, String pid) =>
      _cloudComtAPI.subirComentario(com, pid);

  void subirRespuesta(Comentario com, String pid, String cid) =>
      _cloudComtAPI.subirRespuesta(com, pid, cid);

  Stream<QuerySnapshot> comentariosStream(String pid) =>
      _cloudComtAPI.comentariosStream(pid);

  Stream<QuerySnapshot> respuestasStream(String pid, String cid) =>
      _cloudComtAPI.respuestasStream(pid, cid);
}
