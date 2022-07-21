import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/module/home/model/response/more_response/screen_more_board_teacher_response.dart';
import 'package:flutter/material.dart';

boardItemTeacherLeft({VoidCallback? onTap, Screeninfo? tiaileteacher, Teacherone? datateacher}) {
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
              // if (_screenprofileResponse?.body?.profileGeneralInfo?.img == null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 35.0,
                  backgroundImage: NetworkImage("${datateacher?.imgTeacher}"),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      tableaJ(tiaileteacher: tiaileteacher?.name, datateacher: datateacher?.name),
                      tableaJ(tiaileteacher: tiaileteacher?.position, datateacher: datateacher?.position),
                      tableaJ(tiaileteacher: tiaileteacher?.phone, datateacher: datateacher?.phone),
                      tableaJ(tiaileteacher: tiaileteacher?.email, datateacher: datateacher?.email),
                    ],
                  )),
            ])
          ],
        ),
      ),
    ),
  );
}

boardItemTeacherRight({VoidCallback? onTap, Screeninfo? tiaileteacher, Teachertwo? datateachertwo}) {
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
              // if (_screenprofileResponse?.body?.profileGeneralInfo?.img == null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 35.0,
                  backgroundImage: NetworkImage("${datateachertwo?.imgTeacher}"),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      tableaJ(tiaileteacher: tiaileteacher?.name, datateacher: datateachertwo?.name),
                      tableaJ(tiaileteacher: tiaileteacher?.position, datateacher: datateachertwo?.position),
                      tableaJ(tiaileteacher: tiaileteacher?.phone, datateacher: datateachertwo?.phone),
                      tableaJ(tiaileteacher: tiaileteacher?.email, datateacher: datateachertwo?.email),
                    ],
                  )),
            ])
          ],
        ),
      ),
    ),
  );
}

tableaJ({String? tiaileteacher, String? datateacher}) {
  return Table(
    border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
    columnWidths: const {0: FractionColumnWidth(0.3), 1: FractionColumnWidth(0.7)},
    // defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      TableRow(children: [
        Text(
          "$tiaileteacher :",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          "$datateacher",
          style: const TextStyle(fontSize: 14),
        ),
      ])
    ],
  );
}

boardItemStaff({
  VoidCallback? onTap,
  Staff? datastaff,
  Screeninfo? tiaileteacher,
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
              // if (_screenprofileResponse?.body?.profileGeneralInfo?.img == null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 35.0,
                  backgroundImage: NetworkImage("${datastaff?.imgTeacher}"),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      tableaJ(tiaileteacher: tiaileteacher?.name, datateacher: datastaff?.name),
                      tableaJ(tiaileteacher: tiaileteacher?.position, datateacher: datastaff?.position),
                      tableaJ(tiaileteacher: tiaileteacher?.phone, datateacher: datastaff?.phone),
                      tableaJ(tiaileteacher: tiaileteacher?.email, datateacher: datastaff?.email),
                    ],
                  )),
            ])
          ],
        ),
      ),
    ),
  );
}
