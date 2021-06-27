import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:kratos_pdd/Participacion/bloc/part_bloc.dart';
import 'package:kratos_pdd/Participacion/ui/screens/analisis_screen.dart';
import 'package:kratos_pdd/Participacion/ui/screens/propuestas_screen.dart';
import 'package:kratos_pdd/Participacion/ui/screens/reclamos_screen.dart';
import 'package:kratos_pdd/Participacion/ui/widgets/custom_tab_bar.dart';
import 'package:kratos_pdd/User/bloc/bloc_user.dart';
import 'package:kratos_pdd/User/model/user.dart';

class ParticipacionScreen extends StatefulWidget {
  User user;
  ParticipacionScreen(this.user);

  @override
  _ParticipacionScreenState createState() => _ParticipacionScreenState();
}

class _ParticipacionScreenState extends State<ParticipacionScreen> {
  int _selectedindex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.normal);

  late List<Widget> _screens = <Widget>[
    PropuestasScreen(widget.user),
    AnalisisScreen(),
    ReclamosScreen(),
  ];

  final List<IconData> _icons = const [
    FontAwesomeIcons.fistRaised,
    FontAwesomeIcons.university,
    Icons.find_in_page,
  ];



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: BlocProvider(
        bloc: PartBloc(),
        child: Scaffold(
            body: IndexedStack(
              index: _selectedindex,
              children: _screens,
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(),
              child: CustomTabBar(
                icons: _icons,
                selectedIndex: _selectedindex,
                onTap: (index) => setState(() => _selectedindex = index),
              ),
            )),
      ),
    );
  }
}
