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
import 'package:f2fbuu/module/login/model/response/screen_forgot_password_response.dart';
import 'package:f2fbuu/module/login/model/response/submit_forgot_setnew_forgotpassword_response.dart';
import 'package:f2fbuu/module/login/screen/loginscreen/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class setNewForgotPasswordScreen extends StatefulWidget with ProgressDialog {
  final String valueLanguage;

  setNewForgotPasswordScreen({
    Key? key, required this.valueLanguage,

  }) : super(key: key);

  @override
  State<setNewForgotPasswordScreen> createState() => _setNewForgotPasswordScreenState();
}

class _setNewForgotPasswordScreenState extends State<setNewForgotPasswordScreen> with ProgressDialog {
  SubmitForgotSetNewForgotPasswordResponse? _submitForgotSetNewForgotPasswordResponse;
  ScreenForgotPasswordResponse? _screenSetNewforgotpasswordResponse;
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
    context.read<ForgorPasswordBloc>().add(SetNewForgotPasswordScreenInfoEvent(userLanguage: userLanguage));
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
          dialogOneLineOneBtn(context, state.message + '\n \n ', "OK", onClickBtn: () {
            Navigator.of(context).pop();
          });
          print(state.message);
        }
        if (state is SetNewForgotPasswordSubmitSuccessState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => loginScreen()));
        }
      },
      builder: (context, state) {
        if (state is SetNewForgotPasswordScreenInfoSuccessState) {
          _screenSetNewforgotpasswordResponse = state.responseSetNewForgotPassword;
          return buildContentsetnewforgotpassword(context, _screenSetNewforgotpasswordResponse ,userLanguage);
        } else {
          return Scaffold(
              body: Container(
            color: Colors.white,
          ));
        }
      },
      buildWhen: (context, state) {
        return state is SetNewForgotPasswordScreenInfoSuccessState;
      },
    );
  }
}

buildContentsetnewforgotpassword(
  BuildContext context,
  ScreenForgotPasswordResponse? _screenforgotpasswordResponse, String userLanguage,
) {
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
          "${_screenforgotpasswordResponse?.body?.screeninfo?.textheadsetnewpass}",
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Text(
                    "${_screenforgotpasswordResponse?.body?.screeninfo?.edtemailforgot}",
                    style: TextStyle(
                      fontSize: sizeTextBig20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Text(
                    "${_screenforgotpasswordResponse?.body?.screeninfo?.texpleaseconfirm}",
                    style: TextStyle(
                      fontSize: sizeTextBig20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
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
                    dialogOneLineOneBtn(context, errregidter2 + '\n \n ' + 'Do you want to continue?', "OK",
                        onClickBtn: () {
                      Navigator.of(context).pop();
                    });
                  },
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
                    context.read<ForgorPasswordBloc>().add(
                        SetNewForgotPasswordSubmitEvent(userLanguage: userLanguage , password: passwordvalue ,confirmpassword: confirmpasswordvalue, otp: codevalue));
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
