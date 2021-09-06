import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:kratos_pdd/Participacion/bloc/part_bloc.dart';
import 'package:kratos_pdd/Participacion/model/propuesta.dart';
import 'package:kratos_pdd/Participacion/ui/widgets/analisis_cont.dart';
import 'package:kratos_pdd/Participacion/ui/widgets/prop_container.dart';
//import 'package:kratos_pdd/User/bloc/bloc_user.dart';
import 'package:kratos_pdd/widgets/loading_screen.dart';

class AnalisisScreen extends StatelessWidget {
  late PartBloc partBloc;

  @override
  Widget build(BuildContext context) {
    partBloc = BlocProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Container(
          padding: EdgeInsets.only(bottom: 5.0),
          child: Text(
            'En analisis',
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
      body:
          
          FutureBuilder(
        future: partBloc.getpropfuture,
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return LoadingScreen();
            case ConnectionState.done:
              List<Propuesta> propuestas =
                  partBloc.buildPropuestas(snapshot.data!.docs);
              return Stack(children: [
                Container(
                  color: Colors.grey[350],
                ),
                SingleChildScrollView(
                    child: AnalisisCont(propuestas: propuestas))
              ]);
            case ConnectionState.active:
              return LoadingScreen();

            case ConnectionState.none:
              return LoadingScreen();
            default:
              return LoadingScreen();
          }
        },
      ),
    );
  }
}
