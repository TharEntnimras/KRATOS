import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGenerico extends StatefulWidget {
  final String text;
  double width = 0.0;
  double height = 0.0;
  final VoidCallback onPressed;
  IconData icon;
  double sizeicon;

  BotonGenerico(
      {Key key,
      this.text,
      this.onPressed,
      this.icon,
      this.sizeicon,
      @required this.height,
      @required this.width});

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
          border: Border.all(color: Colors.black45),
        ),
        child: showcenter(widget.text),
      ),
    );
  }

  Center showcenter(String text) {
    if (text == null) {
      return Center(
        child: FaIcon(
          widget.icon,
          size: widget.sizeicon,
        ),
      );
    }
    return Center(
        child: Text(widget.text,
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: "Gotham",
              color: Colors.black54,
            )));
  }
}
