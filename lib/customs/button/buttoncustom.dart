import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final String label;


  final Color colortext;
  final Color colorbutton;
  final Color colorborder;
  final double sizetext;
  final double sizeborder;
  final VoidCallback? onPressed;
  const ButtonCustom({
    Key? key,
    required this.label,
    required this.colortext,
    required this.colorbutton,
    required this.sizetext,
    required this.colorborder,

    this.onPressed, required, required this.sizeborder ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(

          elevation: MaterialStateProperty.all(sizeborder), //Defines Elevation
          // shadowColor: MaterialStateProperty.all(Colors.black), //Defines Shadow Color
          backgroundColor: MaterialStateProperty.all<Color>(colorbutton),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(10)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
            side: BorderSide(color: colorborder, width: 2),
          ))),
      child: Text(
        "   $label   ",
        style: TextStyle(fontSize: sizetext, color: colortext, fontWeight: FontWeight.w600),
      ),
    );
  }
}
