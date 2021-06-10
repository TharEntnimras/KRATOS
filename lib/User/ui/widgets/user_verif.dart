import 'package:flutter/material.dart';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:kratos_pdd/User/bloc/bloc_user.dart';

import 'package:kratos_pdd/User/model/user.dart';
import 'package:kratos_pdd/User/ui/screens/new_user_screen.dart';
import 'package:kratos_pdd/User/ui/widgets/user_db_build.dart';
import 'package:kratos_pdd/widgets/loading_screen.dart';


class UserVerif extends StatelessWidget {

  final User user;

  UserVerif(this.user);

  late UserBloc userBloc;


  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Scaffold(
      body: StreamBuilder(
        stream: userBloc.getestaverificado(),
        builder: (BuildContext context, snapshotdoc) {
          switch (snapshotdoc.connectionState) {
            case ConnectionState.waiting:
              return LoadingScreen();
            case ConnectionState.active:
              return buildverif(snapshotdoc, user);
            default:
              return LoadingScreen();
          }
        },
      ),
    );
  }

  Widget buildverif(snapshotdoc, user) {
    if (snapshotdoc.data == false || snapshotdoc.data != null) {
      //user = userBloc.getUserFromDB();
      //print('ESTE ES EL USUARIO DESDE LA DB: $user');
      return UserDBBuild(user);
    } else {
      //userBloc.getcurrentUser()!.delete();
      // auth.User logeduser =userBloc.getLogedUser();
      // logeduser.delete();
      //return SignInScreen();
      return NewUserScreen(user);
    }
  }
}
