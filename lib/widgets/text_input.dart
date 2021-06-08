import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final TextInputType? inputType;
  TextEditingController? controller;
  final TextAlign alineacion;
  int maxlines = 1;

  TextInput({
    Key? key,
    required this.hintText,
    this.controller,
    this.inputType,
    required this.maxlines,
    required this.alineacion
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 20.0, left: 20.0),
        child: TextField(
          autofocus: false,
          autocorrect: false,
          keyboardType: inputType,
          textAlign: alineacion,
          controller: controller,
          maxLines: maxlines,
          style: TextStyle(
              fontSize: 15.0,
              fontFamily: "Gotham",
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFe5e5e5),
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
