import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/customs/textfile/buildtextfieldcustom.dart';
import 'package:f2fbuu/customs/textfile/buildtextfieldpasswordcustom.dart';
import 'package:f2fbuu/customs/textlink/textlinkotpcustom.dart';
import 'package:f2fbuu/module/login/bloc/fotgotpasswordbloc/forgorpassword_bloc.dart';
import 'package:f2fbuu/module/login/model/response/screen_forgot_password_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

setnewForgotPasswordPageWidget(BuildContext context, ScreenForgotPasswordResponse? screenforgotpasswordResponse,
    {required String valueEmailForgotpassword, required String valueUserIDForgotpassword}) {
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
          icon: const Icon(
            Icons.arrow_back,
            size: sizeTitle24,
            color: Colors.black,
          ),
        ),
        title: Text(
          "${screenforgotpasswordResponse?.body?.screeninfo?.titlesetnewpass}",
          style: const TextStyle(
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
                    "${screenforgotpasswordResponse?.body?.screeninfo?.textotpwillsent}",
                    style: const TextStyle(
                      fontSize: sizeTextBig20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
                    child: Center(
                      child: Text(
                          // ${_screenforgotpasswordResponse?.body?.screeninfo?.edtemailforgot} :
                          valueEmailForgotpassword,
                          style: const TextStyle(
                              decoration: TextDecoration.underline,
                              color: tcOTPSent,
                              decorationColor: tcOTPSent,
                              fontWeight: FontWeight.w500,
                              fontSize: sizeTextBig20)),
                    ),
                  ),
                  Text(
                    "${screenforgotpasswordResponse?.body?.screeninfo?.texpleaseconfirm}",
                    style: const TextStyle(
                      fontSize: sizeTextBig20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              ),
              buildTextFieldPasswordCustom(
                textEditingController: password,
                onChanged: (value) {
                  passwordvalue = value;
                },
                hint_label: "${screenforgotpasswordResponse?.body?.screeninfo?.edtpass}",
                textInputType: TextInputType.text,
              ),
              buildTextFieldPasswordCustom(
                textEditingController: confirmpassword,
                onChanged: (value) {
                  confirmpasswordvalue = value;
                },
                hint_label: "${screenforgotpasswordResponse?.body?.screeninfo?.edtcpass}",
                textInputType: TextInputType.text,
              ),
              BuildTextFieldCustom(
                maxLengthOTP: 6,
                textEditingController: code,
                onChanged: (value) {
                  codevalue = value;
                },
                hintLabel: "${screenforgotpasswordResponse?.body?.screeninfo?.otp}",
                textInputType: TextInputType.number,
              ),
              Center(
                child: TextSentOTPCustom(
                  textlabel: "${screenforgotpasswordResponse?.body?.screeninfo?.btnsentotpagain}",
                  textcolor: tcOTPSent,
                  sizetext: sizeTextSmall16,
                  onTap: () {
                    context.read<ForgorPasswordBloc>().add(ReSentOTPSetNewForgotPasswordEvent(
                        userID: valueUserIDForgotpassword, email: valueEmailForgotpassword));
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
                  label: "  ${screenforgotpasswordResponse?.body?.screeninfo?.btnconfirm}  ",
                  colortext: tcButtonTextBlack,
                  colorbutton: tcButtonTextWhite,
                  sizetext: sizeTextBig20,
                  colorborder: tcButtonTextBoarder,
                  sizeborder: 10,
                  onPressed: () {
                    context.read<ForgorPasswordBloc>().add(SubmitSetNewForgotPasswordEvent(
                        password: passwordvalue, confirmpassword: confirmpasswordvalue, otp: codevalue));
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
