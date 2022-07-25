
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/module/home/model/response/more_response/screen_more_board_student_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

boardItemStudent({
  DataGenList? data,
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        child: Table(
          border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
          columnWidths: const {0: FractionColumnWidth(0.3), 1: FractionColumnWidth(0.01), 2: FractionColumnWidth(0.69)},
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 30,
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            HexColor('#F5F5F5'),
                            HexColor("${data?.colorgen}"),
                          ],
                          // stops: <double>[ 0.1, 1],
                          radius: 0.02,
                          tileMode: TileMode.repeated,
                        ),
                      ),
                    ),
                    Center(
                        child: Text(
                      "${data?.numgen}",
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    )),
                  ]),
                ),
              ),
              const SizedBox(),
              Text(
                "${data?.namegen1}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ])
          ],
        ),
      ),
    ),
  );
}

boardItemStudentUser({VoidCallback? onTap, UserGen? dataUserStudent}) {
  if (kDebugMode) {
    print("${dataUserStudent?.numgen}  ==== ${dataUserStudent?.colorgen}");
  }
  return GestureDetector(
    onTap: onTap,
    // color: HexColor('#F5F5F5'),
    child: Container(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          // bottomLeft: Radius.circular(40),
        ),
        gradient: LinearGradient(stops: const [
          0.02,
          0.02,
          0.25,
          1,
        ], colors: [
          HexColor("${dataUserStudent?.colorgen}"),
          Colors.white,
          Colors.white,
          HexColor("${dataUserStudent?.colorgen}"),
        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
      ),
      child: Table(
        border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
        columnWidths: const {0: FractionColumnWidth(0.3), 1: FractionColumnWidth(0.01), 2: FractionColumnWidth(0.69)},
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30,
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          HexColor('#F5F5F5'),
                          HexColor("${dataUserStudent?.colorgen}"),
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        stops: const [0.2, 0.7],
                        tileMode: TileMode.repeated,
                      ),
                    ),
                  ),
                  Center(
                      child: Text(
                    "${dataUserStudent?.numgen}",
                    style: const TextStyle(color: Colors.black, fontSize: 30),
                  )),
                ]),
              ),
            ),
            const SizedBox(),
            Text(
              "${dataUserStudent?.namegen1}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ])
        ],
      ),
    ),
  );
}

boardItemStudent2({
  DataGenList? data,
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      // color: HexColor('#F5F5F5'),
      color: tcWhite,
      child: Table(
        border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
        columnWidths: const {0: FractionColumnWidth(0.3), 1: FractionColumnWidth(0.05), 2: FractionColumnWidth(0.65)},
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 35.0,
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${data?.textteacher1}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Table(children: const [
                  TableRow(children: [
                    Text(
                      "62X3X3XX",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16),
                    ),
                  ]),
                ]),
              ],
            ),
          ])
        ],
      ),
    ),
  );
}
