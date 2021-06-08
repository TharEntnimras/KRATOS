import 'package:flutter/material.dart';

class LineaMeandros extends StatelessWidget {

  double width;
  LineaMeandros(this.width);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 1.5, bottom: 1.5),
      height: 20.0,
      width: width,
      color: Colors.black,
      child: Image(
        image: AssetImage('assets/meandrosh1.png'),
        alignment: Alignment.center,
        fit: BoxFit.contain,
        repeat: ImageRepeat.repeatX,
      ),
    );
  }
}
