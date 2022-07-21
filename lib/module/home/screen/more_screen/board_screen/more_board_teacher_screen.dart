import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/home/bloc/morebloc/more_bloc.dart';
import 'package:f2fbuu/module/home/model/response/more_response/screen_more_board_teacher_response.dart';
import 'package:f2fbuu/module/home/screen/morescreen/boardscreen/BuildListTeacher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MoreBoardListTeacherScreen extends StatelessWidget {
  const MoreBoardListTeacherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MoreBloc()..add(MoreBoardTeacherEvent()),
        child:  const MoreBoardListTeacherPage());
  }
}



class MoreBoardListTeacherPage extends StatefulWidget {
  const MoreBoardListTeacherPage({Key? key}) : super(key: key);

  @override
  State<MoreBoardListTeacherPage> createState() => _MoreBoardListTeacherPageState();
}

bool _isSelected = true;
const double yalign = -1;
const Color selectedColor = Colors.black;
const Color normalColor = Colors.black54;

class _MoreBoardListTeacherPageState extends State<MoreBoardListTeacherPage> with ProgressDialog {
  ScreenMoreBoardTeacherResponse? _screenMoreBoardTeacherResponse;
  late double   defaultalign;
  late Color departleftcolor;
  late Color departrightcolor;

  double xalign = 1;
  @override
  void initState() {
    super.initState();
    defaultalign = yalign;
    departleftcolor = selectedColor;
    departrightcolor = normalColor;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = 40.0;


    return BlocConsumer<MoreBloc, MoreState>(
      listener: (context, state) {
        if (state is MoreBoardTeacherLoading) {
          showProgressDialog(context);
        }
        if (state is MoreBoardTeacherEndLoading) {
          hideProgressDialog(context);
        }
        if (state is MoreBoardTeacherError) {
          if (kDebugMode) {
            print("show dialog error");
            // show dialog error
            print(state.message);
          }

        }
      },
      builder: (context, state) {
        if (state is MoreBoardTeacherSuccessState) {
          _screenMoreBoardTeacherResponse = state.responseBoardTeacher;
          if (kDebugMode) {
            print(_screenMoreBoardTeacherResponse?.body?.teacher?.teacherone?.length);
          }
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
                "${_screenMoreBoardTeacherResponse?.body?.screeninfo?.titlenisit}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: sizeTitle24,
                ),
              ),
            ),
            body: Column(
              children: [
                // Container(
                //   height: 100,
                //   color: Colors.blue,
                //   child: Image.network(
                //     "${_screenHomeMoreBoardTeacherResponse?.body?.screeninfo?.imgDepart}",
                //     fit: BoxFit.cover,
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 8, right: 8, bottom: 10),
                  child: Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),
                    child: Stack(
                      children: [
                        AnimatedAlign(
                          alignment: Alignment(  defaultalign, 0),
                          duration: const Duration(milliseconds: 300),
                          child: Container(
                            width: width * 0.5,
                            height: height,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              defaultalign = yalign;
                              departleftcolor = selectedColor;
                              _isSelected = true;
                              departrightcolor = normalColor;
                            });
                          },
                          child: Align(
                            alignment: const Alignment(-1, 0),
                            child: Container(
                              width: width * 0.5,
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              child: Text(
                                "${_screenMoreBoardTeacherResponse?.body?.screeninfo?.departone}",
                                style: TextStyle(
                                  color: departleftcolor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              defaultalign = xalign;
                              departrightcolor = selectedColor;
                              _isSelected = false;
                              departleftcolor = normalColor;
                            });
                          },
                          child: Align(
                            alignment: const Alignment(1, 0),
                            child: Container(
                              width: width * 0.5,
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              child: Text(
                                "${_screenMoreBoardTeacherResponse?.body?.screeninfo?.departtwo}",
                                style: TextStyle(
                                  color: departrightcolor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    child: _isSelected
                        ? Expanded(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(2, 5, 2, 10),
                        color: Colors.transparent,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10, top: 10),
                                child: Text("${_screenMoreBoardTeacherResponse?.body?.screeninfo?.teacher}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: sizeTitle24,
                                    )),
                              ),
                              buildListTeacherLeft(context, _screenMoreBoardTeacherResponse),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, top: 5),
                                child: Text("${_screenMoreBoardTeacherResponse?.body?.screeninfo?.staff}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: sizeTitle24,
                                    )),
                              ),
                              buildListStaff(context, _screenMoreBoardTeacherResponse),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                        : Expanded(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(2, 5, 2, 10),
                        color: Colors.transparent,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10, top: 10),
                                child: Text("${_screenMoreBoardTeacherResponse?.body?.screeninfo?.teacher}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: sizeTitle24,
                                    )),
                              ),
                              buildListTeacherRight(context, _screenMoreBoardTeacherResponse),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, top: 5),
                                child: Text("${_screenMoreBoardTeacherResponse?.body?.screeninfo?.staff}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: sizeTitle24,
                                    )),
                              ),
                              buildListStaff(context, _screenMoreBoardTeacherResponse),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          );
        } else {
          return Container();
        }
      },

    );
  }
}
