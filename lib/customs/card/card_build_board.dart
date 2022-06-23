import 'package:flutter/material.dart';

import '../color/colorconts.dart';
import '../size/size.dart';

buildBoard(BuildContext context, {required String titile, required IconBoard}) {
  return GestureDetector(
    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 8,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          // height: MediaQuery.of(context).size.width * 0.3,
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: transparent),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    // Icon(
                    //   Icons.auto_stories_rounded,
                    //   color: IconBoarder,
                    //   size: MediaQuery.of(context).size.width * 0.2,
                    // ),
                    ShaderMask(
                      shaderCallback: (bounds) => RadialGradient(
                        center: Alignment(0.2, -0.6),
                        radius: 0.5,
                        colors: [
                          Color(0xFF0033B2),
                          Color(0xFF001B60),
                        ],
                        // tileMode: TileMode.clamp,
                        stops: <double>[0.1, 2.6],
                      ).createShader(bounds),
                      child: Icon(
                        IconBoard,
                        size: MediaQuery.of(context).size.width * 0.2,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      titile,
                      style: TextStyle(
                        fontSize: sizeTextBig20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ))),
    ),
  );
}
