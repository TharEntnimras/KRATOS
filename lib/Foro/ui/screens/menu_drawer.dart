import 'package:flutter/material.dart';

import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:hidden_drawer_menu/model/screen_hidden_drawer.dart';
import 'package:kratos_pdd/Foro/ui/screens/foro_screen.dart';
import 'package:kratos_pdd/User/ui/screens/feed_user.dart';

class MenuDrawer extends StatefulWidget {
  

  @override
  _MenuDrawer createState() => _MenuDrawer();
}

class _MenuDrawer extends State<MenuDrawer> {
  List<ScreenHiddenDrawer> items = [];

  @override
  void initState() {
    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Feed",
          baseStyle: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 21.0,
            fontFamily: "Gotham",
            fontWeight: FontWeight.bold,
          ),
          colorLineSelected: Color(0xffD4AF37),
          selectedStyle: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontFamily: "Gotham",
            fontWeight: FontWeight.bold,
          ),
        ),
        FeedUser()));

    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Foro",
          baseStyle: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 21.0,
            fontFamily: "Gotham",
            fontWeight: FontWeight.bold,
          ),
          colorLineSelected: Color(0xffD4AF37),
           selectedStyle: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontFamily: "Gotham",
            fontWeight: FontWeight.bold,
          ),
        ),
        ForoScreen()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Color(0xff002147),
      backgroundColorAppBar: Colors.black,
      screens: items,
      //    typeOpen: TypeOpen.FROM_RIGHT,
      disableAppBarDefault: false,
      //    enableScaleAnimin: true,
      //    enableCornerAnimin: true,
      slidePercent: 28.5,
      verticalScalePercent: 100.0,
      contentCornerRadius: 10.0,
      //    iconMenuAppBar: Icon(Icons.menu),
      //    backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
      //    whithAutoTittleName: true,
      styleAutoTittleName: TextStyle(
        color: Colors.white,
        fontFamily: "Gotham",
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      ),
      //    actionsAppBar: <Widget>[],
      //backgroundColorContent: Colors.black,
      elevationAppBar: 3.0,
      //    tittleAppBar: Center(child: Icon(Icons.ac_unit),),
      enableShadowItensMenu: false,
      //    backgroundMenu: DecorationImage(image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
    );
  }
}
