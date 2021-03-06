import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:kratos_pdd/User/bloc/bloc_user.dart';

class UserSettings extends StatefulWidget {
  late UserBloc userBloc;
  //UserSettings();

  @override
  _UserSettings createState() => _UserSettings();
}

class _UserSettings extends State<UserSettings> {
  @override
  Widget build(BuildContext context) {
    widget.userBloc = BlocProvider.of(context);

    return DropdownButtonHideUnderline(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: DropdownButton(
          icon: Container(),
          hint: settings(),
          onChanged: (val) {
            setState(() {
              if (val == 1) {
                widget.userBloc.signOut();
                //widget.userBloc.disposeStreamVerificado();
              }
            });
          },
          items: [
            DropdownMenuItem(
              value: 0,
              child: userSettings(),
            ),
            DropdownMenuItem(
              value: 1,
              child: signout(),
            )
          ],
        ),
      ),
    );
  }

  Widget settings() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black45,
            width: 2.0,
            style: BorderStyle.solid,
          ),
          shape: BoxShape.circle),
      child: Icon(
        Icons.settings,
        size: 20.0,
        color: Colors.black54,
      ),
    );
  }

  Widget userSettings() {
    return FaIcon(
      FontAwesomeIcons.userCog,
      size: 20.0,
      color: Colors.black,
    );
  }

  Widget signout() {
    return Icon(
      Icons.logout,
      size: 25.0,
      color: Colors.black,
    );
  }
}
