import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:kratos_pdd/Participacion/bloc/part_bloc.dart';
import 'package:kratos_pdd/Participacion/model/propuesta.dart';
import 'package:kratos_pdd/User/model/user.dart';
import 'package:kratos_pdd/widgets/boton_generico.dart';
import 'package:kratos_pdd/widgets/text_input.dart';

class NewProp extends StatefulWidget {
  final User user;
  const NewProp({Key? key, required this.user});

  @override
  _NewPropState createState() => _NewPropState();
}

class _NewPropState extends State<NewProp> {
  late PartBloc partBloc;

  var probcontrol = TextEditingController();
  var solcontrol = TextEditingController();
  var argcontrol = TextEditingController();
  var nomcontrol = TextEditingController();

  late String _valOrden = '';
  List<DropdownMenuItem<String>> items = [
    DropdownMenuItem(
      value: 'acad',
      child: Text(
        'Academico',
        style: TextStyle(
          fontFamily: "Basker",
          fontSize: 15,
        ),
      ),
    ),
    DropdownMenuItem(
      value: 'admin',
      child: Text(
        'Administrativo',
        style: TextStyle(
          fontFamily: "Basker",
          fontSize: 15,
        ),
      ),
    ),
    DropdownMenuItem(
      value: 'comu',
      child: Text(
        'Comunidad',
        style: TextStyle(
          fontFamily: "Basker",
          fontSize: 15,
        ),
      ),
    ),
  ];

  late String _valAcad;
  List<DropdownMenuItem<String>> itemsacad = [
    DropdownMenuItem(
      value: 'Pedagogia',
      child: Text(
        'Pedagogia',
        style: TextStyle(
          fontFamily: "Basker",
          fontSize: 15,
        ),
      ),
    ),
    DropdownMenuItem(
      value: 'Contenido',
      child: Text(
        'Contenido',
        style: TextStyle(
          fontFamily: "Basker",
          fontSize: 15,
        ),
      ),
    ),
    DropdownMenuItem(
      value: 'Gestion',
      child: Text(
        'Gestion',
        style: TextStyle(
          fontFamily: "Basker",
          fontSize: 15,
        ),
      ),
    ),
    DropdownMenuItem(
      value: 'Pensum',
      child: Text(
        'Pensum',
        style: TextStyle(
          fontFamily: "Basker",
          fontSize: 15,
        ),
      ),
    ),
    DropdownMenuItem(
      value: 'Filosofica',
      child: Text(
        'Filosofica',
        style: TextStyle(
          fontFamily: "Basker",
          fontSize: 15,
        ),
      ),
    ),
  ];

  late String _valAdmin;
  List<DropdownMenuItem<String>> itemsadmin = [
    DropdownMenuItem(
      value: 'Infraestructura',
      child: Text(
        'Infraestructura',
        style: TextStyle(
          fontSize: 15,
          fontFamily: 'Basker',
        ),
      ),
    ),
    DropdownMenuItem(
      value: 'Vivir bien',
      child: Text(
        'Vivir bien',
        style: TextStyle(
          fontFamily: "Basker",
          fontSize: 15,
        ),
      ),
    ),
    DropdownMenuItem(
      value: 'Tramites',
      child: Text(
        'Tramites',
        style: TextStyle(
          fontFamily: "Basker",
          fontSize: 15,
        ),
      ),
    ),
    DropdownMenuItem(
      value: 'Reglamentos',
      child: Text(
        'Reglamentos',
        style: TextStyle(
          fontFamily: "Basker",
          fontSize: 15,
        ),
      ),
    ),
    DropdownMenuItem(
      value: 'Recursos',
      child: Text(
        'Recursos',
        style: TextStyle(
          fontFamily: "Basker",
          fontSize: 15,
        ),
      ),
    ),
  ];

