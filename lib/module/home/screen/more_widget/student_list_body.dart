import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/home/model/response/more_response/screen_more_board_student_response.dart';
import 'package:f2fbuu/module/home/screen/more_widget/BuildListStudent.dart';
import 'package:flutter/material.dart';

studentListBody(BuildContext context, ScreenMoreBoardStudentResponse? screenMoreBoardStudentResponse, String title){
  return Scaffold(
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
        "Generation  $title",
        style: const TextStyle(
          color: Colors.black,
          fontSize: sizeTitle24,
        ),
      ),
    ),
    body: Container(
      padding: const EdgeInsets.fromLTRB(2, 5, 2, 10),
      color: Colors.grey[200],
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildListStudent2(context, screenMoreBoardStudentResponse),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),

    ),

  );
}