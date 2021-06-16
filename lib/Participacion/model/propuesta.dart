import 'package:flutter/material.dart';
import 'package:kratos_pdd/Debate/model/Comentario.dart';
import 'package:kratos_pdd/User/model/user.dart';

class Propuesta {
  final String nomprop;
  final String problema;
  final String solucion;
  final String argumento;
  final String categoria;
  final String orden;
  final String ownerTipo;
  final String ownerUid;
  final String ownerName;
  final String? imageUrl;
  int estlike;
  int doclike;
  int adlike;
  int exlike;
  int estno;
  int docno;
  int exno;
  int adno;
  final String? fecha;
  List<Comentario>? comentarios;

  Propuesta({
    required this.orden,
    required this.nomprop,
    required this.problema,
    required this.solucion,
    required this.argumento,
    required this.categoria,
    required this.ownerTipo,
    required this.ownerName,
    required this.ownerUid,
    this.estlike = 0,
    this.doclike = 0,
    this.adlike = 0,
    this.exlike = 0,
    this.estno = 0,
    this.docno = 0,
    this.adno = 0,
    this.exno = 0,
    this.imageUrl,
    this.fecha,
    this.comentarios,
  });
}
