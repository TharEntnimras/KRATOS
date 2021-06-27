import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'package:kratos_pdd/Debate/model/Comentario.dart';
import 'package:kratos_pdd/Debate/repository/repo_cloud_comment.dart';

class CommBloc implements Bloc {
  final _cloudComRepo = RepoCloudComment();

  void subirComentario(Comentario com, String pid) =>
      _cloudComRepo.subirComentario(com, pid);

  void subirRespuesta(Comentario com, String pid, String cid) =>
      _cloudComRepo.subirRespuesta(com, pid, cid);

  Stream<QuerySnapshot> comentariosStream(String pid) =>
      _cloudComRepo.comentariosStream(pid);

  Stream<QuerySnapshot> respuestasStream(String pid, String cid) =>
      _cloudComRepo.respuestasStream(pid, cid);

  List<Comentario> buildComentarios(List<DocumentSnapshot> commSnapshots) {
    List<Comentario> comentarios = [];
    commSnapshots.forEach((p) {
      Comentario com = Comentario(
        autor: p.get('autor'),
        posicion: p.get('posicion'),
        conclusion: p.get('conclusion'),
        argumento: p.get('argumento'),
        autorTipo: p.get('autorTipo'),
        cid: p.id,
        ownerid: p.get('owner').id,
      );
      comentarios.add(com);
    });
    return comentarios;
  }

  List<Comentario> buildRespuestas(List<DocumentSnapshot> commSnapshots) {
    List<Comentario> comentarios = [];
    commSnapshots.forEach((p) {
      Comentario com = Comentario(
        autor: p.get('autor'),
        posicion: p.get('posicion'),
        conclusion: p.get('conclusion'),
        argumento: p.get('argumento'),
        autorTipo: p.get('autorTipo'),
        cid: p.id,
        ownerid: p.get('owner').id,
        respuestaA: p.get('respuestaA')
      );
      comentarios.add(com);
    });
    return comentarios;
  }

  getstring() {
    return 'patatacom';
  }

  @override
  void dispose() {}
}
