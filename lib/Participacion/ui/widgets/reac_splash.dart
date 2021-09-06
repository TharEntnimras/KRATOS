import 'package:flutter/material.dart';
import 'dart:math';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReacSplash extends StatelessWidget {
  int numapoyo;
  int numencanta;
  int numrevisar;
  int numnoapoyo;
  List<Widget> splash = [];
  ReacSplash(
      {Key? key,
      required this.numapoyo,
      required this.numencanta,
      required this.numrevisar,
      required this.numnoapoyo});

  // int elmayorde4(a,b,c,d){
  //   return max(max(max(a, b), c), d);
  // }
  // int elmayorde3(a,b,c){
  //   return max(max(a, b), c);
  // }
  // int elmayorde2(a,b){
  //   return max(a, b);
  // }

  Widget apoyo = Container(
    margin: const EdgeInsets.symmetric(horizontal: 0.7, ),
    height: 20,
    width: 20,
    alignment: Alignment.center,
    //padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.blue[600],
      shape: BoxShape.circle,
    ),
    child: const FaIcon(
      FontAwesomeIcons.fistRaised,
      size: 12.0,
      color: Colors.white,
    ),
  );

  Widget encanta = Container(
    margin: const EdgeInsets.symmetric(horizontal: 0.7, ),
    height: 20,
    width: 20,
    alignment: Alignment.center,
    //padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.red,
      shape: BoxShape.circle,
    ),
    child: Icon(
      Icons.favorite,
      size: 12.0,
      color: Colors.white,
    ),
  );
  Widget revisar = Container(
    margin: const EdgeInsets.symmetric(horizontal: 0.7, ),
    height: 20,
    width: 20,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.orange[600],
      shape: BoxShape.circle,
    ),
    child: const Icon(
      Icons.menu_book_rounded,
      size: 12.0,
      color: Colors.white,
    ),
  );
  Widget noapoyo = Container(
    margin: const EdgeInsets.symmetric(horizontal: 0.7,),
    height: 20,
    width: 20,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.grey[700],
      shape: BoxShape.circle,
    ),
    child: const Icon(
      Icons.thumb_down_alt_rounded,
      size: 12.0,
      color: Colors.white,
    ),
  );

  @override
  Widget build(BuildContext context) {
    List<int> nums = [numapoyo, numencanta, numrevisar, numnoapoyo];
    nums.sort();
    if (nums.reduce((max)) != 0) {
      for (int i = 3; i >= 0; i--) {
        if (nums[i] != 0) {
          if (nums[i] == numapoyo) {
            if (splash.contains(apoyo) == false) {
              splash.add(apoyo);
            }
          }
          if (nums[i] == numencanta) {
            if (splash.contains(encanta) == false) {
              splash.add(encanta);
            }
          }
          if (nums[i] == numrevisar) {
            if (splash.contains(revisar) == false) splash.add(revisar);
          }
          if (nums[i] == numnoapoyo) {
            if (splash.contains(noapoyo) == false) splash.add(noapoyo);
          }
        }
      }
    }
    return Row(
      children: splash,
    );
  }
}
