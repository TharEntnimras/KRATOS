import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:kratos_pdd/Participacion/ui/screens/propuestas.dart';
import 'package:kratos_pdd/User/bloc/bloc_user.dart';

class ParticipacionScreen extends StatefulWidget {
  ParticipacionScreen({Key key}) : super(key: key);

  @override
  _ParticipacionScreenState createState() => _ParticipacionScreenState();
}

class _ParticipacionScreenState extends State<ParticipacionScreen> {
  int _selectedindex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.normal);

  List<Widget> _widgetOptions = <Widget>[
    Propuestas(),
    Text(
      'Estas en la pagina de SEGUIMIENTO',
      style: optionStyle,
    ),
    Text(
      'Estas en la pagina de DENUNCIAS',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Container(
          padding: EdgeInsets.only(bottom: 5.0),
          child: Text(
            'Participacion Democratica',
            style: TextStyle(
              fontSize: 21.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Gotham",
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        toolbarHeight: 57.0,
        titleSpacing: 15.0,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 5.0),
          child: Container(
            color: Color(0xffCBA135),
            height: 15.0,
            width: double.infinity,
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedindex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: " Propuestas ",
            icon: FaIcon(
              FontAwesomeIcons.fistRaised,
              color: Colors.black54,
            ),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            label: "En Analisis",
            icon: FaIcon(
              FontAwesomeIcons.university,
              color: Colors.black54,
            ),
            //label: 'Business',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            label: "Denuncia",
            icon: Icon(
              Icons.find_in_page,
              color: Colors.black54,
            ),
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedindex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
      //  CupertinoTabScaffold(
      //   tabBar: CupertinoTabBar(items: [
      //     BottomNavigationBarItem(
      //       icon: FaIcon(
      //         FontAwesomeIcons.fistRaised,
      //         color: Colors.indigo,
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: FaIcon(
      //         FontAwesomeIcons.university,
      //         color: Colors.black54,
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.find_in_page,
      //         color: Colors.indigo,
      //       ),
      //     ),
      //   ]),
      //   tabBuilder: (BuildContext context, int index) {
      //     switch (index) {
      //       case 0:
      //         return CupertinoTabView(
      //           builder: (BuildContext context) {
      //             return BlocProvider(
      //                 child: Container(
      //                   alignment: Alignment.center,
      //                   child: Text(
      //                       "Estas en la pagina de propuestas"),
      //                 ),
      //                 bloc: UserBloc());
      //           },
      //         );
      //         break;
      //       case 1:
      //         return CupertinoTabView(
      //           builder: (BuildContext context) {
      //             return BlocProvider<UserBloc>(
      //               bloc: UserBloc(),
      //               child: Container(
      //                 alignment: Alignment.center,
      //                 child: Text(
      //                     "Estas en la pagina de seguimiento"),
      //               ),
      //             );
      //           },
      //         );
      //         break;
      //       case 2:
      //         return CupertinoTabView(
      //           builder: (BuildContext context) {
      //             return BlocProvider<UserBloc>(
      //               bloc: UserBloc(),
      //               child: Container(
      //                 alignment: Alignment.center,
      //                 child: Text(
      //                     "Estas en la pagina de denuncia"),
      //               ),
      //             );
      //           },
      //         );
      //         break;
      //     }
      //   },
      // ),
    );
  }
}
