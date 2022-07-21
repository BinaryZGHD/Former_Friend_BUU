import 'package:custom_timer/custom_timer.dart';
import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/module/login/bloc/register_bloc/register_bloc.dart';
import 'package:f2fbuu/module/login/model/response/re_send_otp_confirm_register_response.dart';
import 'package:f2fbuu/module/login/model/response/screen_register_response.dart';
import 'package:f2fbuu/module/login/screen/login_screen/login_screen.dart';
import 'package:f2fbuu/module/login/widget/confirm_register_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterConfirmScreen extends StatelessWidget {
  final String registerValueEmail;
  final String registerValueUserID;

  const RegisterConfirmScreen({Key? key, required this.registerValueEmail, required this.registerValueUserID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterBloc()..add(ScreenInfoConfirmRegisterEvent()),
        child: RegisterConfirmPage(registerValueEmail: registerValueEmail, registerValueUserID: registerValueUserID));
  }
}

class RegisterConfirmPage extends StatefulWidget {
  final String registerValueEmail;
  final String registerValueUserID;
  const RegisterConfirmPage({
    Key? key,
    required this.registerValueEmail,
    required this.registerValueUserID,
  }) : super(key: key);

  @override
  State<RegisterConfirmPage> createState() => _RegisterConfirmPageState();
}

class _RegisterConfirmPageState extends State<RegisterConfirmPage> with ProgressDialog {
  final CustomTimerController _controller = CustomTimerController();
  late String userLanguage;
  resetTimer() {
    _controller.reset();
  }
  startTimer() {
    _controller.start();
  }
  @override
  void initState() {
    super.initState();
    // context.read<RegisterBloc>().add(ScreenInfoConfirmRegisterEvent(userLanguage: userLanguage));
  }

  ScreenRegisterResponse? _screenRegisterResponse;
  ReSendOtpConfirmRegisterResponse? _reSendOtpConfirmRegisterResponse;

  TextEditingController confirmOTPController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is ConfirmRegisterLoading) {
          showProgressDialog(context);
        }
        if (state is ConfirmRegisterEndLoading) {
          hideProgressDialog(context);
        }
        if (state is ConfirmRegisterError) {
          // show dialog error
          dialogOneLineOneBtn(context, '${state.message}\n', "OK", onClickBtn: () {
            Navigator.of(context).pop();
          });
          if (kDebugMode) {
            print(state.message);
          }
        }
        if (state is ReSentOTPConfirmRegisterState) {
          resetTimer();
          _reSendOtpConfirmRegisterResponse = state.responseReSentOTPConfirmRegistern;
          startTimer();
          dialogOneLineOneBtn(context, "${_reSendOtpConfirmRegisterResponse?.head?.message}" '\n ', "OK",
              onClickBtn: () {
            Navigator.of(context).pop();
          });
        }
        if (state is SubmitConfirmRegisterState) {
          // show dialog error
          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen())
              // ,
              // (Route<dynamic> route) => false
              );
        }
      },
      builder: (context, state) {
        if (state is ScreenInfoConfirmRegisterSuccessState) {
          startTimer();
          _screenRegisterResponse = state.responseConfirmRegisterScreen;
          return confirmRegisterPageWidget(context,
              _screenRegisterResponse,
              confirmOTPController,
              valueUserRegister: widget.registerValueUserID,
              valueEmailRegister: widget.registerValueEmail,
              controller:_controller
          );
        }
        return Scaffold(
            body: Container(
          color: Colors.white,
        ));
      },
      buildWhen: (context, state) {
        return state is ScreenInfoConfirmRegisterSuccessState;
      },
    );
  }
}
