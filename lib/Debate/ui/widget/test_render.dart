import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:kratos_pdd/Debate/bloc/comm_bloc.dart';
import 'package:kratos_pdd/Debate/model/Comentario.dart';
import 'package:kratos_pdd/Debate/ui/widget/coment_container.dart';
import 'package:kratos_pdd/Debate/ui/widget/rere_container.dart';
import 'package:kratos_pdd/Participacion/model/propuesta.dart';
import 'package:kratos_pdd/User/model/user.dart';
import 'package:kratos_pdd/widgets/loading_screen.dart';

class TestRender extends StatelessWidget {
  final String cidraiz;
  final String recid;
  final VoidCallback onTapped;
  final Propuesta prop;
  final User user;

  TestRender(
      {Key? key,
      required this.prop,
      required this.user,
      required this.onTapped,
      required this.cidraiz,
      required this.recid
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CommBloc commBloc = BlocProvider.of(context);
    return StreamBuilder(
        stream: commBloc.rereStream(prop.pid, cidraiz, recid),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return LoadingScreen();
            case ConnectionState.done:
              return LoadingScreen();
            case ConnectionState.active:
              List<Comentario> comentarios =
                  commBloc.buildRespuestas(snapshot.data!.docs);
              return Column(
                children: comentarios.map((c) {
                  return ReReContainer(
                    comment: c,
                    user: user,
                    onTapped: onTapped,
                  );
                }).toList(),
              );
            case ConnectionState.none:
              return LoadingScreen();
            default:
              return LoadingScreen();
          }
        });
  }
}
