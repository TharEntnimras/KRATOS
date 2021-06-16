import 'package:flutter/material.dart';
import 'package:kratos_pdd/User/model/user.dart';
 
class UserNameMail extends StatelessWidget {

  User user;
  UserNameMail(this.user);

  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 5.0),
            child: Text(
              user.name,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Gotham',
              ),
              textAlign: TextAlign.center,
            )),
        Text(user.email!,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.black,
              fontFamily: 'Gotham',
            )),
      ],
    );
  }
}