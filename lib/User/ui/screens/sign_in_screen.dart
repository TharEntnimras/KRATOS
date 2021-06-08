import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:animate_do/animate_do.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'package:kratos_pdd/User/bloc/bloc_user.dart';
import 'package:kratos_pdd/User/ui/screens/home_app.dart';
import 'package:kratos_pdd/User/ui/screens/new_user_screen.dart';
import 'package:kratos_pdd/widgets/boton_generico.dart';
import 'package:kratos_pdd/widgets/back_sign_screen.dart';
import 'package:kratos_pdd/User/model/user.dart' as u;

class SignInScreen extends StatefulWidget {
  @override
  State createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  late UserBloc userBloc;
  double? screenwidth;
  bool nuevo = false;
  late u.User user;

  @override
  Widget build(BuildContext context) {
    screenwidth = MediaQuery.of(context).size.width;
    userBloc = BlocProvider.of(context);

    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //snapshot - data - object user
        if (!snapshot.hasData || snapshot.hasError) {
          return signInGoogleUI();
        } else {
          user = u.User(
            uid: snapshot.data.uid,
            name: snapshot.data.displayName,
            email: snapshot.data.email,
            photoURL: snapshot.data.photoURL,
          );
          
          if (nuevo) {
            return NewUserScreen(user);
          }
          return buildHomeApp(user);
        }
      },
    );
  }

  Widget buildHomeApp(u.User user) {
    return Scaffold(
      body: BlocProvider<UserBloc>(
        child: HomeApp(user),
        bloc: UserBloc(),
      ),
    );
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        //alignment: Alignment.center,
        children: [
          BackSignScreen(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: FadeInDown(
                delay: Duration(seconds: 1),
                child: Container(
                  width: screenwidth,
                  child: Text("KRATOS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 32.0,
                          fontFamily: "Gotham",
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              )),
              SizedBox(
                height: 50.0,
              ),
              FadeIn(
                delay: Duration(seconds: 1),
                duration: Duration(seconds: 2),
                child: BotonGenerico(
                  text: "Login con Gmail",
                  onPressed: () {
                    userBloc.signOut();
                    userBloc.signIn().then((UserCredential? userCredential) {
                      if (userCredential!.additionalUserInfo!.isNewUser) {
                        // user = u.User(
                        //     uid: userCredential.user!.uid,
                        //     name: userCredential.user!.displayName,
                        //     email: userCredential.user!.email,
                        //     photoURL: userCredential.user!.photoURL);

                        //userBloc.updateNewUserData(user);
                        setState(() {
                          nuevo = userCredential.additionalUserInfo!.isNewUser;
                        });
                      } else {}
                    });
                  },
                  width: 200.0,
                  height: 47.0,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
