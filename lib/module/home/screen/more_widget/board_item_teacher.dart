import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/module/home/model/response/more_response/screen_more_board_teacher_response.dart';
import 'package:flutter/material.dart';

boardItemTeacherLeft({VoidCallback? onTap, Screeninfo? titleTeacher, Teacherone? dataTeacher}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Table(
          border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
          columnWidths: const {0: FractionColumnWidth(0.2), 1: FractionColumnWidth(0.8)},
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 35.0,
                  backgroundImage: NetworkImage("${dataTeacher?.imgTeacher}"),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      tableAJ(titleTeacher: titleTeacher?.name, dataTeacher: dataTeacher?.name),
                      tableAJ(titleTeacher: titleTeacher?.position, dataTeacher: dataTeacher?.position),
                      tableAJ(titleTeacher: titleTeacher?.phone, dataTeacher: dataTeacher?.phone),
                      tableAJ(titleTeacher: titleTeacher?.email, dataTeacher: dataTeacher?.email),
                    ],
                  )),
            ])
          ],
        ),
      ),
    ),
  );
}

boardItemTeacherRight({VoidCallback? onTap, Screeninfo? titleTeacher, Teachertwo? dataTeacherTwo}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Table(
          border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
          columnWidths: const {0: FractionColumnWidth(0.2), 1: FractionColumnWidth(0.8)},
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 35.0,
                  backgroundImage: NetworkImage("${dataTeacherTwo?.imgTeacher}"),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      tableAJ(titleTeacher: titleTeacher?.name, dataTeacher: dataTeacherTwo?.name),
                      tableAJ(titleTeacher: titleTeacher?.position, dataTeacher: dataTeacherTwo?.position),
                      tableAJ(titleTeacher: titleTeacher?.phone, dataTeacher: dataTeacherTwo?.phone),
                      tableAJ(titleTeacher: titleTeacher?.email, dataTeacher: dataTeacherTwo?.email),
                    ],
                  )),
            ])
          ],
        ),
      ),
    ),
  );
}

tableAJ({String? titleTeacher, String? dataTeacher}) {
  return Table(
    border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
    columnWidths: const {0: FractionColumnWidth(0.3), 1: FractionColumnWidth(0.7)},
    // defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      TableRow(children: [
        Text(
          "$titleTeacher :",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          "$dataTeacher",
          style: const TextStyle(fontSize: 14),
        ),
      ])
    ],
  );
}

boardItemStaff({
  VoidCallback? onTap,
  Staff? dataStaff,
  Screeninfo? titleTeacher,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      // color: HexColor('#F5F5F5'),
      color: tcWhite,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Table(
          border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
          columnWidths: const {0: FractionColumnWidth(0.2), 1: FractionColumnWidth(0.8)},
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 35.0,
                  backgroundImage: NetworkImage("${dataStaff?.imgTeacher}"),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      tableAJ(titleTeacher: titleTeacher?.name, dataTeacher: dataStaff?.name),
                      tableAJ(titleTeacher: titleTeacher?.position, dataTeacher: dataStaff?.position),
                      tableAJ(titleTeacher: titleTeacher?.phone, dataTeacher: dataStaff?.phone),
                      tableAJ(titleTeacher: titleTeacher?.email, dataTeacher: dataStaff?.email),
                    ],
                  )),
            ])
          ],
        ),
      ),
    ),
  );
}
