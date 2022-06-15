import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dialog/dialogboxcutom.dart';



class TextLinkOTPCustom extends StatelessWidget {
  final String linklabel;
  final String tiltle;
  final String description;
  final Widget mapscreen;
  final linktextcolor;
  final double sizetext;
  final VoidCallback? onPressed;
  const TextLinkOTPCustom(
      {Key? key, required this.linklabel, required this.mapscreen, required this.linktextcolor, this.onPressed, required this.sizetext, required this.tiltle, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(linklabel,
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: linktextcolor,
            decorationColor: linktextcolor,
            fontWeight: FontWeight.w600,
              fontSize: sizetext
          )),
      // onTap: () async {
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => mapscreen));
      // },
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => CustomDialogBox(
              id: '',
              title: tiltle,
              description: description + 'กิจกรรมที่ทำแล้ว',
              mapscreen: mapscreen,
            ));
      },
    );
  }
}
