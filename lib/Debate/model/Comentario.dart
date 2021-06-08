import 'package:flutter/material.dart';
import 'package:kratos_pdd/User/model/user.dart';

class Comentario {
  final String? cid;
  final User autor;
  final String conclusion;
  final String argumento;
  final int estlike;
  final int doclike;
  final int adlike;
  final int exlike;
  final int estno;
  final int docno;
  final int adno;
  final int exno;
  final int posicion;
  final List<Comentario> hilo;

  Comentario(
      this.cid,
      this.autor,
      this.conclusion,
      this.argumento,
      this.estlike,
      this.doclike,
      this.adlike,
      this.exlike,
      this.estno,
      this.docno,
      this.adno,
      this.exno,
      this.posicion,
      this.hilo,
  );
}
