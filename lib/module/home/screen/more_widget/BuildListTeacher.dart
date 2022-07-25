
import 'package:f2fbuu/module/home/model/response/more_response/screen_more_board_teacher_response.dart';
import 'package:f2fbuu/module/home/screen/more_widget/board_item_teacher.dart';
import 'package:f2fbuu/module/home/screen/more_screen/board_screen/more_board_staff_detail_screen.dart';
import 'package:f2fbuu/module/home/screen/more_screen/board_screen/more_board_teacher_detail_screen.dart';
import 'package:flutter/material.dart';



buildListTeacherLeft(
  BuildContext context,
  ScreenMoreBoardTeacherResponse? screenMoreBoardTeacherResponse,
) {
  return SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
    scrollDirection: Axis.vertical,
    child: Column(
        children: List.generate(
            int.parse("${screenMoreBoardTeacherResponse?.body?.teacher?.teacherone?.length}"),
            (index) => boardItemTeacherLeft(
                  dataTeacher: screenMoreBoardTeacherResponse?.body?.teacher?.teacherone?[index],
                  titleTeacher: screenMoreBoardTeacherResponse?.body?.screeninfo,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MoreBoardTeacherDetailScreen(
                          name: "${screenMoreBoardTeacherResponse?.body?.teacher?.teacherone?[index].name}",
                          position: "${screenMoreBoardTeacherResponse?.body?.teacher?.teacherone?[index].position}",
                          phone: "${screenMoreBoardTeacherResponse?.body?.teacher?.teacherone?[index].phone}",
                          email: "${screenMoreBoardTeacherResponse?.body?.teacher?.teacherone?[index].email}",
                          url: "${screenMoreBoardTeacherResponse?.body?.teacher?.teacherone?[index].wedTeacher}",
                          image: "${screenMoreBoardTeacherResponse?.body?.teacher?.teacherone?[index].imgTeacher}",

                          titlename: "${screenMoreBoardTeacherResponse?.body?.screeninfo?.name}",
                          titleposition: "${screenMoreBoardTeacherResponse?.body?.screeninfo?.position}",
                          titlephone: "${screenMoreBoardTeacherResponse?.body?.screeninfo?.phone}",
                          titleemail: "${screenMoreBoardTeacherResponse?.body?.screeninfo?.email}",
                          titleurl: "${screenMoreBoardTeacherResponse?.body?.screeninfo?.moredetails}",

                        ),
                      ),
                    );
                  },
                ))),
  );
}


buildListTeacherRight(
    BuildContext context,
    ScreenMoreBoardTeacherResponse? screenMoreBoardTeacherResponse,
    ) {
  return SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
    scrollDirection: Axis.vertical,
    child: Column(
        children: List.generate(
            int.parse("${screenMoreBoardTeacherResponse?.body?.teacher?.teachertwo?.length}"),
                (index) => boardItemTeacherRight(
              dataTeacherTwo: screenMoreBoardTeacherResponse?.body?.teacher?.teachertwo?.elementAt(index),
              titleTeacher: screenMoreBoardTeacherResponse?.body?.screeninfo,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MoreBoardTeacherDetailScreen(
                      name: "${screenMoreBoardTeacherResponse?.body?.teacher?.teachertwo?[index].name}",
                      position: "${screenMoreBoardTeacherResponse?.body?.teacher?.teachertwo?[index].position}",
                      phone: "${screenMoreBoardTeacherResponse?.body?.teacher?.teachertwo?[index].phone}",
                      email: "${screenMoreBoardTeacherResponse?.body?.teacher?.teachertwo?[index].email}",
                      url: "${screenMoreBoardTeacherResponse?.body?.teacher?.teachertwo?[index].wedTeacher}",
                      image: "${screenMoreBoardTeacherResponse?.body?.teacher?.teachertwo?[index].imgTeacher}",

                      titlename: "${screenMoreBoardTeacherResponse?.body?.screeninfo?.name}",
                      titleposition: "${screenMoreBoardTeacherResponse?.body?.screeninfo?.position}",
                      titlephone: "${screenMoreBoardTeacherResponse?.body?.screeninfo?.phone}",
                      titleemail: "${screenMoreBoardTeacherResponse?.body?.screeninfo?.email}",
                      titleurl: "${screenMoreBoardTeacherResponse?.body?.screeninfo?.moredetails}",
                    ),
                  ),
                );
              },
            ))),
  );
}


buildListStaff(BuildContext context, ScreenMoreBoardTeacherResponse? screenMoreBoardTeacherResponse) {
  return SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
    scrollDirection: Axis.vertical,
    child: Column(
        children: List.generate(
            int.parse("${screenMoreBoardTeacherResponse?.body?.staff?.length}"),
            (index) => boardItemStaff(
                  dataStaff: screenMoreBoardTeacherResponse?.body?.staff?[index],
                  titleTeacher: screenMoreBoardTeacherResponse?.body?.screeninfo,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MoreBoardStaffDetailScreen(
                          name: "${screenMoreBoardTeacherResponse?.body?.staff?[index].name}",
                          position: "${screenMoreBoardTeacherResponse?.body?.staff?[index].position}",
                          phone: "${screenMoreBoardTeacherResponse?.body?.staff?[index].phone}",
                          email: "${screenMoreBoardTeacherResponse?.body?.staff?[index].email}",
                          image: "${screenMoreBoardTeacherResponse?.body?.staff?[index].imgTeacher}",

                          titleName: "${screenMoreBoardTeacherResponse?.body?.screeninfo?.name}",
                          titlePosition: "${screenMoreBoardTeacherResponse?.body?.screeninfo?.position}",
                          titlePhone: "${screenMoreBoardTeacherResponse?.body?.screeninfo?.phone}",
                          titleEmail: "${screenMoreBoardTeacherResponse?.body?.screeninfo?.email}",
                        ),
                      ),
                    );
                  },
                ))),
  );
}
