import 'package:f2fbuu/customs/commingsoon_screen.dart';
import 'package:f2fbuu/module/home/model/response/screen_homemore_board_teacher_response.dart';
import 'package:f2fbuu/module/home/screen/morescreen/boardscreen/board_item_teacher.dart';
import 'package:f2fbuu/module/home/screen/morescreen/boardscreen/more_board_staff_detail_screen.dart';
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
                        builder: (context) => moreBoardTeacherDetailScreen(
                          name: "${screenHomeMoreBoardTeacherResponse?.body?.teacher?.teacherone?[index].name}",
                          position: "${screenHomeMoreBoardTeacherResponse?.body?.teacher?.teacherone?[index].position}",
                          phone: "${screenHomeMoreBoardTeacherResponse?.body?.teacher?.teacherone?[index].phone}",
                          email: "${screenHomeMoreBoardTeacherResponse?.body?.teacher?.teacherone?[index].email}",
                          url: "${screenHomeMoreBoardTeacherResponse?.body?.teacher?.teacherone?[index].wedTeacher}",
                          image: "${screenHomeMoreBoardTeacherResponse?.body?.teacher?.teacherone?[index].imgTeacher}",

                          titlename: "${screenHomeMoreBoardTeacherResponse?.body?.screeninfo?.name}",
                          titleposition: "${screenHomeMoreBoardTeacherResponse?.body?.screeninfo?.position}",
                          titlephone: "${screenHomeMoreBoardTeacherResponse?.body?.screeninfo?.phone}",
                          titleemail: "${screenHomeMoreBoardTeacherResponse?.body?.screeninfo?.email}",
                          titleurl: "${screenHomeMoreBoardTeacherResponse?.body?.screeninfo?.moredetails}",

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
                    builder: (context) => moreBoardTeacherDetailScreen(
                      name: "${screenHomeMoreBoardTeacherResponse?.body?.teacher?.teachertwo?[index].name}",
                      position: "${screenHomeMoreBoardTeacherResponse?.body?.teacher?.teachertwo?[index].position}",
                      phone: "${screenHomeMoreBoardTeacherResponse?.body?.teacher?.teachertwo?[index].phone}",
                      email: "${screenHomeMoreBoardTeacherResponse?.body?.teacher?.teachertwo?[index].email}",
                      url: "${screenHomeMoreBoardTeacherResponse?.body?.teacher?.teachertwo?[index].wedTeacher}",
                      image: "${screenHomeMoreBoardTeacherResponse?.body?.teacher?.teachertwo?[index].imgTeacher}",

                      titlename: "${screenHomeMoreBoardTeacherResponse?.body?.screeninfo?.name}",
                      titleposition: "${screenHomeMoreBoardTeacherResponse?.body?.screeninfo?.position}",
                      titlephone: "${screenHomeMoreBoardTeacherResponse?.body?.screeninfo?.phone}",
                      titleemail: "${screenHomeMoreBoardTeacherResponse?.body?.screeninfo?.email}",
                      titleurl: "${screenHomeMoreBoardTeacherResponse?.body?.screeninfo?.moredetails}",
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
                        builder: (context) => moreBoardStaffrDetailScreen(
                          name: "${screenHomeMoreBoardTeacherResponse?.body?.staff?[index].name}",
                          position: "${screenHomeMoreBoardTeacherResponse?.body?.staff?[index].position}",
                          phone: "${screenHomeMoreBoardTeacherResponse?.body?.staff?[index].phone}",
                          email: "${screenHomeMoreBoardTeacherResponse?.body?.staff?[index].email}",
                          image: "${screenHomeMoreBoardTeacherResponse?.body?.staff?[index].imgTeacher}",

                          titlename: "${screenHomeMoreBoardTeacherResponse?.body?.screeninfo?.name}",
                          titleposition: "${screenHomeMoreBoardTeacherResponse?.body?.screeninfo?.position}",
                          titlephone: "${screenHomeMoreBoardTeacherResponse?.body?.screeninfo?.phone}",
                          titleemail: "${screenHomeMoreBoardTeacherResponse?.body?.screeninfo?.email}",
                        ),
                      ),
                    );
                  },
                ))),
  );
}
