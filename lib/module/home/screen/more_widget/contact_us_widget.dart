import 'package:f2fbuu/customs/commingsoon_screen.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:flutter/material.dart';

contactUsWidget(
  BuildContext context,
) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          size: sizeTitle24,
          color: Colors.black,
        ),
      ),
      title: const Text(
        "",
        style: TextStyle(
          color: Colors.black,
          fontSize: sizeTitle24,
        ),
      ),
    ),
    body: const SafeArea(
      child: CommingSoonScreen(),
    ),
  );
}
