import 'package:flutter/material.dart';
import 'package:kratos_pdd/Debate/model/Comentario.dart';
import 'package:kratos_pdd/User/model/user.dart';

class Propuesta {
  final String? pid;
  final String? nomprop;
  final String? problema;
  final String? solucion;
  final String? argumento;
  final String? categoria;
  final String tipo;
  final User owner;
  final int estlike;
  final int doclike;
  final int adlike;
  final int exlike;
  final int estno;
  final int docno;
  final int adno;
  final int exno;
  final DateTime fecha;
  final List<Comentario> comentarios;

  Propuesta(
      this.pid,
      this.nomprop,
      this.problema,
      this.solucion,
      this.argumento,
      this.categoria,
      this.tipo,
      this.owner,
      this.estlike,
      this.doclike,
      this.adlike,
      this.exlike,
      this.estno,
      this.docno,
      this.adno,
      this.exno,
      this.fecha,
      this.comentarios, 
  );
}
