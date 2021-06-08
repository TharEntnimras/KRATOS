import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kratos_pdd/User/model/user.dart';
import 'package:kratos_pdd/User/ui/widgets/linea_meandros.dart';
import 'package:kratos_pdd/User/ui/widgets/user_image.dart';
import 'package:kratos_pdd/User/ui/widgets/user_name_mail.dart';
import 'package:kratos_pdd/widgets/boton_generico.dart';
import 'package:kratos_pdd/widgets/text_input.dart';

class NewUserScreen extends StatefulWidget {
  User user;

  NewUserScreen(this.user);

  @override
  _NewUserScreenState createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> {
  late String tipo;

  var _controllercodigouniversitario = TextEditingController();

    @override
  void dispose() {
    _controllercodigouniversitario.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

  
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "KRATOS",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Gotham",
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 3.0),
              Text(
                "Sin participacion, la democracia no funciona",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Gotham",
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),
            ],
          ),
        ]),
        toolbarHeight: 75.0,
        titleSpacing: 15.0,
        backgroundColor: Color(0xffFEFCFD),
        brightness: Brightness.light,
        elevation: 0.0,
        bottom: PreferredSize(
          child: LineaMeandros(screenwidth),
          preferredSize: Size(screenwidth, 10.0),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            Text(
              'Hagamos tu Perfil',
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Gotham",
                fontSize: 25.0,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 8.0),
            Text(
              'Ingresa tus datos por favor.',
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Gotham",
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 50.0),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UserImage(widget.user, Alignment.center, 70.0),
                  SizedBox(width: 15.0),
                  UserNameMail(widget.user),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Center(
                child: TextInput(
              alineacion: TextAlign.center,
              hintText: "Ingresa tu registro universitario",
              controller: _controllercodigouniversitario,
              //inputType: TextInputType.text,
              maxlines: 1,
            )),
            SizedBox(height: 30.0),
            TextField(
              maxLines: 1,
            ),
            SizedBox(height: 30.0),
            Center(
              child: BotonGenerico(
                height: 50.0,
                width: 180.0,
                text: 'Verificar codigo',
                onPressed: () {
             
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
