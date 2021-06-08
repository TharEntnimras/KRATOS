import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:kratos_pdd/User/bloc/bloc_user.dart';

import 'package:kratos_pdd/User/ui/screens/axis_central.dart';
import 'package:kratos_pdd/Foro/ui/screens/menu_drawer.dart';
import 'package:kratos_pdd/User/model/user.dart';
import 'package:kratos_pdd/User/ui/screens/new_user_screen.dart';
import 'package:kratos_pdd/User/ui/screens/sign_in_screen.dart';
import 'package:kratos_pdd/User/ui/widgets/build_axis.dart';
import 'package:kratos_pdd/widgets/loading_screen.dart';

class HomeApp extends StatelessWidget {
  late UserBloc userBloc;
  User user;
  HomeApp(this.user);
  //   Future<DocumentSnapshot<Map<String, dynamic>>> docu = Future.value(widget._db.doc('users/$widget.user.uid').get());
  //   Future<bool> getverif(String? uid) async {
  //   var docu = await widget._db.doc('users/$widget.user.uid').get();
  //   return docu.data()!.isEmpty;
  //  }
  //  verif=getverif(widget.user.uid);
  //   verif = docu.data()!.isEmpty;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    userBloc.verifsink.add(null);
    //userBloc.getverif(user.uid);

    //final Future verif = userBloc.getverif(user.uid!);
    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return LoadingScreen();
            case ConnectionState.done:
              return LoadingScreen();
            case ConnectionState.active:
              return BuildAxis(snapshot,user);
            case ConnectionState.none:
              return LoadingScreen();
            default:
              return LoadingScreen();
          }
        });
  }
}

  // Widget buildAxisC(AsyncSnapshot snapshot) {
  //   // user = u.User(
  //   //   uid: snapshot.data.uid,
  //   //   name: snapshot.data.displayName,
  //   //   email: snapshot.data.email,
  //   //   photoURL: snapshot.data.photoURL,);
  //   //print('ESTA FUNCANDO CARAJO $test');

  // }

