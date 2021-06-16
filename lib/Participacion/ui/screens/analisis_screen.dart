import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:kratos_pdd/Participacion/bloc/part_bloc.dart';
import 'package:kratos_pdd/User/bloc/bloc_user.dart';

class AnalisisScreen extends StatelessWidget {

  late PartBloc partBloc;
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    
    partBloc = BlocProvider.of(context);
    userBloc = BlocProvider.of(context);

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
        body: Center(
          child: Column(
            children: [
              Text(' del place ${partBloc.getstring()}'),
              Text(userBloc.getstring())
            ],
          ),
        ),
    );
  }
}