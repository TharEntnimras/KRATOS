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
  bool borde;
  Icon? iconoadelante;

  BotonGenerico(
      {Key? key,
      this.text,
      this.onPressed,
      this.icon,
      this.sizeicon,
      this.backcolor,
      this.texcolor,
      this.borde = true,
      this.iconoadelante,
      required this.tsize,
      required this.height,
      required this.width});

  @override
  State createState() => _BotonGenericoState();
}

class _BotonGenericoState extends State<BotonGenerico> {
  Border bord = Border.all(color: Colors.black87);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.backcolor,
          border: widget.borde == false ? null : bord,
        ),
        child: widget.iconoadelante == null
            ? Center(
                child: showcenter(widget.text, widget.tsize, widget.texcolor))
            : Row(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  widget.iconoadelante!,
                  showcenter(widget.text, widget.tsize, widget.texcolor),
                ],
              ),
      ),
    );
  }

  Widget showcenter(String? text, double tsize, Color? texcolor) {
    if (text == null) {
      return FaIcon(
        widget.icon,
        size: widget.sizeicon,
      );
    }
    return Text(widget.text!,
        style: TextStyle(
            fontSize: tsize,
            fontFamily: "Gotham",
            color: texcolor,
            fontWeight: FontWeight.bold));
  }
}
