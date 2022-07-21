
import 'package:f2fbuu/module/home/model/response/more_response/screen_more_board_student_response.dart';
import 'package:f2fbuu/module/home/screen/more_widget/board_Item_student.dart';
import 'package:flutter/material.dart';
import '../more_screen/board_screen/more_board_student_List_screen.dart';
import '../more_screen/board_screen/more_board_student_detail_screen.dart';

buildListStudent(BuildContext context, ScreenMoreBoardStudentResponse? screenMoreBoardStudentResponse) {
  return SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
    scrollDirection: Axis.vertical,
    child: Column(
        children: List.generate(
            int.parse("${screenMoreBoardStudentResponse?.body?.dataGenList?.length}"),
            (index) => boardItemStudent(
                  data: screenMoreBoardStudentResponse?.body?.dataGenList?[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MoreBoardStudentListScreen(
                          title: "${screenMoreBoardStudentResponse?.body?.dataGenList?[index].numgen}",
                        ),
                      ),
                    );
                  },
                ))),
  );
}

buildListStudent2(BuildContext context, ScreenMoreBoardStudentResponse? screenMoreBoardStudentResponse) {
  return SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
    scrollDirection: Axis.vertical,
    child: Column(
        children: List.generate(
            int.parse("${screenMoreBoardStudentResponse?.body?.dataGenList?.length}"),
            (index) => boardItemStudent2(
                  data: screenMoreBoardStudentResponse?.body?.dataGenList?[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MoreBoardStudentDetailScreen(
                          title: '62X3X0XX',
                        ),
                      ),
                    );
                  },
                ))),
  );
}
