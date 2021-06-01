import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:kratos_pdd/User/bloc/bloc_user.dart';

import 'package:kratos_pdd/User/ui/screens/axis_central.dart';
import 'package:kratos_pdd/Foro/ui/screens/menu_drawer.dart';
import 'package:kratos_pdd/User/model/user.dart' as u;


class HomeApp extends StatelessWidget {
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);

    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.done:
              return CircularProgressIndicator();
            case ConnectionState.active:
              return buildAxisC(snapshot);
            case ConnectionState.none:
              return CircularProgressIndicator();
            default:
              return CircularProgressIndicator();
          }
        });
  }

  Scaffold buildAxisC(AsyncSnapshot snapshot) {

    var user = u.User(
      name: snapshot.data.displayName,
      email: snapshot.data.email,
      photoURL: snapshot.data.photoURL,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            AxisCentral(user),
            MenuDrawer(),
          ]),
    );
  }
}
