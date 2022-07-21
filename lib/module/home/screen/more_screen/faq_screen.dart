import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/module/home/bloc/more_bloc/more_bloc.dart';
import 'package:f2fbuu/module/home/model/response/more_response/screen_more_faq_response.dart';
import 'package:f2fbuu/module/home/screen/more_widget/faq_body.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class FaqScreen extends StatelessWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MoreBloc()..add(MoreFAQEvent()),
        child:  const FaqPage());
  }
}
class FaqPage extends StatefulWidget {
  const FaqPage({Key? key, }) : super(key: key);

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> with ProgressDialog {
  ScreenMoreFAQResponse? _screenHomeMoreFAQResponse;

  @override
  Widget build(BuildContext context)
  {
    return  BlocConsumer<MoreBloc, MoreState>(
      listener: (context, state) {
        if (state is MoreFAQLoading) {
          showProgressDialog(context);
        }
        if (state is MoreFAQEndLoading) {
          hideProgressDialog(context);
        }
        if (state is MoreFAQError) {
          // show dialog error
          // dialogOneLineOneBtn(context, state.message + '\n \n ' + 'Do you want to continue?', "OK", onClickBtn: () {
          //   Navigator.of(context).pop();
          // });
          if (kDebugMode) {
            print(state.message);
          }
        }

      },
      builder: (context, state) {
        if (state is MoreFAQSuccessState) {
          _screenHomeMoreFAQResponse = state.responseFAQ;
          return fagBody(context,_screenHomeMoreFAQResponse);
        }


        return Scaffold(body: Container(
          color: Colors.white,
        ));
      },
      buildWhen: (context, state) {
        return state is MoreFAQSuccessState ;
      },
    );
  }

}

