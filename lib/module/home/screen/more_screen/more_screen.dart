
import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/module/home/bloc/morebloc/more_bloc.dart';
import 'package:f2fbuu/module/home/model/response/more_response/screen_more_response.dart';
import 'package:f2fbuu/module/home/screen/widget/more_body_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MoreBloc()..add(MoreScreenInfoEvent()),
        child: const MorePage());
  }
}

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> with ProgressDialog {
  ScreenMoreResponse? screenMoreResponse;


  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoreBloc, MoreState>(
      listener: (context, state) {
        if (state is MoreLoading) {
          showProgressDialog(context);
        }
        if (state is MoreEndLoading) {
          hideProgressDialog(context);
        }
        if (state is MoreError) {
          // show dialog error
          dialogOneLineOneBtn(context, '${state.message}\n ', "OK", onClickBtn: () {
            Navigator.of(context).pop();
          });
          if (kDebugMode) {
            print(state.message);
          }
        }

      },
      builder: (context, state) {
        if (state is MoreScreenInfoSuccessState) {
          screenMoreResponse = state.responseScreenMore;
          return moreBodyWidget(context, screenMoreResponse,_launchInBrowser,setState);
        } else {
          return Scaffold(
              body: Container(
                color: Colors.white,
              ));
        }
      },
      buildWhen: (context, state) {
        return state is MoreScreenInfoSuccessState;
      },
    );
  }
}

