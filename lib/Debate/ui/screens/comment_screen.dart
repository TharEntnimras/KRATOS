import 'package:flutter/material.dart';
import 'package:kratos_pdd/Debate/model/Comentario.dart';
import 'package:kratos_pdd/Debate/ui/widget/box_comment.dart';
import 'package:kratos_pdd/Debate/ui/widget/coment_container.dart';
import 'package:kratos_pdd/Info/ui/screens/info_screen.dart';
import 'package:kratos_pdd/User/model/user.dart';

class CommentScreen extends StatefulWidget {
  final User user;

  CommentScreen({required this.user});

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  String posicion = 'nulo';
  final formKey = GlobalKey<FormState>();

  final TextEditingController commentController = TextEditingController();
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

  List filedata = [
    {
      'name': 'Adeleye Ayodeji',
      'pic': 'https://picsum.photos/300/30',
      'message': 'I love to code'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
  ];

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(data[i]['pic'] + "$i")),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
        body: Container(
          child: BoxComment(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final Comentario comentario = items[index];
                      return ComentContainer(comment: comentario, user: widget.user);
                    },
                    childCount: items.length,
                  ),
                )
              ],
            ),
            lead: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: posicion,
                icon: Container(),
                hint:
                    Icon(Icons.record_voice_over, color: Colors.grey, size: 30),
                onChanged: (String? value) {
                  setState(() {
                    posicion = value!;
                  });
                },
                items: [
                  DropdownMenuItem<String>(
                    value: 'pro',
                    child: Icon(Icons.check_circle_outline,
                        color: Colors.green[700], size: 35),
                  ),
                  DropdownMenuItem(
                    value: 'contra',
                    child: Icon(Icons.cancel_outlined,
                        color: Colors.red[700], size: 35),
                  ),
                  DropdownMenuItem(
                    value: 'nulo',
                    child: Icon(Icons.textsms_outlined,
                        color: Colors.grey, size: 35),
                  )
                ],
              ),
            ),

            errorText: 'Comment cannot be blank',
            sendButtonMethod: () {
              if (concController.text != '') {
                // setState(() {
                //   var value = {
                //     'name': 'New User',
                //     'pic':
                //         'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                //     'message': commentController.text
                //   };
                //   filedata.insert(0, value);
                // });
                commentController.clear();
                concController.clear();
                FocusScope.of(context).unfocus();
              } else {
                print("Not validated");
              }
            },
            formKey: formKey,
            argController: commentController,
            concController: concController,
            //backgroundColor: Colors.grey[200],
            hintText: 'Tu argumento ... ',
            textColor: Colors.black,
            sendWidget:
                Icon(Icons.send_sharp, size: 30, color: Color(0xff2660A4)),
          ),
        ));
  }
}
