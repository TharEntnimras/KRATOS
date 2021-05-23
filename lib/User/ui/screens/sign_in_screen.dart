import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'package:kratos_pdd/User/bloc/bloc_user.dart';
import 'package:kratos_pdd/User/ui/screens/home_app.dart';
import 'package:kratos_pdd/widgets/button_green.dart';
import 'package:kratos_pdd/widgets/gradient_back.dart';



class SignInScreen extends StatefulWidget {


  @override
   State createState(){
     return _SignInScreen();
   }
}

class  _SignInScreen extends State<SignInScreen> {

  UserBloc userBloc;
  double screenwidth;
   
  
  @override
  Widget build(BuildContext context) {
    
    screenwidth = MediaQuery.of(context).size.width;
    userBloc = BlocProvider.of(context);
    
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession(){
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder:  (BuildContext context, AsyncSnapshot snapshot){
        //snapshot - data - object user 
        if(!snapshot.hasData || snapshot.hasError){
          return signInGoogleUI();
        } else{
          return HomeApp();
        }
      },
      ); 
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
        GradientBack(height: null),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: Container(
              width:  screenwidth,
              child:  Text(" Bienvenido \n Esta es tu App Viajera ",
            style: TextStyle(
              fontSize: 36.0,
              fontFamily: "Lato",
              color: Colors.white,
              fontWeight: FontWeight.bold
            )
            ),

            )),
           
            ButtonGreen(text: "Login con Gmail", 
            onPressed: (){
              userBloc.signOut();
              userBloc.signIn().then((User user) {

                // userBloc.updateUserData(u.User(
                //   uid: user.uid, 
                //   name: user.displayName, 
                //   email: user.email, 
                //   photoURL: user.photoURL));
              }); 
            },
            width: 300.0,
            height: 50.0,
            )
            
          ],
        )
        ],
      ),
    );
  }
}