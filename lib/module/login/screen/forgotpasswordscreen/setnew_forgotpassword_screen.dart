import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/dialog/texterror.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/customs/textfile/buildtextfieldcustom.dart';
import 'package:f2fbuu/customs/textfile/buildtextfieldpasswordcustom.dart';
import 'package:f2fbuu/customs/textlink/textlinkotpcustom.dart';
import 'package:f2fbuu/module/login/bloc/fotgotpasswordbloc/forgorpassword_bloc.dart';
import 'package:f2fbuu/module/login/model/response/re_send_otp_forgot_password_response.dart';
import 'package:f2fbuu/module/login/model/response/screen_forgot_password_response.dart';
import 'package:f2fbuu/module/login/model/response/submit_forgot_setnew_forgotpassword_response.dart';
import 'package:f2fbuu/module/login/screen/loginscreen/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
class setNewForgotPasswordScreen extends StatelessWidget {
  final String valueLanguage;
  final String ForgotpasswordValueEmail;
  final String ForgotpasswordValueUserID;
  const setNewForgotPasswordScreen({Key? key,
    required this.valueLanguage,
    required this.ForgotpasswordValueEmail,
    required this.ForgotpasswordValueUserID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ForgorPasswordBloc()..add(ScreenInfoForgotPasswordEvent(userLanguage: valueLanguage)),
        child: setNewForgotPasswordPage(
          valueLanguage:valueLanguage,
          ForgotpasswordValueEmail: ForgotpasswordValueEmail,
          ForgotpasswordValueUserID: ForgotpasswordValueUserID,));
  }
}
class setNewForgotPasswordPage extends StatefulWidget with ProgressDialog {
  final String valueLanguage;
  final String ForgotpasswordValueEmail;
  final String ForgotpasswordValueUserID;
  setNewForgotPasswordPage({
    Key? key,
    required this.valueLanguage,
    required this.ForgotpasswordValueEmail,
    required this.ForgotpasswordValueUserID,
  }) : super(key: key);

  @override
  State<setNewForgotPasswordPage> createState() => _setNewForgotPasswordPageState();
}

