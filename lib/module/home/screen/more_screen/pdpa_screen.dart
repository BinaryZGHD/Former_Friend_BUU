
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/module/home/bloc/more_bloc/more_bloc.dart';
import 'package:f2fbuu/module/home/model/response/more_response/scree_more_pdpa_response.dart';
import 'package:f2fbuu/module/home/screen/more_widget/m_pdpa_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class PDPAScreen extends StatelessWidget {
  const PDPAScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MoreBloc()..add(MorePDPAEvent()),
        child:  const PDPAPage());
  }
}

class PDPAPage extends StatefulWidget {
  const PDPAPage({Key? key}) : super(key: key);

  @override
  State<PDPAPage> createState() => _PDPAPageState();
}

class _PDPAPageState extends State<PDPAPage> with ProgressDialog {

  ScreenMorePDPAResponse? _screenHomeMorePDPAResponse;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoreBloc, MoreState>(
      listener: (context, state) {
        if (state is MorePDPALoading) {
          showProgressDialog(context);
        }
        if (state is MorePDPAEndLoading) {
          hideProgressDialog(context);
        }
        if (state is MorePDPAError) {
          // show dialog error
          if (kDebugMode) {
            print(state.message);
          }
        }
      },
      builder: (context, state) {
        if (state is MorePDPASuccessState) {
          _screenHomeMorePDPAResponse = state.responsePDPA;
          return mPDPAWidget(context,_screenHomeMorePDPAResponse);
        } else {
          return Container();
        }
      },

    );
  }
}