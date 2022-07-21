import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/home/bloc/morebloc/more_bloc.dart';
import 'package:f2fbuu/module/home/model/response/more_response/screen_more_board_student_response.dart';
import 'package:f2fbuu/module/home/screen/morescreen/boardscreen/BuildListStudent.dart';
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
                "Generation  ${widget.title}",
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
                    buildListStudent2(context, _screenMoreBoardStudentResponse),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),

            ),

          );
        } else {
          return Container();
        }
      },

    );
  }
}
