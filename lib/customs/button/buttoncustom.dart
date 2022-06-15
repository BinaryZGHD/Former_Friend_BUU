import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../color/colorconts.dart';

class ButtonCustom extends StatelessWidget {
  final String label;
  final Widget screengo;
  final Color colortext;
  final Color colorbutton;
  final double sizetext;
  final Color colorborder;
  const ButtonCustom({Key? key, required this.label, required this.screengo, required this.colortext, required this.colorbutton, required this.sizetext, required this.colorborder, }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(

        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => screengo ));
          },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(colorbutton),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(15)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: colorborder, width: 2),
            ))),
        child: Text("  "+ label+"  ",
          style: TextStyle( fontSize: sizetext ,   color: colortext ,fontWeight: FontWeight.w600     ),
        ),
      );
  }
}
