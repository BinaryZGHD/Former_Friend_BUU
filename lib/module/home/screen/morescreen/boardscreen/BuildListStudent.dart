import 'package:f2fbuu/customs/commingsoon_screen.dart';
import 'package:f2fbuu/module/home/model/response/screen_homemore_board_student_response.dart';
import 'package:f2fbuu/module/home/screen/morescreen/boardscreen/board_Item_student.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'more_board_student_List_screen.dart';
import 'more_board_student_detail_screen.dart';

buildListStudent(BuildContext context, ScreenHomeMoreBoardStudentResponse? screenHomeMoreBoardStudentResponse) {
  return SingleChildScrollView(
    padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
    scrollDirection: Axis.vertical,
    child: Column(
        children: List.generate(
            int.parse("${screenHomeMoreBoardStudentResponse?.body?.dataGenList?.length}"),
            (index) => boardItemStudent(
                  data: screenHomeMoreBoardStudentResponse?.body?.dataGenList?[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => moreBoardStudentListScreen(title: "${ screenHomeMoreBoardStudentResponse?.body?.dataGenList?[index].numgen}",),
                      ),
                    );
                  },
                ))),
  );
}

buildListStudent2(BuildContext context, ScreenHomeMoreBoardStudentResponse? screenHomeMoreBoardStudentResponse) {
  return SingleChildScrollView(
    padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
    scrollDirection: Axis.vertical,
    child: Column(
        children: List.generate(
            int.parse("${screenHomeMoreBoardStudentResponse?.body?.dataGenList?.length}"),
                (index) => boardItemStudent2(
              data: screenHomeMoreBoardStudentResponse?.body?.dataGenList?[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => moreBoardStudentDetailScreen(title: '62X3X0XX',),
                  ),
                );
              },
            ))),
  );
}
