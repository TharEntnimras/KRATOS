import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:kratos_pdd/Debate/ui/screens/comment_screen.dart';
import 'package:kratos_pdd/Participacion/model/propuesta.dart';
import 'package:kratos_pdd/User/bloc/bloc_user.dart';
import 'package:kratos_pdd/User/model/user.dart';
import 'package:kratos_pdd/widgets/post_button.dart';

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
                _PropHeader(prop: prop),
                const SizedBox(height: 16.0),
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
                          fontSize: 14.5,
                          fontFamily: 'Basker',
                          fontWeight: FontWeight.w500,
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
                          fontSize: 14.5,
                          fontFamily: 'Basker',
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                //Divider(),
                const SizedBox(height: 12.0),
                Text(
                  'Argumento',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Basker',
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,

                    //fontWeight: FontWeight.w500
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.0),
                Text(
                  '${prop.argumento}',
                  style: TextStyle(
                    fontSize: 14.5,
                    fontFamily: 'Basker',
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.justify,
                ),
                prop.imageUrl != null
                    ? const SizedBox.shrink()
                    : const SizedBox(height: 6.0),
              ],
            ),
          ),
          prop.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: prop.imageUrl!),
                )
              : const SizedBox.shrink(),
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

class _PropHeader extends StatelessWidget {
  final Propuesta prop;

  const _PropHeader({
    Key? key,
    required this.prop,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        prop.orden == 'acad'
            ? FaIcon(
                FontAwesomeIcons.university,
                color: Colors.grey[600],
                size: 36,
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
                    size: 35,
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

class _PropStats extends StatelessWidget {
  final Propuesta prop;
  final User user;

  const _PropStats({Key? key, required this.prop, required this.user});

  @override
  Widget build(BuildContext context) {
    int reacciones = prop.adlike +
        prop.doclike +
        prop.estlike +
        prop.exlike +
        prop.adno +
        prop.docno +
        prop.docno +
        prop.exno;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4, left: 4),
          child: Row(
            children: [
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
              ),
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
              //const SizedBox(width: 8.0),
              Text(
                '${prop.comentarios?.length} Comentarios',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        const Divider(),
        Row(
          children: [
            PostButton(
              icon: FaIcon(
                FontAwesomeIcons.fistRaised,
                color: Colors.grey[600],
                size: 18.3,
              ),
              label: 'Apoyo',
              onTap: () => {},
            ),
            PostButton(
              icon: FaIcon(
                FontAwesomeIcons.comment,
                color: Colors.grey[600],
                size: 18,
              ),
              label: 'Comentar',
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CommentScreen(user: user)));
              },
            ),
            PostButton(
              icon: FaIcon(
                FontAwesomeIcons.share,
                color: Colors.grey[600],
                size: 18,
              ),
              label: 'Compartir',
              onTap: () => print('Compartir'),
            ),
          ],
        )
      ],
    );
  }
}
