import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:kratos_pdd/Debate/bloc/comm_bloc.dart';
import 'package:kratos_pdd/Debate/model/Comentario.dart';
import 'package:kratos_pdd/Debate/ui/widget/box_comment.dart';
import 'package:kratos_pdd/Debate/ui/widget/com_raiz_container.dart';
import 'package:kratos_pdd/Debate/ui/widget/coment_container.dart';
import 'package:kratos_pdd/Debate/ui/widget/resp_container.dart';
import 'package:kratos_pdd/Info/ui/screens/info_screen.dart';
import 'package:kratos_pdd/Participacion/model/propuesta.dart';
import 'package:kratos_pdd/User/model/user.dart';
import 'package:kratos_pdd/widgets/loading_screen.dart';

class RespuestaScreen extends StatefulWidget {
  final Comentario comraiz;
  final Propuesta prop;
  final User user;

  RespuestaScreen(
      {required this.user, required this.comraiz, required this.prop});

  @override
  _RespuestaScreenState createState() => _RespuestaScreenState();
}

class _RespuestaScreenState extends State<RespuestaScreen> {
  var concfocus = FocusNode();
  var tilefocus = FocusNode();

  late CommBloc commBloc;
  String posicion = 'nulo';
  final formKey = GlobalKey<FormState>();

  late String respuestaA = '';
  final TextEditingController argController = TextEditingController();
  var concController = TextEditingController();

  onTapped(Comentario com) {
    concfocus.requestFocus();
    tilefocus.requestFocus();
    setState(() {
      respuestaA = 'A ${com.autor}: ';
      posicion = 'nulo';
    });
  } 

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
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          title: Container(
            padding: EdgeInsets.only(bottom: 5.0),
            child: Text(
              'Respuestas',
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
            child: StreamBuilder(
                stream: commBloc.respuestasStream(
                    widget.prop.pid, widget.comraiz.cid!),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return LoadingScreen();
                    case ConnectionState.done:
                      return LoadingScreen();
                    case ConnectionState.active:
                      if (snapshot.data!.docs.isEmpty) {
                        return SingleChildScrollView(
                          child: ComRaizContainer(
                            comment: widget.comraiz,
                            user: widget.user,
                            onTapped: () {
                              onTapped(widget.comraiz);
                            },
                          ),
                        );
                      } else {
                        List<Comentario> comentarios =
                            commBloc.buildRespuestas(snapshot.data!.docs);
                        return CustomScrollView(
                          slivers: [
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  final Comentario comentario =
                                      comentarios[index];
                                  if (index == 0) {
                                    return Column(children: [
                                      ComRaizContainer(
                                        comment: widget.comraiz,
                                        user: widget.user,
                                        onTapped: () {
                                          onTapped(widget.comraiz);
                                        },
                                      ),
                                      RespContainer(
                                        comment: comentario,
                                        user: widget.user,
                                        onTapped: () {
                                          onTapped(comentario);
                                        },
                                      )
                                    ]);
                                  } else {
                                    return RespContainer(
                                      comment: comentario,
                                      user: widget.user,
                                      onTapped: () {
                                        onTapped(comentario);
                                      },
                                    );
                                  }
                                },
                                childCount: comentarios.length,
                              ),
                            )
                          ],
                        );
                      }

                    case ConnectionState.none:
                      return LoadingScreen();
                    default:
                      return LoadingScreen();
                  }
                }),
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

            errorText: 'El comentario no puede estar en blanco',
            sendButtonMethod: () {
              if (concController.text != '' && argController.text != '') {
                commBloc.subirRespuesta(
                  Comentario(
                    autor: widget.user.name,
                    posicion: posicion,
                    conclusion: concController.text,
                    argumento: argController.text,
                    autorTipo: widget.user.tipo!,
                    ownerid: widget.user.uid,
                    fecha: DateTime.now(),
                    respuestaA: respuestaA,
                  ),
                  widget.prop.pid,
                  widget.comraiz.cid!,
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
            concfocus: concfocus,
            focusNode: tilefocus,
            sendWidget:
                Icon(Icons.send_sharp, size: 30, color: Color(0xff2660A4)),
            header: respuestaA == ''
                ? SizedBox.shrink()
                : Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 22,),
                          Container(
                            //color: Colors.white
                            //width: 100,
                            height: 15,
                            child: Text(
                              respuestaA,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Helv',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      )
                    ],
                  ),

            // respField: Container(
            //     height: 50,
            //     padding: EdgeInsets.symmetric(horizontal: 20),
            //     child: TextField(
            //       focusNode: concfocus,
            //       autofocus: false,
            //       autocorrect: false,
            //       textAlign: TextAlign.left,
            //       controller: concController,
            //       keyboardType: TextInputType.multiline,
            //       maxLines: 1,
            //       maxLength: 80,
            //       cursorColor: Colors.black,
            //       // style: TextStyle(
            //       //     fontSize: fontsize,
            //       //     fontFamily: fontfamily,
            //       //     color: fontcolor,
            //       //     fontWeight: fontweight),
            //       decoration: InputDecoration(
            //         contentPadding: const EdgeInsets.all(5),
            //         filled: true,
            //         fillColor: Colors.grey[200], //
            //         //border: InputBorder.none,
            //         hintText: 'Tu conclusion ...',
            //         enabledBorder: OutlineInputBorder(
            //             borderSide: BorderSide(color: Color(0xFFe5e5e5)),
            //             borderRadius: BorderRadius.all(Radius.circular(9.0))),
            //         focusedBorder: OutlineInputBorder(
            //             borderSide: BorderSide(color: Color(0xFFe5e5e5)),
            //             borderRadius: BorderRadius.all(Radius.circular(9.0))),
            //       ),
            //     )),
          ),
        ));
  }
}
