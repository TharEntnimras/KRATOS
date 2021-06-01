import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kratos_pdd/User/model/user.dart';
import 'package:kratos_pdd/User/ui/widgets/user_info.dart';
import 'package:kratos_pdd/User/ui/widgets/user_settings.dart';
import 'package:kratos_pdd/widgets/boton_generico.dart';

class WelcomeScreen extends StatefulWidget {
   User user;

  WelcomeScreen(this.user);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "KRATOS",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Gotham",
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 3.0),
              Text(
                "Sin participacion, la democracia no funciona",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Gotham",
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),
            ],
          ),
          SizedBox(width: 75.0,),
          UserSettings(),
        ]),
        toolbarHeight: 75.0,
        titleSpacing: 15.0,
        backgroundColor: Color(0xffFEFCFD),
        brightness: Brightness.light,
        elevation: 0.0,
        bottom: PreferredSize(
          child: decoracionHeader(screenwidth),
          preferredSize: Size(screenwidth, 10.0),
        ),
      ),
      backgroundColor: Color(0xffFEFCFD),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Stack(
            alignment: Alignment.center,
            children: [
              UserInfo(widget.user),
              botonesAPaginas(),
            ],
          ),
          SizedBox(
            height: 70.0,
          ),
          Container(
            height: 230.0,
            width: 300.0,
            child: Column(
              children: [
                Text(
                  "\"No puede haber DEMOCRACIA si no hay educacion.\"",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Libro",
                      fontSize: 25.0,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 15.0),
                Text(
                  "Pierre-Joseph Proudhon",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Libro",
                      fontSize: 17.0,
                      fontStyle: FontStyle.normal),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          botoninferior(),
        ]),
      ),
    );
  }

  Widget decoracionHeader(double width) {
    // return Container(
    //   padding: EdgeInsets.only(top: 1.5, bottom: 1.5),
    //   alignment: Alignment.center,
    //   color: Color(0xffB80000),
    //   width: width,
    //   height: 26.0,
    return Container(
      padding: EdgeInsets.only(top: 1.5, bottom: 1.5),
      height: 20.0,
      width: width,
      color: Colors.black,
      child: Image(
        image: AssetImage('assets/meandrosh1.png'),
        alignment: Alignment.center,
        fit: BoxFit.contain,
        repeat: ImageRepeat.repeatX,
      ),
    );
    //);
  }

  Widget botoninferior() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: FadeInUp(
        duration: Duration(seconds: 1),
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            alignment: Alignment.bottomCenter,
            width: 100.0,
            height: 10.0,
            color: Color(0xff2660A4),
          ),
          BotonGenerico(
            height: 60.0,
            width: 100.0,
            sizeicon: 26.0,
            icon: FontAwesomeIcons.newspaper,
            onPressed: () {},
          ),
        ]),
      ),
    );
  }

  Widget botonesAPaginas() {
    return Column(children: [
      SizedBox(
        height: 150.0,
      ),
      Row(
        children: [
          FadeInLeft(
            duration: Duration(seconds: 1),
            child: Stack(children: [
              Container(
                alignment: Alignment.centerLeft,
                width: 10.0,
                height: 70.0,
                color: Color(0xffB80000),
              ),
              BotonGenerico(
                height: 70.0,
                width: 60.0,
                sizeicon: 29.0,
                icon: Icons.info_outline_rounded,
                onPressed: () {},
              ),
            ]),
          ),
          SizedBox(
            width: 240.0,
          ),
          FadeInRight(
            duration: Duration(seconds: 1),
            child: Stack(alignment: Alignment.centerRight, children: [
              Container(
                alignment: Alignment.centerRight,
                width: 10.0,
                height: 70.0,
                color: Color(0xffCBA135),
              ),
              BotonGenerico(
                height: 70.0,
                width: 60.0,
                icon: FontAwesomeIcons.fistRaised,
                onPressed: () {},
              ),
            ]),
          ),
        ],
      ),
    ]);
  }
}
