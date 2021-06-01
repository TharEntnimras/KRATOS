import 'package:flutter/material.dart';

class Propuestas extends StatelessWidget {
  
  Propuestas({Key key}) : super(key: key);

  List posts = [2, 3, 4, 5];
  List posts2 = ['Polo', 'Ana', 'Ricardo', 'Sergio'];

  Widget _numero(BuildContext context, int i) {
    return Center(
      child: Text(
        '${posts[i]}',
      ),
    );
  }
    Widget _letra(BuildContext context, int i) {
    return Center(
      child: Text(
        '${posts2[i]}',
      ),
    );
  }

  Widget _listBuilder(BuildContext context, int index) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Card(
        elevation: 1.5,
        margin: EdgeInsets.fromLTRB(6, 12, 6, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black38,
                  child: _numero(context, index),
                ),
                Padding(padding: EdgeInsets.only(left: 16)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _letra(context, index),
                      Padding(padding: EdgeInsets.only(top: 8)),
                     _letra(context, index),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: _listBuilder,
        ),
      ),
    );
  }
}
