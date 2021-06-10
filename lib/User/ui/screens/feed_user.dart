import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';


class FeedUser extends StatefulWidget {
  static const androidIcon = Icon(Icons.library_books);

  @override
  _FeedUserState createState() => _FeedUserState();
}

class _FeedUserState extends State<FeedUser> {
  @override
  void initState() {}

  // Widget _buildAndroid(BuildContext context) {
  //   return Scaffold(
  //     body: Container(
  //       child: ListView.builder(
  //         itemCount: _itemsLength,
  //         itemBuilder: _listBuilder,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(context) {
    return Scaffold(
      body: Center(
        child: Text('Feed Screen'),
      ),
    );
  }
}
