import 'package:flutter/material.dart';
import 'package:kratos_pdd/Participacion/ui/screens/participacion_screen.dart';

import 'package:kratos_pdd/User/model/user.dart';
import 'package:kratos_pdd/Info/ui/screens/info_screen.dart';
import 'package:kratos_pdd/User/ui/screens/welcome_screen.dart';

class AxisCentral extends StatelessWidget {
  final User user;

  AxisCentral(this.user);

  final controller = PageController(
    keepPage: false,
    initialPage: 1,
  );

  @override
  Widget build(BuildContext context) {
 

    return Scaffold(
      body: PageView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          children: [
            InfoScreen(),
            WelcomeScreen(user),
            ParticipacionScreen(),
          ]),
    );
  }
}
