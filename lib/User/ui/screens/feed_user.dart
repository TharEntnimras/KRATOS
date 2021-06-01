
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:flutter_lorem/flutter_lorem.dart';



import 'package:kratos_pdd/widgets/utils.dart';

class FeedUser extends StatefulWidget {
  static const androidIcon = Icon(Icons.library_books);


  @override
  _FeedUserState createState() => _FeedUserState();
}

class _FeedUserState extends State<FeedUser> {
  
  static const _itemsLength = 20;

   late List<Color> colors;
   late List<String> titles;
   late List<String> contents;

  @override
  void initState() {
    colors = getRandomColors(_itemsLength);
    titles = List.generate(_itemsLength, (index) => generateRandomHeadline());
    contents =
        List.generate(_itemsLength, (index) => lorem(paragraphs: 1, words: 24));
    super.initState();
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
                  backgroundColor: colors[index],
                  child: Text(
                    titles[index].substring(0, 1),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 16)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titles[index],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 8)),
                      Text(
                        contents[index],
                      ),
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

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: _itemsLength,
          itemBuilder: _listBuilder,
        ),
      ),
    );
  }


  @override
  Widget build(context) {
    return _buildAndroid(context);
  }
}
