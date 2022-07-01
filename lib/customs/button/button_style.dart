import 'package:flutter/material.dart';

import '../color/colorconts.dart';

var styleButtonDialog = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(BC_ButtonText_style_White),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
      side: const BorderSide(color: BC_ButtonText_style_Black_Boarder),
      borderRadius: BorderRadius.circular(16),
    )));


var styleButtonDialogCancel = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(BC_ButtonText_style_Red),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
      side: const BorderSide(color: BC_ButtonText_style_Red),
      borderRadius: BorderRadius.circular(16),
    )));