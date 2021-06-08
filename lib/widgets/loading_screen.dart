import 'package:flutter/material.dart';
 
class LoadingScreen extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 80.0,
        width: 80.0,
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
          strokeWidth: 4.0,
         backgroundColor: Color(0xffCBA135),
        ),
      )
    );
  }
}