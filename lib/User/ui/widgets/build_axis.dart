import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:kratos_pdd/Foro/ui/screens/menu_drawer.dart';
import 'package:kratos_pdd/User/bloc/bloc_user.dart';
import 'package:kratos_pdd/User/model/user.dart';
import 'package:kratos_pdd/User/ui/screens/axis_central.dart';
import 'package:kratos_pdd/User/ui/screens/new_user_screen.dart';
import 'package:kratos_pdd/widgets/loading_screen.dart';
 
class BuildAxis extends StatelessWidget {
  late UserBloc userBloc;
  User user;
  AsyncSnapshot snapshot;

  BuildAxis(this.snapshot, this.user);

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return StreamBuilder(
      stream: userBloc.getestaverificado(),
      builder: (BuildContext context, snapshotdoc) {
        switch (snapshotdoc.connectionState) {
          case ConnectionState.waiting:
            return LoadingScreen();
          case ConnectionState.active:
            return buildverif(snapshotdoc, user);
          default:
            return buildverif(snapshotdoc, user);
        }
      },
    );

}

 Widget buildverif(snapshotdoc, user) {
    if (snapshotdoc.data == false || snapshotdoc.data != null) {
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
    } else {
      return NewUserScreen(user);
    }
  }
}