  late String _valComu;
  List<DropdownMenuItem<String>> itemscomu = [
    DropdownMenuItem(
      value: 'Convivencia',
      child: Text(
        'Convivencia',
        style: TextStyle(
          fontFamily: "Basker",
          fontSize: 15,
        ),
      ),
    ),
    DropdownMenuItem(
      value: 'Vivir bien',
      child: Text(
        'Vivir bien',
        style: TextStyle(
          fontFamily: "Basker",
          fontSize: 15,
        ),
      ),
    ),
    DropdownMenuItem(
      value: 'Filosofica',
      child: Text(
        'Filosofica',
        style: TextStyle(
          fontFamily: "Basker",
          fontSize: 15,
        ),
      ),
    ),
    DropdownMenuItem(
      value: 'Ayuda',
      child: Text(
        'Ayuda',
        style: TextStyle(
          fontFamily: "Basker",
          fontSize: 15,
        ),
      ),
    ),
    DropdownMenuItem(
      value: 'Estudio',
      child: Text(
        'Estudio',
        style: TextStyle(
          fontFamily: "Basker",
          fontSize: 15,
        ),
      ),
    ),
  ];

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
                'Nueva Propuesta',
                style: TextStyle(
                  fontSize: 21.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Gotham",
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 80),
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
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  'Recuerda: ',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Basker",
                      color: Colors.black),
                ),
                const SizedBox(height: 5),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Las Propuestas son SOLUCIONES. \n\n"Tengo una '
                    'idea que puede mejorar nuestra Carrera de Informatica" ese deberia ser tu pensamiento antes de redactar una propuesta.\n\nLas propuestas se hacen a un orden especifico, el orden academico, el orden de la comunidad y el orden administrativo. \n\nEl orden es A QUIEN elevas tu propuesta, asi que piensalo bien ¡no los confundas! \n\nTambien, cada orden contiene diferentes categorias, asi que elige la categoria que más se acomode a tu propuesta. ',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Basker",
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Divider(),
                const SizedBox(height: 8),
                Text(
                  'Orden y categoria',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Basker",
                      color: Colors.black),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                        width: 140,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            helperText: 'Orden',
                          ),
                          items: items,
                          hint: Text(
                            'Orden',
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Basker",
                                color: Colors.black),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _valOrden = value!;
                              _valAcad = '';
                              _valAdmin = '';
                              _valComu = '';
                              print(_valOrden);
                            });
                          },
                        )),
                    const SizedBox(width: 30),
                    _valOrden == 'acad'
                        ? Container(
                            width: 140,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                helperText: 'Categoria',
                              ),
                              value: 'Pedagogia',
                              items: itemsacad,
                              hint: Text(
                                'Categoria',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Basker",
                                    color: Colors.black),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  _valAcad = value!;
                                  print(_valAcad);
                                });
                              },
                            ))
                        : _valOrden == 'admin'
                            ? Container(
                                width: 140,
                                child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    helperText: 'Categoria',
                                  ),
                                  value: 'Infraestructura',
                                  items: itemsadmin,
                                  hint: Text(
                                    'Categoria',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: "Basker",
                                        color: Colors.black),
                                  ),
                                  onChanged: (String? value) {
                                    setState(() {
                                      _valAdmin = value!;
                                      print(_valAdmin);
                                    });
                                  },
                                ))
                            : _valOrden == 'comu'
                                ? Container(
                                    width: 140,
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                        helperText: 'Categoria',
                                      ),
                                      value: 'Convivencia',
                                      items: itemscomu,
                                      hint: Text(
                                        'Categoria',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: "Basker",
                                            color: Colors.black),
                                      ),
                                      onChanged: (String? value) {
                                        setState(() {
                                          _valComu = value!;
                                          print(_valComu);
                                        });
                                      },
                                    ))
                                : Container(),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Nombre o Titular',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Basker",
                      color: Colors.black),
                ),
                SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  height: 100,
                  child: TextInput(
                    fontcolor: Colors.black87,
                    fontfamily: 'Basker',
                    fontsize: 17,
                    hintText: 'El nombre o titulo de tu propuesta.',
                    maxlines: 2,
                    inputType: TextInputType.multiline,
                    maxlenght: 70,
                    controller: nomcontrol,
                    colorfondo: Colors.white,
                    alineacion: TextAlign.left,
                    margen: 0,
                    fontweight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Problema',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Basker",
                      color: Colors.black),
                ),
                SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  height: 250,
                  child: TextInput(
                    fontcolor: Colors.black87,
                    fontfamily: 'Basker',
                    fontsize: 17,
                    hintText: 'Describe el problema de manera breve.',
                    maxlines: 15,
                    inputType: TextInputType.multiline,
                    maxlenght: 300,
                    controller: probcontrol,
                    alineacion: TextAlign.left,
                    margen: 0,
                    fontweight: FontWeight.w500,
                    colorfondo: Colors.white,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Solucion',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Basker",
                      color: Colors.black),
                ),
                SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  height: 250,
                  child: TextInput(
                    fontcolor: Colors.black87,
                    fontfamily: 'Basker',
                    fontsize: 17,
                    hintText:
                        'Describe de manera breve la solucion al problema planteado.',
                    maxlines: 15,
                    inputType: TextInputType.multiline,
                    maxlenght: 300,
                    controller: solcontrol,
                    alineacion: TextAlign.left,
                    margen: 0,
                    colorfondo: Colors.white,
                    fontweight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Argumento',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Basker",
                      color: Colors.black),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 600,
            child: TextInput(
              fontcolor: Colors.black87,
              fontfamily: 'Basker',
              fontsize: 17,
              hintText:
                  'Aqui escribes tu argumento, el por qué tu solucion ES la solucion al problema que planteaste.\n\nEs aqui donde debe brillar tu propuesta y tus habilidades.\n\n'
                  'Fundamenta tu solucion con teoria academica y/o estudios academicos de ser necesario, asi tu solucion gozara de mas peso y credibilidad.',
              maxlines: 40,
              inputType: TextInputType.multiline,
              controller: argcontrol,
              alineacion: TextAlign.left,
              margen: 0,
              colorfondo: Colors.white,
              fontweight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 40),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Material(
                  child: BotonGenerico(
                    tsize: 25,
                    height: 80,
                    width: 250,
                    text: 'ENVIAR',
                    texcolor: Colors.white,
                    backcolor: Color(0xffCBA135),
                    onPressed: () {
                      if (nomcontrol.text != "" &&
                          probcontrol.text != "" &&
                          solcontrol.text != "" &&
                          argcontrol.text != "") {
                        Navigator.pop(context);
                        partBloc.updatePropuestaDB(Propuesta(
                            orden: _valOrden,
                            nomprop: nomcontrol.text,
                            problema: probcontrol.text,
                            solucion: solcontrol.text,
                            argumento: argcontrol.text,
                            categoria: _valOrden == 'acad'
                                ? _valAcad
                                : _valOrden == 'admin'
                                    ? _valAdmin
                                    : _valComu,
                            ownerTipo: widget.user.tipo!,
                            ownerName: widget.user.name,
                            ownerUid: widget.user.uid,
                            fecha: DateTime.now().toString()));
                      } else {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text(
                              'Importante',
                              style: TextStyle(
                                  fontFamily: "Gotham",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21),
                            ),
                            content: const Text(
                              'Rellena todos los datos por favor.',
                              style:
                                  TextStyle(fontFamily: "Gotham", fontSize: 18),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text(
                                  'OK',
                                  style: TextStyle(
                                      fontFamily: 'Gotham',
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffCBA135)),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    iconoadelante: Icon(
                      Icons.upload_file_outlined,
                      size: 50,
                      color: Colors.white,
                    ),
                    borde: false,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
