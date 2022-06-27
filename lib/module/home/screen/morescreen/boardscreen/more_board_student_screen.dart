import 'package:f2fbuu/customs/commingsoon_screen.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/home/bloc/homemorebloc/homemore_bloc.dart';
import 'package:f2fbuu/module/home/model/response/screen_homemore_board_student_response.dart';
import 'package:f2fbuu/module/home/screen/morescreen/boardscreen/BuildListStudent.dart';
import 'package:f2fbuu/module/home/screen/morescreen/boardscreen/board_Item_student.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'more_board_student_List_screen.dart';


class moreBoardListStudentScreen extends StatefulWidget {
  const moreBoardListStudentScreen({Key? key}) : super(key: key);

  @override
  State<moreBoardListStudentScreen> createState() => _moreBoardListStudentScreenState();
}

class _moreBoardListStudentScreenState extends State<moreBoardListStudentScreen> with ProgressDialog {
  ScreenHomeMoreBoardStudentResponse? _screenHomeMoreBoardStudentResponse;

  @override
  Widget build(BuildContext context) {
    context.read<HomemoreBloc>().add(HomeMoreBoardStudentEvent());

    return BlocListener<HomemoreBloc, HomemoreState>(
      listener: (context, state) {
        if (state is HomeMoreBoardStudentLoading) {
          showProgressDialog(context);
        }
        if (state is HomeMoreBoardStudentEndLoading) {
          hideProgressDialog(context);
        }
        if (state is HomeMoreBoardStudentError) {
          print("show dialog error");
          // show dialog error
          print(state.message);
        }
      },
      child: BlocBuilder<HomemoreBloc, HomemoreState>(builder: (context, state) {
          if (state is HomeMoreBoardStudentSuccessState) {
            _screenHomeMoreBoardStudentResponse = state.responseBoardStudent;
            return Scaffold(
              backgroundColor: Colors.grey[200],
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: sizeTitle24,
                    color: Colors.black,
                  ),
                ),
                title: Text(
                  "${_screenHomeMoreBoardStudentResponse?.body?.screeninfo?.titlenisit}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: sizeTitle24,
                  ),
                ),
              ),
              body: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    color: Colors.transparent,
                    child: boardItemStudentUser(
                      datauserstudent: _screenHomeMoreBoardStudentResponse?.body?.userGen,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                moreBoardStudentListScreen(title: "${_screenHomeMoreBoardStudentResponse?.body?.userGen?.numgen}",),
                            // commingSoonScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // height: MediaQuery.of(context).size.height*0.1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              buildListStudent(context, _screenHomeMoreBoardStudentResponse),
                              SizedBox(
                                  // height: MediaQuery.of(context).size.height * 0.2,
                                  ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        }),

    );
  }
}
