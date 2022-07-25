import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/home/model/response/more_response/screen_more_board_teacher_response.dart';
import 'package:f2fbuu/module/home/screen/more_widget/BuildListTeacher.dart';
import 'package:flutter/material.dart';

teacherStatsWidget(BuildContext context, ScreenMoreBoardTeacherResponse? screenMoreBoardTeacherResponse) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.fromLTRB(2, 5, 2, 10),
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text("${screenMoreBoardTeacherResponse?.body?.screeninfo?.teacher}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: sizeTitle24,
                  )),
            ),
            buildListTeacherRight(context, screenMoreBoardTeacherResponse),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Text("${screenMoreBoardTeacherResponse?.body?.screeninfo?.staff}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: sizeTitle24,
                  )),
            ),
            buildListStaff(context, screenMoreBoardTeacherResponse),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ),
  );
}
