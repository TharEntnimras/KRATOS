import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class BoxComment extends StatelessWidget {
  Widget? child;
  dynamic formKey;
  dynamic sendButtonMethod;
  dynamic argController;
  dynamic concController;
  Widget? lead;
  String? hintText;
  String? errorText;
  Widget? sendWidget;
  Color? backgroundColor;
  Color? textColor;

  Widget? header;
  FocusNode? focusNode;
  BoxComment(
      {this.child,
      this.header,
      this.sendButtonMethod,
      this.formKey,
      this.argController,
      this.concController,
      this.sendWidget,
      this.lead,
      this.hintText,
      this.focusNode,
      this.errorText,
      this.backgroundColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: child!),
        Divider(
          height: 1,
          color: Colors.black26,
        ),
        //header ?? SizedBox.shrink(),
        Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
               
                    autofocus: false,
                    autocorrect: false,
                    textAlign: TextAlign.left,
                    controller: concController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 1,
                    maxLength: 80,
                    cursorColor: Colors.black,
                    // style: TextStyle(
                    //     fontSize: fontsize,
                    //     fontFamily: fontfamily,
                    //     color: fontcolor,
                    //     fontWeight: fontweight),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(5),
                      filled: true,
                      fillColor: Colors.grey[200], //
                      //border: InputBorder.none,
                      hintText: 'Tu conclusion ...',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFe5e5e5)),
                          borderRadius: BorderRadius.all(Radius.circular(9.0))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFe5e5e5)),
                          borderRadius: BorderRadius.all(Radius.circular(9.0))),
                    ),
                  )),
              ListTile(
                tileColor: backgroundColor,
                leading: lead,
                // leading: Container(
                //   height: 40.0,
                //   width: 40.0,
                //   decoration: new BoxDecoration(
                //       color: Colors.blue,
                //       borderRadius: new BorderRadius.all(Radius.circular(50))),
                //   child: userImage == ''
                //       ? CircleAvatar(
                //           radius: 50, backgroundImage: NetworkImage(userImage!))
                //       : Container(),
                // ),
                title: Form(
                  key: formKey,
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 2,
                    minLines: 1,
                    focusNode: focusNode,
                    cursorColor: textColor,
                    style: TextStyle(color: textColor),
                    controller: argController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(4),
                      filled: true,
                      fillColor: Colors.grey[200], //
                      //border: InputBorder.none,
                      hintText: hintText,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFe5e5e5)),
                          borderRadius: BorderRadius.all(Radius.circular(9.0))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFe5e5e5)),
                          borderRadius: BorderRadius.all(Radius.circular(9.0))),
                    ),
                    // labelText: labelText,
                    // focusColor: textColor,
                    // fillColor: textColor,
                    // labelStyle: TextStyle(color: textColor),
                    //validator: (value) => value!.isEmpty ? errorText : null,
                  ),
                ),
                trailing: GestureDetector(
                  onTap: sendButtonMethod,
                  child: sendWidget,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
