import 'package:f2fbuu/customs/commingsoon_screen.dart';
import 'package:f2fbuu/module/home/model/response/screen_homemore_board_teacher_response.dart';
import 'package:f2fbuu/module/home/screen/morescreen/board_item_teacher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

buildListTeacher(
  BuildContext context,
  ScreenHomeMoreBoardTeacherResponse? screenHomeMoreBoardTeacherResponse,
) {
  return SingleChildScrollView(
    padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
    scrollDirection: Axis.vertical,
    child: Column(
        children: List.generate(
            int.parse("${screenHomeMoreBoardTeacherResponse?.body?.teacher?.length}"),
            (index) => boardItemTeacher(
                  datateacher: screenHomeMoreBoardTeacherResponse?.body?.teacher?[index],
                  tiaileteacher: screenHomeMoreBoardTeacherResponse?.body?.screeninfo,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => commingSoonScreen(),
                      ),
                    );
                  },
                ))),
  );
}

buildListStaff(BuildContext context, ScreenHomeMoreBoardTeacherResponse? screenHomeMoreBoardTeacherResponse) {
  return SingleChildScrollView(
    padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
    scrollDirection: Axis.vertical,
    child: Column(
        children: List.generate(
            int.parse("${screenHomeMoreBoardTeacherResponse?.body?.staff?.length}"),
            (index) => boardItemStaff(
                  datateacher: screenHomeMoreBoardTeacherResponse?.body?.staff?[index],
                  tiaileteacher: screenHomeMoreBoardTeacherResponse?.body?.screeninfo,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => commingSoonScreen(),
                      ),
                    );
                  },
                ))),
  );
}
