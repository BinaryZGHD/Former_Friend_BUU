import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class TextLinkToScreenCustom extends StatelessWidget {
  final String linklabel;
  final Widget mapscreen;
  final linktextcolor;
  final double sizetext;
  final VoidCallback? onPressed;
  const TextLinkToScreenCustom(
      {Key? key, required this.linklabel, required this.mapscreen, required this.linktextcolor, this.onPressed, required this.sizetext})
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
      onTap: () async {
        Navigator.push(context, MaterialPageRoute(builder: (context) => mapscreen));
      },

    );
  }
}
