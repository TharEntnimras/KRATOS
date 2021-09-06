import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kratos_pdd/Participacion/model/propuesta.dart';
import 'package:kratos_pdd/Participacion/ui/widgets/reac_splash.dart';

class AnalisisCont extends StatefulWidget {
  List<Propuesta> propuestas;

  AnalisisCont({Key? key, required this.propuestas}) : super(key: key);

  @override
  _AnalisisContState createState() => _AnalisisContState();
}

class _AnalisisContState extends State<AnalisisCont> {
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        print(widget.propuestas[index].isExpanded);
        setState(() {
          widget.propuestas[index].isExpanded = !isExpanded;
        });
        print(widget.propuestas[index].isExpanded);
      },
      children: widget.propuestas.map((prop) {
        return ExpansionPanel(
          isExpanded: prop.isExpanded,
          canTapOnHeader: true,
          headerBuilder: (bc, status) {
            return AnHeader(prop: prop);
          },
          body: AnBody(prop: prop),
        );
      }).toList(),
      dividerColor: Colors.grey[350],
    );
  }
}

class AnHeader extends StatelessWidget {
  final Propuesta prop;

  const AnHeader({
    Key? key,
    required this.prop,
  });

  @override
  Widget build(BuildContext context) {
    int reacciones =
        prop.numapoyo + prop.numencanta + prop.numrevisar + prop.numnoapoyo;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 6),
      color: Colors.white,
      child: Row(
        children: [
          // prop.orden == 'acad'
          //     ? Icon(
          //         Icons.school_rounded,
          //         color: Colors.grey[600],
          //         size: 38,
          //       )
          //     : prop.orden == 'admin'
          //         ? Icon(
          //             Icons.file_present,
          //             color: Colors.grey[600],
          //             size: 36,
          //           )
          //         : Icon(
          //             Icons.group_rounded,
          //             color: Colors.grey[600],
          //             size: 36,
          //           ),

          const SizedBox(width: 8.0),
          Expanded(
            //width: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    prop.orden == 'acad'
                        ? Icon(
                            Icons.school_rounded,
                            color: Colors.grey[600],
                            size: 33,
                          )
                        : prop.orden == 'admin'
                            ? Icon(
                                Icons.file_present,
                                color: Colors.grey[600],
                                size: 33,
                              )
                            : Icon(
                                Icons.group_rounded,
                                color: Colors.grey[600],
                                size: 33,
                              ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            prop.nomprop,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Basker',
                                fontSize: 13.5,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Column(
                //   children: [
                //     Text(
                //       prop.nomprop,
                //       style: TextStyle(
                //           color: Colors.black,
                //           fontFamily: 'Basker',
                //           fontSize: 13,
                //           fontWeight: FontWeight.bold),
                //     ),
                //     const SizedBox(height: 4),
                //     Text(
                //       '${prop.categoria}',
                //       style: TextStyle(
                //         color: Colors.black87,
                //         fontWeight: FontWeight.w600,
                //         fontFamily: 'Basker',
                //         fontSize: 11.2,
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(height: 1),
                Text(
                  '${prop.categoria}',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Basker',
                    fontSize: 11.2,
                  ),
                ),
                const SizedBox(height: 2),
                Text('Por ${prop.ownerName} • ${prop.ownerTipo} ',
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Basker',
                      fontSize: 10.5,
                    )),
                // Text(
                //   '${prop.ownerTipo} ',
                //   style: const TextStyle(
                //     color: Colors.black54,
                //     fontWeight: FontWeight.w600,
                //     fontFamily: 'Basker',
                //     fontSize: 10.5,
                //   ),
                // ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ReacSplash(
                        numapoyo: prop.numapoyo,
                        numencanta: prop.numencanta,
                        numrevisar: prop.numrevisar,
                        numnoapoyo: prop.numnoapoyo),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      reacciones == 0 ? ' ' : '$reacciones',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.message_outlined,
                      size: 20.0,
                      color: Colors.grey[600],
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      '${prop.comentarios}',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // IconButton(
          //   onPressed: () => print('More'),
          //   icon: const Icon(Icons.more_horiz),
          // )
        ],
      ),
    );
  }
}

class AnBody extends StatelessWidget {
  const AnBody({
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
