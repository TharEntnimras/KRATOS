import 'package:flutter/material.dart';

class User {
  final String uid;
  final String name;
  final String? email;
  final String? photoURL;
  final String? tipo;
  final String? grado; // para docentes
  final String? semestre; // para estudiantes
  final String? antiguedad; // para docentes y administrativos
  final String? cargo; // para administrativos y docentes
  final bool? nuevo;
  final String? fecgrad;  // para ex alumnos
 

  User(
      {Key? key,
      this.grado,
      this.semestre,
      this.antiguedad,
      this.cargo,
      this.nuevo,
      required this.uid,
      required this.name,
      this.photoURL,
      this.tipo,
      this.fecgrad,
      this.email});
}
