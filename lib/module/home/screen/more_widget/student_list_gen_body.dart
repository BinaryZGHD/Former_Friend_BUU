import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/home/model/response/more_response/screen_more_board_student_response.dart';
import 'package:f2fbuu/module/home/screen/more_widget/BuildListStudent.dart';
import 'package:f2fbuu/module/home/screen/more_widget/board_Item_student.dart';
import 'package:f2fbuu/module/home/screen/more_screen/board_screen/more_board_student_List_screen.dart';
import 'package:flutter/material.dart';

studentListGenBody (BuildContext context, ScreenMoreBoardStudentResponse? _screenMoreBoardStudentResponse) {
  return Scaffold(
    backgroundColor: Colors.grey[200],
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          size: sizeTitle24,
          color: Colors.black,
        ),
      ),
      title: Text(
        "${_screenMoreBoardStudentResponse?.body?.screeninfo?.titlenisit}",
        style: const TextStyle(
          color: Colors.black,
          fontSize: sizeTitle24,
        ),
      ),
    ),
    body: SafeArea( child :Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          color: Colors.transparent,
          child: boardItemStudentUser(
            datauserstudent: _screenMoreBoardStudentResponse?.body?.userGen,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MoreBoardStudentListScreen(title: "${_screenMoreBoardStudentResponse?.body?.userGen?.numgen}",),
                  // commingSoonScreen(),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildListStudent(context, _screenMoreBoardStudentResponse),
                  const SizedBox(
                    // height: MediaQuery.of(context).size.height * 0.2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ) ,),
  );


}