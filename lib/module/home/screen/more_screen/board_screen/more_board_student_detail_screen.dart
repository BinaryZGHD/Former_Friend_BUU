
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/module/home/bloc/more_bloc/more_bloc.dart';
import 'package:f2fbuu/module/home/screen/more_widget/student_detail_body.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreBoardStudentDetailScreen extends StatelessWidget {
  final String title;
  const MoreBoardStudentDetailScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MoreBloc()..add(MoreBoardStudentEvent()),
        child: MoreBoardStudentDetailPage(
          title: title,
        ));
  }
}

class MoreBoardStudentDetailPage extends StatefulWidget {
  final String title;
  const MoreBoardStudentDetailPage({Key? key, required this.title}) : super(key: key);

  @override
  State<MoreBoardStudentDetailPage> createState() => _MoreBoardStudentDetailPageState();
}

class _MoreBoardStudentDetailPageState extends State<MoreBoardStudentDetailPage> with ProgressDialog {

  @override
  Widget build(BuildContext context) {
    context.read<MoreBloc>().add(MoreBoardStudentEvent());
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
          return studentDetailBody(context,widget.title,);
        } else {
          return Container();
        }
      },
    );
  }
}
