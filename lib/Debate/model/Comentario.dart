import 'package:flutter/material.dart';
import 'package:kratos_pdd/User/model/user.dart';

class Comentario {
  final String? cid;
  final String? ownerid;    // el id de firebase del autor
  final String autor;
  final String autorTipo;
  final String posicion;
  final String conclusion;
  final String argumento;
  final String? respuestaA;
  final int estlike;
  final int doclike;
  final int adlike;
  final int exlike;
  final int estno;
  final int docno;
  final int adno;
  final int exno;
  final DateTime? fecha;
  final List<Comentario>? hilo;

  Comentario({
    this.cid,
    this.ownerid,
    this.respuestaA,
    required this.autor,
    required this.posicion,
    required this.conclusion,
    required this.argumento,
    required this.autorTipo,
    this.fecha,
    this.estlike = 0,
    this.doclike = 0,
    this.adlike = 0,
    this.exlike = 0,
    this.estno = 0,
    this.docno = 0,
    this.adno = 0,
    this.exno = 0,
    this.hilo,
  });
}
