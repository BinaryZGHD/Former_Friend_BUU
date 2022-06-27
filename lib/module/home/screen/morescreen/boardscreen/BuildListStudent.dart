import 'package:f2fbuu/customs/commingsoon_screen.dart';
import 'package:f2fbuu/module/home/model/response/screen_homemore_board_student_response.dart';
import 'package:f2fbuu/module/home/screen/morescreen/board_Item_student.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                        builder: (context) => commingSoonScreen(),
                      ),
                    );
                  },
                ))),
  );
}
