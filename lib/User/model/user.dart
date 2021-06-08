import 'package:flutter/material.dart';

class User {
  final String uid;
  final String? name;
  final String? email;
  final String? photoURL;
  final String? tipo;
  final String? grado;
  final String? semestre;
  final String? antiguedad;
  final String? cargo;
  final bool? nuevo;
  final bool? verif;

  User(
      {Key? key,
      this.grado,
      this.semestre,
      this.antiguedad,
      this.verif,
      this.cargo,
      this.nuevo,
      required this.uid,
      required this.name,
      this.photoURL,
      this.tipo,
      this.email});
}