class _setNewForgotPasswordPageState extends State<setNewForgotPasswordPage> with ProgressDialog {
  SubmitForgotSetNewForgotPasswordResponse? _submitForgotSetNewForgotPasswordResponse;
  ScreenForgotPasswordResponse? _screenSetNewforgotpasswordResponse;
  ReSendOtpForgotPasswordResponse? _reSendOtpForgotPasswordResponse;
  // late String userLanguage;
  // @override
  // void initState() {
  //   super.initState();
  //   language();
  // }
  //
  // language() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     userLanguage = prefs.getString('userLanguage') ?? 'TH';
  //   });
  //   context.read<ForgorPasswordBloc>().add(SetNewForgotPasswordScreenInfoEvent(userLanguage: userLanguage));
  // }
  late String userLanguage;
  @override
  void initState() {
    super.initState();
    userLanguage = widget.valueLanguage;
    context.read<ForgorPasswordBloc>().add(ScreenInfoSetNewForgotPasswordEvent(userLanguage: userLanguage));
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
        if (state is ReSentOTPSetNewForgotPasswordLoading) {
          showProgressDialog(context);
        }
        if (state is ReSentOTPSetNewForgotPasswordEndLoading) {
          hideProgressDialog(context);
        }
        if (state is SetNewForgotPasswordError) {
          // show dialog error
          dialogOneLineOneBtn(context, state.message + '\n  ', "OK", onClickBtn: () {
            Navigator.of(context).pop();
          });
        }
        if (state is ReSentOTPSetNewForgotPasswordError) {
          // show dialog error
          dialogOneLineOneBtn(context, state.message + '\n ', "OK", onClickBtn: () {
            Navigator.of(context).pop();
          });
        }
        if (state is ReSentOTPSetNewForgotPasswordSuccessState) {
          _reSendOtpForgotPasswordResponse = state.responseReSendOtpForgotPasswordResponse;
          dialogOneLineOneBtn(context, "${_reSendOtpForgotPasswordResponse?.head?.message}" + '\n ', "OK",
              onClickBtn: () {
            Navigator.of(context).pop();
          });
        }
        if (state is SubmitSetNewForgotPasswordSuccessState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => loginScreen())
          );
        }
      },
      builder: (context, state) {
        if (state is ScreenInfoSetNewForgotPasswordSuccessState) {
          _screenSetNewforgotpasswordResponse = state.responseSetNewForgotPassword;
          return buildContentsetnewforgotpassword(context, _screenSetNewforgotpasswordResponse, userLanguage,
              ForgotpasswordValueEmail: widget.ForgotpasswordValueEmail,
              ForgotpasswordValueUserID: widget.ForgotpasswordValueUserID);
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

buildContentsetnewforgotpassword(
    BuildContext context, ScreenForgotPasswordResponse? _screenforgotpasswordResponse, String userLanguage,
    {required String ForgotpasswordValueEmail, required String ForgotpasswordValueUserID}) {
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController code = TextEditingController();

  String passwordvalue = "";
  String confirmpasswordvalue = "";
  String codevalue = " ";
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
          "${_screenforgotpasswordResponse?.body?.screeninfo?.titlesetnewpass}",
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
              Center(
                child: Column(children: [
                  Text(
                    "${_screenforgotpasswordResponse?.body?.screeninfo?.textotpwillsent}",
                    style: TextStyle(
                      fontSize: sizeTextBig20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
                    child: Center(
                      child: Text(
                          // ${_screenforgotpasswordResponse?.body?.screeninfo?.edtemailforgot} :
                          "${ForgotpasswordValueEmail}",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: TC_OTPSent,
                              decorationColor: TC_OTPSent,
                              fontWeight: FontWeight.w500,
                              fontSize: sizeTextBig20)),
                    ),
                  ),
                  Text(
                    "${_screenforgotpasswordResponse?.body?.screeninfo?.texpleaseconfirm}",
                    style: TextStyle(
                      fontSize: sizeTextBig20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ]),
              ),
              buildTextFieldPasswordCustom(
                textEditingController: password,
                onChanged: (value) {
                  passwordvalue = value;
                },
                hint_label: "${_screenforgotpasswordResponse?.body?.screeninfo?.edtpass}",
                textInputType: TextInputType.text,
              ),
              buildTextFieldPasswordCustom(
                textEditingController: confirmpassword,
                onChanged: (value) {
                  confirmpasswordvalue = value;
                },
                hint_label: "${_screenforgotpasswordResponse?.body?.screeninfo?.edtcpass}",
                textInputType: TextInputType.text,
              ),
              buildTextFieldCustom(
                textEditingController: code,
                onChanged: (value) {
                  codevalue = value;
                },
                hint_label: "${_screenforgotpasswordResponse?.body?.screeninfo?.otp}",
                textInputType: TextInputType.number,
              ),
              Center(
                child: textSentOTPCustom(
                  textlabel: "${_screenforgotpasswordResponse?.body?.screeninfo?.btnsentotpagain}",
                  textcolor: TC_OTPSent,
                  sizetext: sizeTextSmall16,
                  onTap: () {
                    context.read<ForgorPasswordBloc>().add(ReSentOTPSetNewForgotPasswordEvent(
                        userLanguage: userLanguage,
                        userID: ForgotpasswordValueUserID,
                        email: ForgotpasswordValueEmail));
                  },
                  // onTap: () {
                  //   dialogOneLineOneBtn(context, errregidter2 + '\n \n ' + 'Do you want to continue?', "OK",
                  //       onClickBtn: () {
                  //     Navigator.of(context).pop();
                  //   });
                  // },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Center(
                child: ButtonCustom(
                  label: "  ${_screenforgotpasswordResponse?.body?.screeninfo?.btnconfirm}  ",
                  colortext: BC_ButtonText_style_Black,
                  colorbutton: BC_ButtonText_style_White,
                  sizetext: sizeTextBig20,
                  colorborder: BC_ButtonText_style_Black_Boarder,
                  sizeborder: 10,
                  onPressed: () {
                    context.read<ForgorPasswordBloc>().add(SubmitSetNewForgotPasswordEvent(
                        userLanguage: userLanguage,
                        password: passwordvalue,
                        confirmpassword: confirmpasswordvalue,
                        otp: codevalue));
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
