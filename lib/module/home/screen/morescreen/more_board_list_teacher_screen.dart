import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/home/bloc/homemorebloc/homemore_bloc.dart';
import 'package:f2fbuu/module/home/model/response/screen_homemore_board_teacher_response.dart';
import 'package:f2fbuu/module/home/screen/morescreen/BuildListTeacher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class moreBoardListTeacherScreen extends StatefulWidget {
  const moreBoardListTeacherScreen({Key? key}) : super(key: key);

  @override
  State<moreBoardListTeacherScreen> createState() => _moreBoardListTeacherScreenState();
}

class _moreBoardListTeacherScreenState extends State<moreBoardListTeacherScreen> with ProgressDialog {
  ScreenHomeMoreBoardTeacherResponse? _screenHomeMoreBoardTeacherResponse;

  @override
  Widget build(BuildContext context) {
    context.read<HomemoreBloc>().add(HomeMoreBoardTeacherEvent());

    return BlocListener<HomemoreBloc, HomemoreState>(
      listener: (context, state) {
        if (state is HomeMoreBoardTeacherLoading) {
          showProgressDialog(context);
        }
        if (state is HomeMoreBoardTeacherEndLoading) {
          hideProgressDialog(context);
        }
        if (state is HomeMoreBoardTeacherError) {
          print("show dialog error");
          // show dialog error
          print(state.message);
        }
      },
      child: Scaffold(
        body: BlocBuilder<HomemoreBloc, HomemoreState>(builder: (context, state) {
          if (state is HomeMoreBoardTeacherSuccessState) {
            _screenHomeMoreBoardTeacherResponse = state.responseBoardTeacher;
            print(_screenHomeMoreBoardTeacherResponse?.body?.teacher?.length);
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
                  "${_screenHomeMoreBoardTeacherResponse?.body?.screeninfo?.titlenisit}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: sizeTitle24,
                  ),
                ),
              ),
              body: Column(
                children: [
                  Container(
                    height: 100,
                    color: Colors.blue,
                    child: Image.network(
                      "${_screenHomeMoreBoardTeacherResponse?.body?.screeninfo?.imgDepart}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 30,
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                "${_screenHomeMoreBoardTeacherResponse?.body?.screeninfo?.depart}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: sizeTitle24,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 30,
                            color: Colors.grey,
                            child: Center(
                              child: Text(
                                "${_screenHomeMoreBoardTeacherResponse?.body?.screeninfo?.depart}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: sizeTitle24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(2, 5, 2, 10),
                      color: Colors.transparent,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Text("${_screenHomeMoreBoardTeacherResponse?.body?.screeninfo?.teacher}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: sizeTitle24,
                                  )),
                            ),
                            buildListTeacher(context, _screenHomeMoreBoardTeacherResponse),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: Text("${_screenHomeMoreBoardTeacherResponse?.body?.screeninfo?.staff}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: sizeTitle24,
                                  )),
                            ),
                            buildListStaff(context, _screenHomeMoreBoardTeacherResponse),
                            SizedBox(
                              height: 20,
                            ),
                          ],
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
      ),
    );
  }
}
