import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final TextInputType? inputType;
  TextEditingController controller;
  final TextAlign alineacion;
  String? helptext;
  int? maxlines = 1;
  final String fontfamily;
  double fontsize;
  Color fontcolor;
  int? maxlenght;
  double margen;
  Color colorfondo;
  FontWeight fontweight;
 

  TextInput(
      {Key? key,
      this.fontfamily = 'Gotham',
      required this.hintText,
      required this.controller,
      this.inputType,
      this.fontsize = 15,
      required this.maxlines,
      required this.alineacion,
      this.helptext,
      this.margen = 20,
      this.maxlenght,
      this.fontweight = FontWeight.bold,
      this.colorfondo = const Color(0xFFe5e5e5),
      this.fontcolor = Colors.black87});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: margen, left: margen),
        child: TextField(
          autofocus: false,
          autocorrect: false,
          keyboardType: inputType,
          textAlign: alineacion,
          controller: controller,
          enableSuggestions: false,
          maxLines: maxlines,
          maxLength: maxlenght,
          cursorColor: Colors.black,
          style: TextStyle(
              fontSize: fontsize,
              fontFamily: fontfamily,
              color: fontcolor,
              fontWeight: fontweight),
          decoration: InputDecoration(
            //contentPadding: padding == null ? null : const EdgeInsets.all(4),
            helperText: helptext,
            filled: true,
            fillColor: colorfondo, //
            border: InputBorder.none,
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFe5e5e5)),
                borderRadius: BorderRadius.all(Radius.circular(9.0))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFe5e5e5)),
                borderRadius: BorderRadius.all(Radius.circular(9.0))),
          ),
        ));
  }
}
