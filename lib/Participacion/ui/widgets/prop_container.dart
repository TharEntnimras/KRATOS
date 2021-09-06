import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:kratos_pdd/Debate/bloc/comm_bloc.dart';
import 'package:kratos_pdd/Debate/ui/screens/comment_screen.dart';
import 'package:kratos_pdd/Participacion/bloc/part_bloc.dart';
import 'package:kratos_pdd/Participacion/model/propuesta.dart';
import 'package:kratos_pdd/Participacion/ui/widgets/reac_splash.dart';
import 'package:kratos_pdd/User/model/user.dart';
import 'package:kratos_pdd/widgets/post_button.dart';
import 'package:kratos_pdd/widgets/reacciones.dart';

class PropContainer extends StatelessWidget {
  final User user;
  final Propuesta prop;

  PropContainer({Key? key, required this.prop, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PropHeader(prop: prop),
                const SizedBox(height: 16.0),
                PropBody(prop: prop),
                // prop.imageUrl != null
                //     ? const SizedBox.shrink()
                //     : const SizedBox(height: 10.0),
              ],
            ),
          ),
          prop.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: prop.imageUrl!),
                )
              : const SizedBox.shrink(),
          const SizedBox(height: 22),
          _PropStats(
            prop: prop,
            user: user,
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

class PropBody extends StatelessWidget {
  const PropBody({
    Key? key,
    required this.prop,
  }) : super(key: key);

  final Propuesta prop;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 70,
              child: Text(
                'Problema:  ',
                style: TextStyle(
                    fontSize: 11,
                    fontFamily: 'Basker',
                    color: Colors.black87,
                    fontWeight: FontWeight.w600
                    //fontWeight: FontWeight.w500
                    ),
              ),
            ),
            Container(
              width: 245,
              child: Text(
                '${prop.problema}',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 13,
                  fontFamily: 'Basker',
                  fontWeight: FontWeight.w600,
                  //fontWeight: FontWeight.w500
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 70,
              child: Text(
                'Solución:   ',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Basker',
                    fontWeight: FontWeight.w600,
                    color: Colors.black87
                    //fontWeight: FontWeight.w500
                    ),
              ),
            ),
            Container(
              width: 245,
              child: Text(
                '${prop.solucion}',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 13,
                  fontFamily: 'Basker',
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 1.5,
              width: 280,
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
          ],
        ),
        SizedBox(height: 15.0),
        Text(
          '${prop.argumento}',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xff2F4F4F),
            fontFamily: 'Basker',
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}

class PropHeader extends StatelessWidget {
  final Propuesta prop;

  const PropHeader({
    Key? key,
    required this.prop,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        prop.orden == 'acad'
            ? Icon(
                Icons.school_rounded,
                color: Colors.grey[600],
                size: 38,
              )
            : prop.orden == 'admin'
                ? Icon(
                    Icons.file_present,
                    color: Colors.grey[600],
                    size: 36,
                  )
                : Icon(
                    Icons.group_rounded,
                    color: Colors.grey[600],
                    size: 36,
                  ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                prop.nomprop,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Basker',
                    fontSize: 18.5,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                'Por ${prop.ownerName} • ${prop.ownerTipo} ',
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Basker',
                  fontSize: 11.3,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${prop.categoria}',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Basker',
                  fontSize: 11.5,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () => print('More'),
          icon: const Icon(Icons.more_horiz),
        )
      ],
    );
  }
}

class _PropStats extends StatefulWidget {
  final Propuesta prop;
  final User user;

  _PropStats({Key? key, required this.prop, required this.user});

  @override
  __PropStatsState createState() => __PropStatsState();
}

class __PropStatsState extends State<_PropStats> {
  final reactions = Reacciones();

  late PartBloc partBloc;

  @override
  Widget build(BuildContext context) {
    partBloc = BlocProvider.of(context);

    int reacciones = widget.prop.numapoyo +
        widget.prop.numencanta +
        widget.prop.numrevisar +
        widget.prop.numnoapoyo;
    print(' suma de reacciiones: $reacciones');

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 11, right: 13),
          child: Row(
            children: [
              // aca va el nuevo widget
              ReacSplash(
                  numapoyo: widget.prop.numapoyo,
                  numencanta: widget.prop.numencanta,
                  numrevisar: widget.prop.numrevisar,
                  numnoapoyo: widget.prop.numnoapoyo),

              SizedBox(
                width: 4.0,
              ),
              Expanded(
                child: Text(
                  reacciones == 0 ? ' ' : '$reacciones',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Text(
                '${widget.prop.comentarios} comentarios',
                style: TextStyle(
                    color: Colors.grey[600], fontSize: 13, fontFamily: 'Helv'),
              ),
            ],
          ),
        ),
        const Divider(
          height: 5,
        ),
        Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                child: Stack(children: [
              Container(
                height: 35,
                color: Colors.grey[50],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.5),
                child: FlutterReactionButton(
                  onReactionChanged: (reaction, index) {
                    if (index < 4) {
                      partBloc.borrarReacdeProp(widget.prop.pid, widget.user);
                      partBloc.reaccionarProp(
                          widget.prop.pid, widget.user, index);
                    } else {
                      partBloc.borrarReacdeProp(widget.prop.pid, widget.user);
                    }
                  },
                  //selectedReaction:
                  reactions: reactions.reactions,
                  initialReaction: widget.prop.apoyo
                      ? reactions.reactions[0]
                      : widget.prop.meencanta
                          ? reactions.reactions[1]
                          : widget.prop.revisar
                              ? reactions.reactions[2]
                              : widget.prop.noapoyo
                                  ? reactions.reactions[3]
                                  : reactions.reacDefault,
                  boxDuration: Duration(milliseconds: 80),
                  boxPosition: Position.TOP,
                  boxAlignment: Alignment.bottomLeft,
                ),
              ),
        

            ])),
            PostButton(
              icon: FaIcon(
                Icons.forum_outlined ,
                color: Colors.grey,
                size: 23.5,
              ),
              label: 'Debatir',
              onTap: () async {
                //debatir propuesta
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocProvider(
                              child: CommentScreen(
                                user: widget.user,
                                prop: widget.prop,
                              ),
                              bloc: CommBloc(),
                            )));
              },
            ),
            // PostButton(
            //   icon: FaIcon(
            //     FontAwesomeIcons.share,
            //     color: Colors.grey[600],
            //     size: 18,
            //   ),
            //   label: 'Compartir',
            //   onTap: () => print('Compartir'),
            // ),
          ],
        )
      ],
    );
  }
}
