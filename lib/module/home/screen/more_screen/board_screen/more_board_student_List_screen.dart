
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/module/home/bloc/more_bloc/more_bloc.dart';
import 'package:f2fbuu/module/home/model/response/more_response/screen_more_board_student_response.dart';
import 'package:f2fbuu/module/home/screen/more_widget/student_list_body.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreBoardStudentListScreen extends StatelessWidget {
  final String title;
  const MoreBoardStudentListScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MoreBloc()..add(MoreBoardStudentEvent()),
        child:  MoreBoardStudentListrPage(title: title));
  }
}

class MoreBoardStudentListrPage extends StatefulWidget {
  final String title;
  const MoreBoardStudentListrPage({Key? key, required this.title}) : super(key: key);

  @override
  State<MoreBoardStudentListrPage> createState() => _MoreBoardStudentListrPageState();
}

class _MoreBoardStudentListrPageState extends State<MoreBoardStudentListrPage> with ProgressDialog {
  ScreenMoreBoardStudentResponse? _screenMoreBoardStudentResponse;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoreBloc, MoreState>(
      listener: (context, state) {
        if (state is MoreBoardStudentLoading) {
          showProgressDialog(context);
        }
        if (state is MoreBoardStudentEndLoading) {
          hideProgressDialog(context);
        }
        if (state is MoreBoardStudentError) {
          if (kDebugMode) {
            print("show dialog error");
            // show dialog error
            print(state.message);
          }

        }
      },
      builder: (context, state) {
        if (state is MoreBoardStudentSuccessState) {
          _screenMoreBoardStudentResponse = state.responseBoardStudent;
          return  studentListBody(context, _screenMoreBoardStudentResponse,widget.title);
        } else {
          return Container();
        }
      },

    );
  }
}
