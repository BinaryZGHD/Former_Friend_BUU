import 'package:f2fbuu/customs/button/button_style.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void dialogOneLineOneBtn(BuildContext context, String content ,String btn, {required void Function() onClickBtn}) {
  void _handleClickBtn() {
    onClickBtn();
  }

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
                    Text(content, textAlign: TextAlign.center),
                    SizedBox( height: 15),
                    ElevatedButton(
                      style: styleButtonDialog,
                      onPressed: () => {_handleClickBtn()},
                      child: Text(
                        btn,
                        style: const TextStyle(color: BC_ButtonText_style_Black),
                      ),
                    )
                  ],
                ),
              ),
            ));
      });
}

void dialogOneLineTwoBtn(BuildContext context, String content, String btn1, String btn2,
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
                  const SizedBox(height: 10),
                  Text(content, textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: styleButtonDialog,
                        onPressed: () => {_handleClickBtn("OK")},
                        child: Text(
                          btn1,
                          style: const TextStyle(color: BC_ButtonText_style_Black),
                        ),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        style: styleButtonDialogCancel,
                        onPressed: () => {_handleClickBtn("Cancel")},
                        child: Text(
                          btn2,
                          style: const TextStyle(color: BC_ButtonText_style_White),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ));
      });
}
