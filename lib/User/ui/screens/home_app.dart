import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:kratos_pdd/User/bloc/bloc_user.dart';

import 'package:kratos_pdd/User/ui/screens/axis_central.dart';
import 'package:kratos_pdd/Foro/ui/screens/menu_drawer.dart';
import 'package:kratos_pdd/User/model/user.dart'as u;
import 'package:kratos_pdd/widgets/back_sign_screen.dart';

class HomeApp extends StatelessWidget {
  
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    
    userBloc = BlocProvider.of(context);

    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: PageView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: [
                  buildAxisCentral(snapshot),
                  MenuDrawer(),
                ]),
          );
        }

        //
        );
  }


  Widget buildAxisCentral(AsyncSnapshot snapshot) {

    if (!snapshot.hasData || snapshot.hasError) {
      // print("NO ESTAS LOGUEADO PRRO");
      return Stack(
        children: <Widget>[
          BackSignScreen(),
          Center(child: Text('Usuario no logueado'),),
        ],
      );
    } else {
      var user = u.User(
      name: snapshot.data.displayName,
      email: snapshot.data.email,
      photoURL: snapshot.data.photoURL,
    );
    return AxisCentral(user);

    }

      
    }
}


