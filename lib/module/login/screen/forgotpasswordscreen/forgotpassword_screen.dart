import 'package:f2fbuu/module/login/model/response/screen_forgot_password_response.dart';
import 'package:f2fbuu/module/login/model/response/submit_forgot_password_response.dart';
import 'package:f2fbuu/module/login/screen/forgotpasswordscreen/setnew_forgotpassword_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/customs/textfile/buildtextfieldcustom.dart';
import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/module/login/bloc/fotgotpasswordbloc/forgorpassword_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
class forgotPasswordScreen extends StatelessWidget {
  const forgotPasswordScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ForgorPasswordBloc()..add(ScreenInfoForgotPasswordEvent()),
        child: forgotPasswordPage());
  }
}

class forgotPasswordPage extends StatefulWidget {
  const forgotPasswordPage( {Key? key,}) : super(key: key);

  @override
  State<forgotPasswordPage> createState() => _forgotPasswordPageState();
}

class _forgotPasswordPageState extends State<forgotPasswordPage> with ProgressDialog {
  ScreenForgotPasswordResponse? _screenforgotpasswordResponse;
  SubmitForgotPasswordResponse? _forgotPasswordSubmitResponse;

  @override
  void initState() {
    super.initState();
    // context.read<ForgorPasswordBloc>().add(ScreenInfoForgotPasswordEvent(userLanguage: userLanguage));
  }


  @override
  Widget build(BuildContext context) {
    // context.read<ForgorPasswordBloc>().add(forgotPasswordPageInfoEvent());
    return BlocConsumer<ForgorPasswordBloc, ForgorPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordLoading) {
          showProgressDialog(context);
        }
        if (state is ForgotPasswordEndLoading) {
          hideProgressDialog(context);
        }
        if (state is ForgotPasswordError) {
          // show dialog error
          dialogOneLineOneBtn(context, state.message + '\n ', "OK", onClickBtn: () {
            Navigator.of(context).pop();
          });
          print(state.message);
        }
        if (state is SubmitForgotPasswordSuccessState) {
          _forgotPasswordSubmitResponse = state.responseSubmitForgotPassword;
          var ForgotpasswordValueEmail = state.emailForgotPassword;
          var ForgotpasswordValueUserID = state.userIDForgotPassword;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => setNewForgotPasswordScreen(
                      ForgotpasswordValueEmail: ForgotpasswordValueEmail, ForgotpasswordValueUserID: ForgotpasswordValueUserID
                  )));
        }
      },
      builder: (context, state) {
        if (state is ScreenInfoForgotPasswordSuccessState) {
          _screenforgotpasswordResponse = state.responseForgotPassword;
          return buildContentforgotpassword(context, _screenforgotpasswordResponse);
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

buildContentforgotpassword(
    BuildContext context,
    ScreenForgotPasswordResponse? _screenforgotpasswordResponse,
    ) {
  TextEditingController userIDController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  return WillPopScope(
    onWillPop: () async {
      return false;
    },
    child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: sizeTitle24,
              color: Colors.black,
            ),
          ),
          title: Text(
            "${_screenforgotpasswordResponse?.body?.screeninfo?.titleforgot}",
            style: TextStyle(
              color: Colors.black,
              fontSize: sizeTitle24,
            ),
          ),
        ),
        body: SafeArea(
// height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                buildTextFieldCustom(
                  textEditingController: userIDController,
                  onChanged: (valueUserID) {
                    userIDController.text = valueUserID;
                  },
                  hint_label: "${_screenforgotpasswordResponse?.body?.screeninfo?.edtIDforgot}",
                  textInputType: TextInputType.text,
                ),
                buildTextFieldCustom(
                  textEditingController: emailController,
                  onChanged: (valueEmail) {
                    emailController.text = valueEmail;
                  },
                  hint_label: "${_screenforgotpasswordResponse?.body?.screeninfo?.edtemailforgot}",
                  textInputType: TextInputType.text,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Center(
                  child: ButtonCustom(
                      label: "  ${_screenforgotpasswordResponse?.body?.screeninfo?.btnforgotnext}  ",
                      colortext: BC_ButtonText_style_Black,
                      colorbutton: BC_ButtonText_style_White,
                      sizetext: sizeTextBig20,
                      colorborder: BC_ButtonText_style_Black_Boarder,
                      sizeborder: 10,
                      onPressed: () {
                        context.read<ForgorPasswordBloc>().add(SubmitForgotPasswordEvent(
                            userID: userIDController.text, email: emailController.text, ));
                      }),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              ],
            ),
          ),
        )),
  );
}
