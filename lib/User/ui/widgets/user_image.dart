import 'package:flutter/material.dart';
import 'package:kratos_pdd/User/model/user.dart';

class UserImage extends StatelessWidget {
  final User user;
  final AlignmentGeometry alineacion;
  final double size;
  UserImage(this.user, this.alineacion,this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alineacion,
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2.0,
            style: BorderStyle.solid,
          ),
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(user.photoURL!),
          )),
    );
  }
}
