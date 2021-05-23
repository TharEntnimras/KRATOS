import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:kratos_pdd/User/bloc/bloc_user.dart';

class HomeApp extends StatelessWidget {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return StreamBuilder(
         stream:  userBloc.authStatus,
         builder: (BuildContext context, AsyncSnapshot snapshot){
         return Scaffold(
         backgroundColor: Colors.white,
         body: Container(
          alignment: Alignment.center,
          child: Text("Estas dentro de la App."),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.logout),
          onPressed: (){
              userBloc.signOut();

          },
          
        ),
      );
         }
          
          
      //         
    );
  }
}
