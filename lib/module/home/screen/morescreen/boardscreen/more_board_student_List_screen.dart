import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/home/bloc/homemorebloc/homemore_bloc.dart';
import 'package:f2fbuu/module/home/model/response/screen_homemore_board_student_response.dart';
import 'package:f2fbuu/module/home/screen/morescreen/boardscreen/BuildListStudent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class moreBoardStudentListScreen extends StatefulWidget {
  final String title;
  const moreBoardStudentListScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<moreBoardStudentListScreen> createState() => _moreBoardStudentListScreenState();
}

class _moreBoardStudentListScreenState extends State<moreBoardStudentListScreen> with ProgressDialog {
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
      child: Scaffold(
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
            "${"Generation  " + widget.title}",
            style: TextStyle(
              color: Colors.black,
              fontSize: sizeTitle24,
            ),
          ),
        ),
        body: BlocBuilder<HomemoreBloc, HomemoreState>(builder: (context, state) {
          if (state is HomeMoreBoardStudentSuccessState) {
            _screenHomeMoreBoardStudentResponse = state.responseBoardStudent;
            return Container(
                padding: const EdgeInsets.fromLTRB(2, 5, 2, 10),
                color: Colors.grey[200],
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildListStudent2(context, _screenHomeMoreBoardStudentResponse),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
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
