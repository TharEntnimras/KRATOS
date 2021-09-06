import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:kratos_pdd/Participacion/bloc/part_bloc.dart';
import 'package:kratos_pdd/Participacion/model/propuesta.dart';
import 'package:kratos_pdd/Participacion/ui/screens/new_prop.dart';
import 'package:kratos_pdd/Participacion/ui/widgets/prop_container.dart';
import 'package:kratos_pdd/User/model/user.dart';
import 'package:kratos_pdd/widgets/loading_screen.dart';

class PropuestasScreen extends StatelessWidget {
  User user;
  PropuestasScreen(this.user);

  late PartBloc partBloc;

  late List<Propuesta> props = [
    Propuesta(
        pid: 'Contra los flojos',
        orden: 'comu',
        ownerUid: '12321',
        nomprop: 'Contra los flojos',
        problema:
            "El problema de los flojos dentro de la universidad y alrededores, para nuestro bien y salvaguarda que la virgen nos ampare.",
        solucion: 'Hay que darles mas tarea',
        argumento: 'Se ha demostrado que darles mas tarea es bueno',
        categoria: 'Vivir Bien',
        ownerTipo: 'Exalumno',
        ownerName: 'Lic. Julio Venegas',
        adlike: 2,
        doclike: 0,
        fecha: '1s'),
    Propuesta(
        pid: 'Gaugamela',
        ownerUid: '12321',
        orden: 'admin',
        imageUrl:
            'https://scontent.flpb1-1.fna.fbcdn.net/v/t1.18169-9/13935177_1072972546123162_2841761401282548901_n.jpg?_nc_cat=101&ccb=1-3&_nc_sid=9267fe&_nc_ohc=Aeh-XBStPFEAX_KaeVn&_nc_ht=scontent.flpb1-1.fna&oh=1bac56c51b5aa44088da31579bea49e6&oe=60E92BF8',
        nomprop: 'Proyecto Gaugamela',
        problema: "El problema de los flojos",
        solucion:
            'Hay que darles mas tarea a todos esos tipos que se estan quejando tanto, he dicho.',
        argumento: 'Se ha demostrado que darles mas tarea es bueno',
        categoria: 'Reglamentos',
        ownerTipo: 'Administrativo',
        ownerName: 'Ing. Oscar Tapia',
        adno: 8,
        docno: 2,
        fecha: '2d'),
    Propuesta(
        pid: 'laboratorios para flojos',
        ownerUid: '12321',
        orden: 'acad',
        nomprop: 'Nuevo laboratorio para nuestros estudiantes',
        problema: "El problema de los flojos",
        solucion: 'Hay que darles mas tarea',
        argumento:
            'Se ha demostrado que darles mas tarea es bueno y por ende hay que hacer mucho mas para darles todo el incentivo que se merecen asi es que se usa un salto de linea en estas situacion. Espero sea educativo',
        categoria: 'Pedagogia',
        ownerTipo: 'Docente',
        adno: 25,
        ownerName: 'Yhamin Polo',
        fecha: 'Ayer'),
  ];

  // Widget _listBuilder(BuildContext context, int index) {
  //   return SafeArea(
  //     top: false,
  //     bottom: false,
  //     child: Card(
  //       elevation: 1.5,
  //       margin: EdgeInsets.fromLTRB(6, 12, 6, 0),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(4),
  //       ),
  //       child: InkWell(
  //         child: Padding(
  //           padding: const EdgeInsets.all(12.0),
  //           child: Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               CircleAvatar(
  //                 backgroundColor: Colors.black38,
  //                 child: _numero(context, index),
  //               ),
  //               Padding(padding: EdgeInsets.only(left: 16)),
  //               Expanded(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     _letra(context, index),
  //                     Padding(padding: EdgeInsets.only(top: 8)),
  //                    _letra(context, index),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    partBloc = BlocProvider.of(context);
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          title: Row(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Text(
                  'Propuestas',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Gotham",
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 80),
              IconButton(
                  // nueva propuesta
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlocProvider(
                                child: NewProp(user: user),
                                bloc: PartBloc(),
                              ))),
                  icon: Icon(
                    Icons.note_add_outlined,
                    size: 34,
                    color: Colors.white,
                  )),
              const SizedBox(width: 7),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.manage_search,
                    size: 36,
                    color: Colors.white,
                  )),
            ],
          ),
          backgroundColor: Colors.black,
          toolbarHeight: 58.0,
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
        body: StreamBuilder(
            stream: partBloc.propuestasStream,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return LoadingScreen();
                case ConnectionState.done:
                  return LoadingScreen();
                case ConnectionState.active:
        
                  //Rendereando propuestas 
                  List<Propuesta> propuestas =
                      partBloc.buildPropuestas(snapshot.data!.docs);
                  return Stack(children: [
                    Container(
                      color: Colors.grey[350],
                    ),
                    CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final Propuesta propuesta = propuestas[index];
                              // final Propuesta propuesta = props[index];
                              return PropContainer(prop: propuesta, user: user);
                            },
                            childCount: propuestas.length,
                          ),
                        )
                      ],
                    ),
                  ]);

                case ConnectionState.none:
                  return LoadingScreen();
                default:
                  return LoadingScreen();
              }
            }));
  }
}
