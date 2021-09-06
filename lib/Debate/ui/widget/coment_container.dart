import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:kratos_pdd/Debate/bloc/comm_bloc.dart';
import 'package:kratos_pdd/Debate/model/Comentario.dart';
import 'package:kratos_pdd/Debate/ui/screens/comment_screen.dart';
import 'package:kratos_pdd/Debate/ui/screens/respuesta_screen.dart';
import 'package:kratos_pdd/Participacion/model/propuesta.dart';
import 'package:kratos_pdd/User/bloc/bloc_user.dart';
import 'package:kratos_pdd/User/model/user.dart';


class ComentContainer extends StatelessWidget {
  final Comentario comment;
  final User user;
  final Propuesta prop;

  ComentContainer(
      {Key? key,
      required this.comment,
      required this.user,
      required this.prop
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 23, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ComHeader(comment: comment),
                const SizedBox(height: 7.0),
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(9.0),
                      ),
                      color: Colors.grey[300],
                    ),
                    //color: Colors.grey[300],
                    padding: EdgeInsets.all(8),
                    child: Text(
                      comment.argumento,
                      style: TextStyle(
                          fontSize: 14.3,
                          fontFamily: 'Helv',
                          color: Colors.black87,
                          fontWeight: FontWeight.normal
                          //fontWeight: FontWeight.w500
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                _ComStats(
                  comment: comment,
                  user: user,
                  prop: prop
                ),
              ],
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
          //   child: _PropStats(prop: prop),
          // )
        ],
      ),
    );
  }
}

class _ComHeader extends StatelessWidget {
  final Comentario comment;

  const _ComHeader({
    Key? key,
    required this.comment,
  });
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          comment.posicion == 'pro'
              ? Container(
                  // height: 35,
                  width: 8,
                  color: Colors.green[600],
                )
              : comment.posicion == 'contra'
                  ? Container(
                      //height: 35,
                      width: 8,
                      color: Colors.red[600],
                    )
                  : Container(
                      //height: 35,
                      width: 8,
                      color: Colors.grey[400],
                    ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.autor,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Helv',
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  comment.autorTipo,
                  style: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'Helv',
                      fontSize: 11,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  comment.conclusion,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Helv',
                    fontSize: 15.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ComStats extends StatelessWidget {

  final Comentario comment;
  final User user;
  final Propuesta prop;

  const _ComStats(
      {Key? key,
      required this.comment,
      required this.user,
      required this.prop
     });

  @override
  Widget build(BuildContext context) {
    int reacciones = comment.adlike +
        comment.doclike +
        comment.estlike +
        comment.exlike +
        comment.adno +
        comment.docno +
        comment.docno +
        comment.exno;
    return Padding(
      padding: const EdgeInsets.only(right: 4, left: 17),
      child: Row(
        children: [
          Expanded(
              child: Row(
            children: [
              GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Me gusta',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                      fontFamily: 'Helv',
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              const SizedBox(width: 30),
              //Responder comentario
              GestureDetector(
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlocProvider(
                                  bloc: CommBloc(),
                                  child: RespuestaScreen(
                                    user: user,
                                    prop: prop,
                                    comraiz: comment,
                                  ), 
                                )));
                  },
                  child: Text(
                    'Responder',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                      fontFamily: 'Helv',
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ],
          )),
          Text(
            reacciones == 0 ? ' ' : '$reacciones',
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          SizedBox(
            width: 4.0,
          ),
          Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: const FaIcon(
              FontAwesomeIcons.fistRaised,
              size: 10.0,
              color: Colors.white,
            ),
          ), //const SizedBox(width: 8.0),
        ],
      ),
    );
  }
}
