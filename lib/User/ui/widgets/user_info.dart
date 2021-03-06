import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:generic_bloc_provider/generic_bloc_provider.dart';
//import 'package:kratos_pdd/User/bloc/bloc_user.dart';
//import 'package:kratos_pdd/User/ui/widgets/user_settings.dart';

import 'package:kratos_pdd/User/model/user.dart';

class UserInfo extends StatefulWidget {
  User user;
  //UserBloc? userBloc;
  UserInfo(this.user);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  Widget userphoto() {
    return CachedNetworkImage(
      imageUrl: widget.user.photoURL!,
      imageBuilder: (context, imageProvider) => Container(
        width: 110.0,
        height: 110.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 3.0,
            style: BorderStyle.solid,
          ),
          shape: BoxShape.circle,
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 3.0,
            style: BorderStyle.solid,
          ),
          shape: BoxShape.circle,
        ),
      ),
        errorWidget: (context, url, error) => Icon(Icons.error),
    );
    
    // return Container(
    //   width: 110.0,
    //   height: 110.0,
    //   decoration: BoxDecoration(
    //       border: Border.all(
    //         color: Colors.black,
    //         width: 3.0,
    //         style: BorderStyle.solid,
    //       ),
    //       shape: BoxShape.circle,
    //       image: DecorationImage(
    //         fit: BoxFit.cover,
    //         image:  DecorationImage(image: CachedNetworkImage(imageUrl: widget.user.photoURL!)),         // CachedNetworkImage(imageUrl: widget.user.photoURL!)//NetworkImage(widget.user.photoURL!),
    //       )),
    // );
  }

  @override
  Widget build(BuildContext context) {
    print("RENDEREANDO LA SCREEN WREY");

    //widget.userBloc = BlocProvider.of(context);

    final userInfo = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.user.tipo!,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Gotham',
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
            margin: EdgeInsets.only(bottom: 5.0),
            child: Text(
              widget.user.name,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Gotham',
              ),
              textAlign: TextAlign.center,
            )),
        Text(widget.user.email!,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.black,
              fontFamily: 'Gotham',
            )),
      ],
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 15.0,
          ),
          userphoto(),
          SizedBox(
            height: 20.0,
          ),
          userInfo
        ],
      ),
    );
  }
}
