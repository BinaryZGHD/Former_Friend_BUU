import 'package:f2fbuu/customs/commingsoon_screen.dart';
import 'package:f2fbuu/module/home/model/response/screen_homemore_board_teacher_response.dart';
import 'package:f2fbuu/module/home/screen/morescreen/boardscreen/board_item_teacher.dart';
import 'package:f2fbuu/module/home/screen/morescreen/boardscreen/more_board_teacher_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'more_board_student_List_screen.dart';


buildListTeacherLeft(
  BuildContext context,
  ScreenHomeMoreBoardTeacherResponse? screenHomeMoreBoardTeacherResponse,
) {
  return SingleChildScrollView(
    padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
    scrollDirection: Axis.vertical,
    child: Column(
        children: List.generate(
            int.parse("${screenHomeMoreBoardTeacherResponse?.body?.teacher?.teacherone?.length}"),
            (index) => boardItemTeacherLeft(
                  datateacher: screenHomeMoreBoardTeacherResponse?.body?.teacher?.teacherone?[index],
                  tiaileteacher: screenHomeMoreBoardTeacherResponse?.body?.screeninfo,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => moreBoardTeacherStaffDetailScreen(
                          index: index,
                          // datateacherone: screenHomeMoreBoardTeacherResponse?.body?.teacher?.teacherone?[index],
                          // datateachertwo: screenHomeMoreBoardTeacherResponse?.body?.teacher?.teachertwo?.elementAt(index),
                          // datastaff: screenHomeMoreBoardTeacherResponse?.body?.staff?.elementAt(index),
                          screenHomeMoreBoardTeacherResponse: screenHomeMoreBoardTeacherResponse,
                          fac:"teacherone",
                        ),
                      ),
                    );
                  },
                ))),
  );
}


buildListTeacherRight(
    BuildContext context,
    ScreenHomeMoreBoardTeacherResponse? screenHomeMoreBoardTeacherResponse,
    ) {
  return SingleChildScrollView(
    padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
    scrollDirection: Axis.vertical,
    child: Column(
        children: List.generate(
            int.parse("${screenHomeMoreBoardTeacherResponse?.body?.teacher?.teachertwo?.length}"),
                (index) => boardItemTeacherRight(
              datateachertwo: screenHomeMoreBoardTeacherResponse?.body?.teacher?.teachertwo?.elementAt(index),
              tiaileteacher: screenHomeMoreBoardTeacherResponse?.body?.screeninfo,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => moreBoardTeacherStaffDetailScreen(
                      // datateacherone: screenHomeMoreBoardTeacherResponse?.body?.teacher?.teacherone?.elementAt(index),
                      // datateachertwo: screenHomeMoreBoardTeacherResponse?.body?.teacher?.teachertwo?.elementAt(index),
                      // datastaff: screenHomeMoreBoardTeacherResponse?.body?.staff?.elementAt(index),
                      index: index,
                      screenHomeMoreBoardTeacherResponse: screenHomeMoreBoardTeacherResponse,
                      fac:"teachertwo",
                    ),
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
                  datastaff: screenHomeMoreBoardTeacherResponse?.body?.staff?[index],
                  tiaileteacher: screenHomeMoreBoardTeacherResponse?.body?.screeninfo,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => moreBoardTeacherStaffDetailScreen(
                          index: index,
                          // datateacherone: screenHomeMoreBoardTeacherResponse?.body?.teacher?.teacherone?.elementAt(index),
                          // datateachertwo: screenHomeMoreBoardTeacherResponse?.body?.teacher?.teachertwo?.elementAt(index),
                          // datastaff: screenHomeMoreBoardTeacherResponse?.body?.staff?.elementAt(index),
                          screenHomeMoreBoardTeacherResponse: screenHomeMoreBoardTeacherResponse,
                          fac:"staff",
                        ),
                      ),
                    );
                  },
                ))),
  );
}
