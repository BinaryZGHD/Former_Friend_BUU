import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../color/colorconts.dart';
import '../size/size.dart';


buildCardBoard(BuildContext context, {VoidCallback? onTap, required String title, required IconBoard}) {
  return GestureDetector(
    onTap: onTap,
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
                      title,
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


buildCardMore({
  VoidCallback? onTap,
  required String title,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
      child:
          // Container(
          //   padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: TC_White),
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height * 0.1,
          Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 8,
        child: Container(
          margin: EdgeInsets.all(1),
          // padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          decoration: BoxDecoration(
            color: Color(0xFF94CCF9),
            border: Border.all(
              color: transparent,
              width: 4,
            ),
            borderRadius: BorderRadius.circular(12.0),
            gradient: LinearGradient(stops: [
              0.02,
              0.02,
              0.94
            ], colors: [
              // Color(0xFF000000),
              Colors.white,
              Colors.white,
              // Color(0xFFCECECE),
              Colors.white,
            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "   " + title,
                style: TextStyle(fontSize: 20, color: TC_Black),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: TC_Black,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
