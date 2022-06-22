import 'package:flutter/material.dart';

import 'color/colorconts.dart';

var styleButtonDialog = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.white),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
      side: const BorderSide(color: BC_ButtonRed),
      borderRadius: BorderRadius.circular(16),
// side: const BorderSide(color: Colors.amber)
    )));