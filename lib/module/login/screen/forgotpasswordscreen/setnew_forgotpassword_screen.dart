import 'package:custom_timer/custom_timer.dart';
import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/module/login/bloc/fotgotpasswordbloc/forgorpassword_bloc.dart';
import 'package:f2fbuu/module/login/model/response/re_send_otp_forgot_password_response.dart';
import 'package:f2fbuu/module/login/model/response/screen_forgot_password_response.dart';
import 'package:f2fbuu/module/login/screen/loginscreen/login_screen.dart';
import 'package:f2fbuu/module/login/widget/setnew_forgotpassword_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetNewForgotPasswordScreen extends StatefulWidget {

  final String valueEmailForgotpassword;
  final String valueUserIDForgotpassword;
  const SetNewForgotPasswordScreen(
      {Key? key, required this.valueEmailForgotpassword, required this.valueUserIDForgotpassword})
      : super(key: key);

  @override
  State<SetNewForgotPasswordScreen> createState() => _SetNewForgotPasswordScreenState();
}

class _SetNewForgotPasswordScreenState extends State<SetNewForgotPasswordScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ForgorPasswordBloc()..add(ScreenInfoForgotPasswordEvent()),
        child: SetNewForgotPasswordPage(
          valueEmailForgotpassword: widget.valueEmailForgotpassword,
          valueUserIDForgotpassword: widget.valueUserIDForgotpassword,
        ));
  }
}

class SetNewForgotPasswordPage extends StatefulWidget with ProgressDialog {
  final String valueEmailForgotpassword;
  final String valueUserIDForgotpassword;
  SetNewForgotPasswordPage({
    Key? key,
    required this.valueEmailForgotpassword,
    required this.valueUserIDForgotpassword,
  }) : super(key: key);

  @override
  State<SetNewForgotPasswordPage> createState() => _SetNewForgotPasswordPageState();
}

class _SetNewForgotPasswordPageState extends State<SetNewForgotPasswordPage> with ProgressDialog {
  final CustomTimerController _controller = CustomTimerController();
  ScreenForgotPasswordResponse? _screenSetNewforgotpasswordResponse;
  ReSendOtpForgotPasswordResponse? _reSendOtpForgotPasswordResponse;
  @override
  void initState() {
    super.initState();
    context.read<ForgorPasswordBloc>().add(ScreenInfoSetNewForgotPasswordEvent());
  }
  resetTimer() {
    _controller.reset();
  }
  startTimer() {
    _controller.start();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgorPasswordBloc, ForgorPasswordState>(
      listener: (context, state) {
        if (state is SetNewForgotPasswordLoading) {
          showProgressDialog(context);
        }
        if (state is SetNewForgotPasswordEndLoading) {
          hideProgressDialog(context);
        }
        if (state is SetNewForgotPasswordError) {
          // show dialog error
          dialogOneLineOneBtn(context, '${state.message}\n  ', "OK", onClickBtn: () {
            Navigator.of(context).pop();
          });
        }
        if (state is ReSentOTPSetNewForgotPasswordError) {
          // show dialog error
          dialogOneLineOneBtn(context, '${state.message}\n ', "OK", onClickBtn: () {
            Navigator.of(context).pop();
          });
        }
        if (state is ReSentOTPSetNewForgotPasswordSuccessState) {
          resetTimer();
          _reSendOtpForgotPasswordResponse = state.responseReSendOtpForgotPasswordResponse;
          startTimer();
          dialogOneLineOneBtn(context, "${_reSendOtpForgotPasswordResponse?.head?.message}" '\n ', "OK",
              onClickBtn: () {
            Navigator.of(context).pop();
          });
        }
        if (state is SubmitSetNewForgotPasswordSuccessState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
        }
      },
      builder: (context, state) {
        if (state is ScreenInfoSetNewForgotPasswordSuccessState) {
          startTimer();
          _screenSetNewforgotpasswordResponse = state.responseSetNewForgotPassword;
          return setnewForgotPasswordPageWidget(context, _screenSetNewforgotpasswordResponse,
              valueEmailForgotpassword: widget.valueEmailForgotpassword,
              valueUserIDForgotpassword: widget.valueUserIDForgotpassword,
              controller:_controller);
        } else {
          return Scaffold(
              body: Container(
            color: Colors.white,
          ));
        }
      },
      buildWhen: (context, state) {
        return state is ScreenInfoSetNewForgotPasswordSuccessState;
      },
    );
  }
}
