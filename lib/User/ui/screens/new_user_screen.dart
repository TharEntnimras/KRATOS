import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:kratos_pdd/User/bloc/bloc_user.dart';
import 'package:kratos_pdd/User/model/user.dart';
import 'package:kratos_pdd/User/ui/screens/sign_in_screen.dart';
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
  late UserBloc userBloc;
  late User newuser;
  int index = 0;
  var _controllercodigouniversitario = TextEditingController();
  var _contusuario1 = TextEditingController();
  var _contusuario2 = TextEditingController();
  var _contusuario3 = TextEditingController();

  void dispose() {
    _controllercodigouniversitario.dispose();
    super.dispose();
  }

  late List opciones = [
    ingresoDeCodigo(),
    esEstudiante(),
    esDocente(),
    esAdmin(),
    esExAlumno(),
    eserror(),
    esOK()
  ];

  void setindex(int newindex) {
    setState(() {
      index = newindex;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    userBloc = BlocProvider.of(context);
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
            Row(
              children: [
                SizedBox(width: 60.0),
                IconButton(
                  onPressed: () {
                    userBloc.signOut();
                    //userBloc.disposeStreamVerificado();
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.signOutAlt,
                    color: Colors.black45,
                    size: 25.0,
                  ),
                )
              ],
            )
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
        body: opciones.elementAt(index));
  }

  Widget esEstudiante() {
    return Container(
      //margin: EdgeInsets.only(top: 15.0),
      padding: EdgeInsets.all(15.0),
      child: ListView(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              'Bienvenido\n'
              'Estudiante de Informatica',
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Gotham",
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 30.0),
            child: Text(
              'Hagamos que nuestra voz sea escuchada!',
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Gotham",
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 15.0),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 15.0),
            child: Text(
              'Ingresa tus datos con atencion\n'
              'No podras cambiar tus datos en un mes',
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Gotham",
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30.0),
          TextInput(
            hintText: 'Ingresa el semestre',
            maxlines: 1,
            controller: _contusuario1,
            alineacion: TextAlign.center,
            helptext: 'Ingresa el semestre que cursas',
          ),
          SizedBox(height: 35.0),
          Container(
            alignment: Alignment.center,
            //margin: EdgeInsets.only(top: 30.0),
            child: BotonGenerico(
              tsize: 22,
              height: 60.0,
              width: 200.0,
              text: 'REGISTRAR',
              onPressed: () {
                newuser = User(
                  uid: widget.user.uid,
                  name: widget.user.name,
                  photoURL: widget.user.photoURL,
                  email: widget.user.email,
                  tipo: 'Estudiante',
                  semestre: _contusuario1.text,
                );
                if (_contusuario1.text != "") {
                  setindex(6);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget esDocente() {
    return Container(
      //margin: EdgeInsets.only(top: 15.0),
      padding: EdgeInsets.all(15.0),
      child: ListView(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              'Bienvenido\n'
              'Docente de Informatica',
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Gotham",
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 30.0),
            child: Text(
              'Forjemos la Universidad que queremos!',
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Gotham",
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 15.0),
            child: Text(
              'Ingresa tus datos con atencion\n'
              'No podras cambiar tus datos en un mes',
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Gotham",
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30.0),
          TextInput(
            hintText: 'Tu grado. Ej: Licenciado en Informatica',
            maxlines: 1,
            controller: _contusuario1,
            alineacion: TextAlign.center,
            helptext: 'Ingresa tu grado academico',
          ),
          SizedBox(height: 20.0),
          TextInput(
            hintText: 'Tu antiguedad en la universidad',
            maxlines: 1,
            controller: _contusuario2,
            alineacion: TextAlign.center,
            helptext: 'Ingresa tu antiguedad',
          ),
          SizedBox(height: 20.0),
          TextInput(
            hintText: 'Tu cargo actual',
            maxlines: 1,
            controller: _contusuario3,
            alineacion: TextAlign.center,
            helptext: 'Ingresa tu cargo actual',
          ),
          SizedBox(height: 30.0),
          Container(
            alignment: Alignment.center,
            //margin: EdgeInsets.only(top: 30.0),
            child: BotonGenerico(
              tsize: 22,
              height: 60.0,
              width: 200.0,
              text: 'REGISTRAR',
              onPressed: () {
                newuser = User(
                    uid: widget.user.uid,
                    name: widget.user.name,
                    photoURL: widget.user.photoURL,
                    email: widget.user.email,
                    tipo: 'Docente',
                    grado: _contusuario1.text,
                    antiguedad: _contusuario2.text,
                    cargo: _contusuario3.text);
                if (_contusuario1.text != "" &&
                    _contusuario2.text != "" &&
                    _contusuario3.text != "") {
                  setindex(6);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget esAdmin() {
    return Container(
      //margin: EdgeInsets.only(top: 15.0),
      padding: EdgeInsets.all(15.0),
      child: ListView(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              'Bienvenido\n'
              'Administrativo de Informatica',
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Gotham",
                fontSize: 21.5,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 30.0),
            child: Text(
              'Forjemos la Universidad que queremos!',
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Gotham",
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 15.0),
            child: Text(
              'Ingresa tus datos con atencion\n'
              'No podras cambiar tus datos en un mes',
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Gotham",
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 25.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextInput(
                hintText: 'Tu grado. Ej: Licenciado en Informatica',
                maxlines: 1,
                controller: _contusuario1,
                alineacion: TextAlign.center,
                helptext: 'Ingresa tu grado academico',
              ),
              SizedBox(height: 20.0),
              TextInput(
                hintText: 'Tu antiguedad en la universidad',
                maxlines: 1,
                controller: _contusuario2,
                alineacion: TextAlign.center,
                helptext: 'Ingresa tu antiguedad',
              ),
              SizedBox(height: 20.0),
              TextInput(
                hintText: 'Tu cargo actual',
                maxlines: 1,
                controller: _contusuario3,
                alineacion: TextAlign.center,
                helptext: 'Ingresa tu cargo actual',
              ),
            ],
          ),
          SizedBox(height: 35.0),
          Container(
            alignment: Alignment.center,
            //margin: EdgeInsets.only(top: 30.0),
            child: BotonGenerico(
              tsize: 22,
              height: 60.0,
              width: 200.0,
              text: 'REGISTRAR',
              onPressed: () {
                newuser = User(
                    uid: widget.user.uid,
                    name: widget.user.name,
                    photoURL: widget.user.photoURL,
                    email: widget.user.email,
                    tipo: 'Administrativo',
                    grado: _contusuario1.text,
                    antiguedad: _contusuario2.text,
                    cargo: _contusuario3.text);
                if (_contusuario1.text != "" &&
                    _contusuario2.text != "" &&
                    _contusuario3.text != "") {
                  setindex(6);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget esExAlumno() {
    return Container(
      //margin: EdgeInsets.only(top: 15.0),
      padding: EdgeInsets.all(15.0),
      child: ListView(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              'Bienvenido\n'
              'Exalumno de Informatica',
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Gotham",
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 30.0),
            child: Text(
              'Guiemos a nuestros futuros colegas!',
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Gotham",
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 15.0),
            child: Text(
              'Ingresa tus datos con atencion\n'
              'No podras cambiar tus datos en un mes',
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Gotham",
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 25.0),
          TextInput(
            hintText: 'Tu grado. Ej: Licenciado en Informatica',
            maxlines: 1,
            controller: _contusuario1,
            alineacion: TextAlign.center,
            helptext: 'Ingresa tu grado academico',
          ),
          SizedBox(height: 20.0),
          TextInput(
            hintText: 'Tu año de graduacion',
            maxlines: 1,
            controller: _contusuario2,
            alineacion: TextAlign.center,
            inputType: TextInputType.number,
            helptext: 'Ingresa el año que te graduaste',
          ),
          SizedBox(height: 35.0),
          Container(
            alignment: Alignment.center,
            //margin: EdgeInsets.only(top: 30.0),
            child: BotonGenerico(
              tsize: 22,
              height: 60.0,
              width: 200.0,
              text: 'REGISTRAR',
              onPressed: () {
                newuser = User(
                    uid: widget.user.uid,
                    name: widget.user.name,
                    photoURL: widget.user.photoURL,
                    email: widget.user.email,
                    tipo: 'Exalumno',
                    grado: _contusuario1.text,
                    fecgrad: _contusuario2.text);

                if (_contusuario1.text != "" && _contusuario2.text != "") {
                  setindex(6);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Container ingresoDeCodigo() {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            // fit: FlexFit.tight,
            flex: 0,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Hagamos tu Perfil',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Gotham",
                      fontSize: 25.0,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Ingresa tus datos por favor.',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Gotham",
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 22.0),
          Flexible(
            fit: FlexFit.tight,
            flex: 0,
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
          Flexible(
            fit: FlexFit.tight,
            flex: 0,
            child: TextInput(
              alineacion: TextAlign.center,
              hintText: "Ingresa tu registro universitario",
              controller: _controllercodigouniversitario,
              inputType: TextInputType.text,
              maxlines: 1,
            ),
          ),
          SizedBox(
            height: 26.0,
          ),
          Flexible(
            // fit: FlexFit.tight,
            // flex: 0,
            child: Container(
              alignment: Alignment.topCenter,
              //margin: EdgeInsets.only(top: 30.0),
              child: BotonGenerico(
                tsize: 18.0,
                height: 50.0,
                width: 180.0,
                text: 'Verificar codigo',
                onPressed: () {
                  if (_controllercodigouniversitario.text == 'est') {
                    setindex(1);
                  } else {
                    if (_controllercodigouniversitario.text == 'doc') {
                      setindex(2);
                    } else {
                      if (_controllercodigouniversitario.text == 'adm') {
                        setindex(3);
                      } else {
                        if (_controllercodigouniversitario.text == 'exa') {
                          setindex(4);
                        } else {
                          setindex(5);
                        }
                      }
                    }
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget eserror() {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 150.0,
          ),
          Icon(
            Icons.report_problem_outlined,
            size: 150.0,
            color: Colors.black54,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Codigo en uso o inexistente',
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Gotham",
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget esOK() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.0,
        ),
        FaIcon(
          FontAwesomeIcons.checkCircle,
          size: 160.0,
          color: Color(0xff2660A4),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          'Hemos terminado!',
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Gotham",
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text(
            'Ahora participemos del debate para mejorar nuestra Carrera.',
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Gotham",
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 25.0,
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text(
            '¡Que la Democracia \n NO FUNCIONA \n si no se participa de ella!',
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Gotham",
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 35.0),
        BotonGenerico(
          backcolor: Color(0xff2660A4),
          texcolor: Colors.white,
          tsize: 25,
          height: 85,
          width: 220,
          text: 'A DEBATIR!',
          onPressed: () {
            userBloc.updateNewUserData(newuser);
            userBloc.getverif(newuser.uid);
         
          },
        )
      ],
    );
  }
}
