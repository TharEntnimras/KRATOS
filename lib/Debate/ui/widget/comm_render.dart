import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:kratos_pdd/Debate/bloc/comm_bloc.dart';
import 'package:kratos_pdd/Debate/model/Comentario.dart';
import 'package:kratos_pdd/Debate/ui/widget/coment_container.dart';
import 'package:kratos_pdd/Participacion/model/propuesta.dart';
import 'package:kratos_pdd/User/model/user.dart';
import 'package:kratos_pdd/widgets/loading_screen.dart';

class CommRender extends StatelessWidget {

  final Propuesta prop;
  final User user;
 
  
  CommRender({
    Key? key,
 
    required this.prop,
    required this.user

  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    CommBloc commBloc = BlocProvider.of(context);
    return StreamBuilder(
        stream: commBloc.comentariosStream(prop.pid),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return LoadingScreen();
            case ConnectionState.done:
              return LoadingScreen();
            case ConnectionState.active:
              List<Comentario> comentarios =
                  commBloc.buildComentarios(snapshot.data!.docs);
              return CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final Comentario comentario =
                            comentarios[index];
                        return ComentContainer(
                          comment: comentario,
                          user: user,
                          prop: prop,
                        );
                      },
                      childCount: comentarios.length,
                    ),
                  )
                ],
              );

            case ConnectionState.none:
              return LoadingScreen();
            default:
              return LoadingScreen();
          }
        });
  }
}
