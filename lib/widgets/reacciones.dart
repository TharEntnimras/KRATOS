import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Reacciones {
  get reacDefault => Reaction(
        id: 100,
        icon: Container(
          //color: Colors.black12,
          padding: const EdgeInsets.only(left: 30, right: 20), //top = 8
          //height: 10.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.fistRaised,
                size: 18,
                color: Colors.grey,
              ),
              const SizedBox(width: 5),
              Text(
                'Apoyar',
                style: TextStyle(
                    color: Colors.grey[600], fontSize: 13, fontFamily: 'Helv'),
              ),
            ],
          ),
        ),
      );

  List<Reaction> get reactions => [
        Reaction(
          id: 1,
          icon: Container(
            //color: Colors.black12,
            padding: const EdgeInsets.only(left: 20, right: 20),
            //height: 10.0,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                   Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 3),
                  height: 23,
                  width: 23,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue[600], //Color(0xff2660A4),
                    shape: BoxShape.circle,
                  ),
                  child: const FaIcon(
                    FontAwesomeIcons.fistRaised,
                    size: 16.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  'Apoyo',
                  style: TextStyle(
                    color:  Colors.blue[600], 
                    fontSize: 13,
                    fontFamily: 'Helv',
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          previewIcon: Container(
            margin: const EdgeInsets.symmetric(horizontal: 3,vertical: 5),
            height: 32,
            width: 32,
            alignment: Alignment.center,
            //padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.blue[600],
              shape: BoxShape.circle,
            ),
            child: const FaIcon(
              FontAwesomeIcons.fistRaised,
              size: 21.0,
              color: Colors.white,
            ),
          ),
        ),
        Reaction(
          id: 2,
          icon: Container(
            //color: Colors.black12,
            padding: const EdgeInsets.only(left: 8, right: 20),
            //height: 10.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 3,),
                  height: 23,
                  width: 23,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red[400],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite,
                    size: 16.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  'Me encanta',
                  style: TextStyle(
                    color: Colors.red[400], //Color(0xFF0077FF),
                    fontSize: 13,
                    fontFamily: 'Helv',
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          previewIcon: Container(
            margin: const EdgeInsets.symmetric(horizontal: 3,vertical: 5),
            height: 32,
            width: 32,
            alignment: Alignment.center,
            //padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.favorite,
              size: 21.0,
              color: Colors.white,
            ),
          ),
        ),
        Reaction(
          id: 3,
          icon: Container(
            //color: Colors.black12,
            padding: const EdgeInsets.only(left: 20, right: 20),
            //height: 10.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 3,),
                   height: 23,
                  width: 23,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.orange[600],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.menu_book_rounded,
                    size: 16.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  'Revisar',
                  style: TextStyle(
                      color: Colors.orange[600],
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Helv'),
                ),
              ],
            ),
          ),
          previewIcon: Container(
            margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
            height: 32,
            width: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.orange[600],
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.menu_book_rounded,
              size: 21.0,
              color: Colors.white,
            ),
          ),
        ),
        Reaction(
          id: 4,
          icon: Container(
            padding: const EdgeInsets.only(left: 13, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 3,),
                  height: 23,
                  width: 23,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.thumb_down_alt_rounded,
                    size: 16.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  'No apoyo',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 13,
                      fontFamily: 'Helv',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          previewIcon: Container(
            margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
            height: 32,
            width: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[700],
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.thumb_down_alt_rounded,
              size: 21.0,
              color: Colors.white,
            ),
          ),
        ),
        Reaction(
        id: 5,
        icon: Container(
          //color: Colors.black12,
          padding: const EdgeInsets.only(left: 30, right: 20), //top = 8
          //height: 10.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.fistRaised,
                size: 18,
                color: Colors.grey[600],
              ),
              const SizedBox(width: 5),
              Text(
                'Apoyar',
                style: TextStyle(
                    color: Colors.grey[600], fontSize: 13, fontFamily: 'Helv'),
              ),
            ],
          ),
        ),
          previewIcon: Container(
            margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
            height: 32,
            width: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[50],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.block_rounded,
              size: 34.0,
              color: Colors.grey[500],
            ),
          ),
      )
      ];
}
