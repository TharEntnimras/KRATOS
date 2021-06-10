import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Container(
          padding: EdgeInsets.only(bottom: 5.0),
          child: Text(
            'Informacion',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Gotham",
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        toolbarHeight: 60.0,
        titleSpacing: 15.0,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 5.0),
          child: Container(
            color: Color(0xffB80000),
            height: 15.0,
            width: double.infinity,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: TextField(
          maxLines: 1,
        )
        
        //Text("Estas en la pagina de noticias"),
      ),
    );
  }
}
