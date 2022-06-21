import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../button_style.dart';
import '../color/colorconts.dart';

void dialogOneLineOneBtn(BuildContext context, String content, String btn,
    {required void Function() onClickBtn}) {
  void _handleClickBtn() {
    onClickBtn();
  }

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Text(
                    //   title,
                    //   style: const TextStyle(fontWeight: FontWeight.bold),
                    // ),
                    Text(content, textAlign: TextAlign.center),
                    ElevatedButton(
                      style: styleButtonDialog,
                      onPressed: () => {_handleClickBtn()},
                      child: Text(
                        btn,
                        style: const TextStyle(color: BC_ButtonRed),
                      ),
                    )
                  ],
                ),
              ),
            ));
      });
}

void dialogOneLineTwoBtn(
    BuildContext context, String content, String btn1, String btn2,
    {required void Function(String result) onClickBtn}) {
  void _handleClickBtn(String result) {
    onClickBtn(result);
  }

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Text(
                  //   title,
                  //   style: const TextStyle(fontWeight: FontWeight.bold),
                  // ),
                  Text(content, textAlign: TextAlign.center),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: styleButtonDialog,
                        onPressed: () => {_handleClickBtn("OK")},
                        child: Text(
                          btn1,
                          style: const TextStyle(color: BC_ButtonRed),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        style: styleButtonDialog,
                        onPressed: () => {_handleClickBtn("Cancel")},
                        child: Text(
                          btn2,
                          style: const TextStyle(color: BC_ButtonRed),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ));
      });
}