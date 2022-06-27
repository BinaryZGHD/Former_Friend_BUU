import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dialog/dialogboxcutom.dart';



class textSentOTPCustom extends StatelessWidget {
  final String textlabel;
  final textcolor;
  final double sizetext;
  final VoidCallback? onTap;
  const textSentOTPCustom(
      {Key? key, required this.textlabel, required this.textcolor, this.onTap, required this.sizetext,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(textlabel,
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: textcolor,
            decorationColor: textcolor,
            fontWeight: FontWeight.w600,
              fontSize: sizetext
          )),
      // onTap: () async {
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => mapscreen));
      // },
      onTap: onTap,
    );
  }
}
