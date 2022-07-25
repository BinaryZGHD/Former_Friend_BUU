import 'package:f2fbuu/module/login/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:f2fbuu/module/login/model/response/screen_forgot_password_response.dart';
import 'package:f2fbuu/module/login/screen/forgot_password_screen/set_new_forgot_password_screen.dart';
import 'package:f2fbuu/module/login/widget/forgot_password_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ForgorPasswordBloc()..add(ScreenInfoForgotPasswordEvent()),
        child: const ForgotPasswordPage());
  }
}

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> with ProgressDialog {
  ScreenForgotPasswordResponse? _screenForgotPasswordResponse;
  TextEditingController userIDController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgorPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordLoading) {
          showProgressDialog(context);
        }
        if (state is ForgotPasswordEndLoading) {
          hideProgressDialog(context);
        }
        if (state is ForgotPasswordError) {
          // show dialog error
          dialogOneLineOneBtn(context, '${state.message}\n ', "OK", onClickBtn: () {
            Navigator.of(context).pop();
          });
          if (kDebugMode) {
            print(state.message);
          }
        }
        if (state is SubmitForgotPasswordSuccessState) {
          var valueEmailForgotPassword = state.emailForgotPassword;
          var valueUserIDForgotPassword = state.userIDForgotPassword;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SetNewForgotPasswordScreen(
                      valueEmailForgotPassword: valueEmailForgotPassword,
                      valueUserIDForgotPassword: valueUserIDForgotPassword)));
        }
      },
      builder: (context, state) {
        if (state is ScreenInfoForgotPasswordSuccessState) {
          _screenForgotPasswordResponse = state.responseForgotPassword;
          return forgotPasswordPageWidget(context, _screenForgotPasswordResponse, emailController, userIDController);
        } else {
          return Scaffold(
              body: Container(
            color: Colors.white,
          ));
        }
      },
      buildWhen: (context, state) {
        return state is ScreenInfoForgotPasswordSuccessState;
      },
    );
  }
}
