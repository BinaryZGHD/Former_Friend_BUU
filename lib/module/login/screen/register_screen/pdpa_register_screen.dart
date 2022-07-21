import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/module/login/bloc/pdpabloc/pdpa_bloc.dart';
import 'package:f2fbuu/module/login/model/response/screen_pdpa_response.dart';
import 'package:f2fbuu/module/login/screen/registerscreen/register_screen.dart';
import 'package:f2fbuu/module/login/widget/pdpa_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f2fbuu/module/login/screen/loginscreen/login_screen.dart';
import 'package:flutter/material.dart';

class ConditionPDPAScreen extends StatelessWidget {
  const ConditionPDPAScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => PdpaBloc()..add(ScreenInfoPDPAEvent()), child: const ConditionPDPAPage());
  }
}

class ConditionPDPAPage extends StatefulWidget {
  const ConditionPDPAPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ConditionPDPAPage> createState() => _ConditionPDPAPageState();
}

class _ConditionPDPAPageState extends State<ConditionPDPAPage> with ProgressDialog {
  ScreenPDPAResponse? _screenPDPAResponse;
  late String userLanguage;
  @override
  void initState() {
    super.initState();

    // context
    //     .read<PdpaBloc>()
    //     .add(ScreenInfoPDPAEvent(userLanguage: userLanguage));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PdpaBloc, PdpaState>(
      listener: (context, state) {
        if (state is PDPALoading) {
          showProgressDialog(context);
        }
        if (state is PDPAEndLoading) {
          hideProgressDialog(context);
        }
        if (state is PDPAError) {
          // show dialog error
          dialogOneLineOneBtn(context, '${state.message}\n ', "OK", onClickBtn: () {
            Navigator.of(context).pop();
          });
        }
        if (state is PDPADecline) {
          // show dialog error
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
        }
        if (state is PDPAAccept) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
        }
      },
      builder: (context, state) {
        if (state is ScreenInfoPDPASuccessState) {
          _screenPDPAResponse = state.response;
          return pdpaScreenWidget(context, _screenPDPAResponse);
        }
        return Scaffold(
            body: Container(
          color: Colors.white,
        ));
      },
      buildWhen: (context, state) {
        return state is ScreenInfoPDPASuccessState;
      },
    );
  }
}
