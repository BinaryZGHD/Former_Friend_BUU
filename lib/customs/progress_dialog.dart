import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:flutter/material.dart';

class ProgressDialog {
  void showProgressDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Container(
            color: TC_White,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(
              color: circleprogresscolor,
            ),
          );
        });
  }

  void hideProgressDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
