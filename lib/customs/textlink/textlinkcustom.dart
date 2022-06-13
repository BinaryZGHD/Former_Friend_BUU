import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class TextLinkCustom extends StatelessWidget {
  final String linklabel;
  final String linkurl;
  final Widget mapscreen;
  final linktextcolor;
  final VoidCallback? onPressed;
  const TextLinkCustom(
      {Key? key, required this.linklabel, required this.linkurl, required this.mapscreen, required this.linktextcolor, this.onPressed})
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
          )),
      onTap: () async {
        Navigator.push(context, MaterialPageRoute(builder: (context) => mapscreen));
      },
    );
  }
}
