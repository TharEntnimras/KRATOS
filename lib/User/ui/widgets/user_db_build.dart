import 'package:flutter/material.dart';
import 'package:kratos_pdd/Foro/ui/screens/menu_drawer.dart';
import 'package:kratos_pdd/User/bloc/bloc_user.dart';
import 'package:kratos_pdd/User/model/user.dart';
import 'package:kratos_pdd/User/ui/widgets/axis_central.dart';
import 'package:kratos_pdd/widgets/loading_screen.dart';

class UserDBBuild extends StatefulWidget {
  User user;
  UserDBBuild(this.user);

  @override
  _UserDBBuild createState() => _UserDBBuild();
}

class _UserDBBuild extends State<UserDBBuild> {
  late UserBloc userBloc;
  late Future userDBFuture;
  UserBloc uBloc = UserBloc();

  @override
  void initState() {
    userDBFuture = uBloc.getDocUserDB(widget.user.uid);
    super.initState();
    print('SE INICIO YA EL FUTURE');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: userDBFuture,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return LoadingScreen();
          case ConnectionState.done:
            User newuser = User(
                uid: snapshot.data.get('uid'),
                name: snapshot.data.get('name'),
                email: snapshot.data.get('email'),
                photoURL: snapshot.data.get('photoURL'),
                tipo: snapshot.data.get('tipo'),
                grado: snapshot.data.get('grado'),
                semestre: snapshot.data.get('semestre'),
                antiguedad: snapshot.data.get('antiguedad'),
                cargo: snapshot.data.get('cargo'),
                nuevo: snapshot.data.get('nuevo'),
                fecgrad: snapshot.data.get('fecgrad'));

            //print(newuser.fecgrad);

            return Scaffold(
              backgroundColor: Colors.white,
              body: PageView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: [
                    AxisCentral(newuser),
                    MenuDrawer(),
                  ]),
            );

          default:
            return LoadingScreen();
        }
      },
    );
  }
}
