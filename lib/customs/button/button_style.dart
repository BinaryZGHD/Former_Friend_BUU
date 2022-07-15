import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:flutter/material.dart';

var styleButtonDialog = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(tcButtonTextWhite),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
      side: const BorderSide(color: tcButtonTextBoarder),
      borderRadius: BorderRadius.circular(16),
    )));


var styleButtonDialogCancel = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(tcButtonTextRed),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
      side: const BorderSide(color: tcButtonTextRed),
      borderRadius: BorderRadius.circular(16),
    )));