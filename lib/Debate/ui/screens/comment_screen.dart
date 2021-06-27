import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:kratos_pdd/Debate/bloc/comm_bloc.dart';
import 'package:kratos_pdd/Debate/model/Comentario.dart';
import 'package:kratos_pdd/Debate/ui/widget/box_comment.dart';

import 'package:kratos_pdd/Debate/ui/widget/comm_render.dart';

import 'package:kratos_pdd/Participacion/model/propuesta.dart';
import 'package:kratos_pdd/User/model/user.dart';

class CommentScreen extends StatefulWidget {
  final Propuesta prop;
  final User user;

  CommentScreen({required this.user, required this.prop});

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  late CommBloc commBloc;
  String posicion = 'nulo';
  final formKey = GlobalKey<FormState>();
  var tilefocus = FocusNode();

  final TextEditingController argController = TextEditingController();
  var concController = TextEditingController();

  late List items = [
    Comentario(
        adlike: 3,
        autorTipo: 'Docente',
        autor: widget.user.name,
        posicion: 'contra',
        conclusion: 'Usted esta mal y le voy a decir porque.',
        argumento:
            'Usted no tiene idea de lo que esta hablando porla carencia de fundamentacion teorica en todo lo que evoca, revise sus fuentes bibliograficas y su metodologia. las mismas carecen de sustento por no tener referencia o soporte en estudios academicos.'),
    Comentario(
        autorTipo: 'Exalumno',
        autor: 'Gerardo Villa',
        posicion: 'pro',
        conclusion: 'Tiene toda la razon y sus calculos son correctos.',
        argumento:
            'sus estudios han llegado a una conclusion fantastica, no solamente han logrado hallar el boson de Higgs sino que le han dado  a la humanidad una razon mas para batallar contra la absurdeza e la existencia en un universo infinito y carente de sentido, felicitaciones.'),
    Comentario(
        docno: 6,
        autorTipo: 'Administrativo',
        autor: 'Ramiro Ramirez',
        posicion: 'nulo',
        conclusion:
            'No deberiamos estar debatiendo este tema, hay temas mas urgentes.',
        argumento: 'No tengo mas que decir. ')
  ];

  List<Reaction> reactions = [
    Reaction(
      id: 1,
      icon: Icon(
        Icons.check_circle_outline_rounded,
        color: Colors.green[700],
        size: 40,
      ),
      previewIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.5, vertical: 5),
        child: Icon(
          Icons.check_circle_outline_rounded,
          color: Colors.green[700],
          size: 45,
        ),
      ),
    ),
    Reaction(
      id: 2,
      icon: Icon(
        Icons.cancel_outlined,
        color: Colors.red[700],
        size: 40,
      ),
      previewIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.5, vertical: 5),
        child: Icon(
          Icons.cancel_outlined,
          color: Colors.red[700],
          size: 45,
        ),
      ),
    ),
    Reaction(
      id: 3,
      icon: Icon(
        Icons.textsms_outlined,
        color: Colors.grey,
        size: 40,
      ),
      previewIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.5, vertical: 5),
        child: Icon(
          Icons.textsms_outlined,
          color: Colors.grey,
          size: 45,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    commBloc = BlocProvider.of(context);
    print(widget.prop.pid);
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          title: Container(
            padding: EdgeInsets.only(bottom: 5.0),
            child: Text(
              'Debate',
              style: TextStyle(
                fontSize: 21.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Gotham",
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: Color(0xff2660A4),
          toolbarHeight: 45.0,
          titleSpacing: 15.0,
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 5.0),
            child: Container(
              color: Color(0xffCBA135),
              height: 7.0,
              width: double.infinity,
            ),
          ),
        ),
        body: Container(
          child: BoxComment(
            //RENDEREANDO COMENTARIOS
            child: CommRender(prop: widget.prop, user: widget.user),
            lead: FittedBox(
              child: FlutterReactionButton(
                onReactionChanged: (reaction, index) {
                  if (index == 0) {
                    posicion = 'pro';
                    print(posicion);
                  } else {
                    if (index == 1) {
                      posicion = 'contra';
                      print(posicion);
                    } else {
                      posicion = 'nulo';
                      print(posicion);
                    }
                  }
                },
                reactions: reactions,
                initialReaction: reactions[2],
                boxDuration: Duration(milliseconds: 100),
                boxPosition: Position.BOTTOM,
                boxAlignment: Alignment.bottomCenter,
              ),
            ),

            // DropdownButtonHideUnderline(
            //   child: DropdownButton(
            //     value: posicion,
            //     icon: Container(),
            //     hint:
            //         Icon(Icons.record_voice_over, color: Colors.grey, size: 30),
            //     onChanged: (String? value) {
            //       setState(() {
            //         posicion = value!;
            //       });
            //     },
            //     items: [
            //       DropdownMenuItem<String>(
            //         value: 'pro',
            //         child: Icon(Icons.check_circle_outline,
            //             color: Colors.green[700], size: 35),
            //       ),
            //       DropdownMenuItem(
            //         value: 'contra',
            //         child: Icon(Icons.cancel_outlined,
            //             color: Colors.red[700], size: 35),
            //       ),
            //       DropdownMenuItem(
            //         value: 'nulo',
            //         child: Icon(Icons.textsms_outlined,
            //             color: Colors.grey, size: 35),
            //       )
            //     ],
            //   ),
            // ),

            errorText: 'El comentario no puede estar en blanco',
            sendButtonMethod: () {
              if (concController.text != '' && argController.text != '') {
                commBloc.subirComentario(
                  Comentario(
                      autor: widget.user.name,
                      posicion: posicion,
                      conclusion: concController.text,
                      argumento: argController.text,
                      autorTipo: widget.user.tipo!,
                      ownerid: widget.user.uid,
                      fecha: DateTime.now()),
                  widget.prop.pid,
                );

                argController.clear();
                concController.clear();
                tilefocus.unfocus();
              } else {
                print("Not validated");
              }
            },
            formKey: formKey,
            argController: argController,
            concController: concController,
            hintText: 'Tu argumento ... ',
            textColor: Colors.black,
            focusNode: tilefocus,
            sendWidget:
                Icon(Icons.send_sharp, size: 30, color: Color(0xff2660A4)),
          ),
        ));
  }
}
