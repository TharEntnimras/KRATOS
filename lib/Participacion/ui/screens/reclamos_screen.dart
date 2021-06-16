import 'package:flutter/material.dart';

class ReclamosScreen extends StatelessWidget {
  const ReclamosScreen({Key? key,   });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          brightness: Brightness.dark,
          title: Container(
            padding: EdgeInsets.only(bottom: 5.0),
            child: Text(
              'Reclamos',
              style: TextStyle(
                fontSize: 21.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Gotham",
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: Colors.black,
          toolbarHeight: 57.0,
          titleSpacing: 15.0,
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 5.0),
            child: Container(
              color: Color(0xffCBA135),
              height: 15.0,
              width: double.infinity,
            ),
          ),
        ),
        body: Container(),
      
    );
  }
}