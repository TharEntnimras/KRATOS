import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGenerico extends StatefulWidget {
  final String? text;
  double width = 0.0;
  double height = 0.0;
  final VoidCallback? onPressed;
  IconData? icon;
  double? sizeicon;
  double tsize;
  Color? backcolor;
  Color? texcolor = Colors.black54;

  BotonGenerico(
      {Key? key,
      this.text,
      this.onPressed,
      this.icon,
      this.sizeicon,
      this.backcolor,
      this.texcolor,
      required this.tsize,
      required this.height,
      required this.width});

  @override
  State createState() => _BotonGenericoState();
}

class _BotonGenericoState extends State<BotonGenerico> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.backcolor,
          border: Border.all(color: Colors.black45),
        ),
        child: showcenter(widget.text, widget.tsize,widget.texcolor),
      ),
    );
  }

  Center showcenter(String? text, double tsize, Color? texcolor) {
    if (text == null) {
      return Center(
        child: FaIcon(
          widget.icon,
          size: widget.sizeicon,
        ),
      );
    }
    return Center(
        child: Text(widget.text!,
            style: TextStyle(
              fontSize: tsize,
              fontFamily: "Gotham",
              color: texcolor,
            )));
  }
}
