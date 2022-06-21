import 'package:flutter/material.dart';

class ProgressDialog {
  void showProgressDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(color: Colors.amber,),
          );
        });
  }

  void hideProgressDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
