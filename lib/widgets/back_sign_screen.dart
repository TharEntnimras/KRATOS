import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class BackSignScreen extends StatelessWidget {
  // double height = 0.0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        FadeInLeft(
            duration: Duration(milliseconds: 1500),
            child: Meandros(
              screenHeight: screenHeight,
            )),
        SizedBox(width: screenwidth - 112.0),
        FadeInRight(
            duration: Duration(milliseconds: 1500),
            child: Meandros(
              screenHeight: screenHeight,
            ))
      ],
    );
  }
}

class Meandros extends StatelessWidget {
  const Meandros({Key key, @required this.screenHeight}) : super(key: key);

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 1.0, right: 1.0),
      color: Colors.black,
      width: 56.0,
      height: screenHeight,
      child: Image(
        image: AssetImage('assets/meandros.png'),
        alignment: Alignment.topCenter,
        fit: BoxFit.fitHeight,
        repeat: ImageRepeat.repeat,
      ),
    );
  }
}
