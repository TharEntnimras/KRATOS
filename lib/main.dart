import 'package:flutter/material.dart';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'User/bloc/bloc_user.dart';
import 'User/ui/screens/sign_in_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        //home: PlatziTripsCupertino(),
        home: SignInScreen(),
      ),
      bloc: UserBloc(),
    );
  }
}
