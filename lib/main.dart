import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'User/bloc/bloc_user.dart';
import 'User/ui/screens/sign_in_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      //statusBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      //statusBarIconBrightness: Brightness.dark,
      //statusBarBrightness: Brightness.light
      ));
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        //theme: ThemeData(primaryColor: Colors.black),
        debugShowCheckedModeBanner: false,
        home: SignInScreen(),
      ),
      bloc: UserBloc(),
    );
  }
}
