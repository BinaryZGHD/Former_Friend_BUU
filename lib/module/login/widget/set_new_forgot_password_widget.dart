
import 'package:custom_timer/custom_timer.dart';
import 'package:f2fbuu/customs/button/button_custom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/message/text_forgot_password.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/customs/text_file/text_field_custom.dart';
import 'package:f2fbuu/customs/text_file/text_field_password_custom.dart';
import 'package:f2fbuu/customs/text_link/text_link_otp_custom.dart';
import 'package:f2fbuu/module/login/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:f2fbuu/module/login/model/response/screen_forgot_password_response.dart';
import 'package:f2fbuu/module/login/widget/count_time_otp_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

setNewForgotPasswordPageWidget(BuildContext context, ScreenForgotPasswordResponse? screenForgotPasswordResponse,
    {required String valueEmailForgotPassword, required String valueUserIDForgotPassword, required CustomTimerController controller}) {
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController code = TextEditingController();

  String passwordValue = "";
  String confirmPasswordValue = "";
  String codeValue = " ";
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
          screenForgotPasswordResponse?.body?.screeninfo?.titlesetnewpass?? forgotPasswordSetNewTitleSetNewPassword,
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
                    screenForgotPasswordResponse?.body?.screeninfo?.textotpwillsent?? forgotPasswordSetNewTextOTPWillSent,
                    style: const TextStyle(
                      fontSize: sizeTextBig20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
                    child: Center(
                      child: Text(
                          valueEmailForgotPassword,
                          style: const TextStyle(
                              decoration: TextDecoration.underline,
                              color: tcOTPSent,
                              decorationColor: tcOTPSent,
                              fontWeight: FontWeight.w500,
                              fontSize: sizeTextBig20)),
                    ),
                  ),
                  Text(
                    screenForgotPasswordResponse?.body?.screeninfo?.texpleaseconfirm?? forgotPasswordSetNewTextPleaseConfirm,
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
              TextFieldPasswordCustom(
                textEditingController: password,
                onChanged: (value) {
                  passwordValue = value;
                },
                hintLabel: screenForgotPasswordResponse?.body?.screeninfo?.edtpass?? forgotPasswordSetNewEdtPassword,
                textInputType: TextInputType.text,
              ),
              TextFieldPasswordCustom(
                textEditingController: confirmPassword,
                onChanged: (value) {
                  confirmPasswordValue = value;
                },
                hintLabel: screenForgotPasswordResponse?.body?.screeninfo?.edtcpass?? forgotPasswordSetNewEdtConfirmPassword,
                textInputType: TextInputType.text,
              ),

              TextFieldCustom(
                maxLengthOTP: 6,
                textEditingController: code,
                onChanged: (value) {
                  codeValue = value;
                },
                hintLabel: screenForgotPasswordResponse?.body?.screeninfo?.otp?? forgotPasswordSetNewOTP,
                textInputType: TextInputType.number,
              ),
              CountTimeOTPWidget(
                   sendOTP : TextSendOTPCustom(
                     textlabel: screenForgotPasswordResponse?.body?.screeninfo?.btnsentotpagain?? forgotPasswordSetNewBtnSentOTPAgain,
                     textcolor: tcOTPSent,
                     sizetext: sizeTextSmall16,
                     onTap: () {
                       context.read<ForgorPasswordBloc>().add(ReSentOTPSetNewForgotPasswordEvent(
                           userID: valueUserIDForgotPassword, email: valueEmailForgotPassword));
                     },
                   ),
                    controller: controller,

              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Center(
                child: ButtonCustom(
                  label: screenForgotPasswordResponse?.body?.screeninfo?.btnconfirm?? forgotPasswordSetNewBtnConfirm ,
                  colortext: tcButtonTextBlack,
                  colorbutton: tcButtonTextWhite,
                  sizetext: sizeTextBig20,
                  colorborder: tcButtonTextBoarder,
                  sizeborder: 10,
                  onPressed: () {
                    context.read<ForgorPasswordBloc>().add(SubmitSetNewForgotPasswordEvent(
                        password: passwordValue, confirmpassword: confirmPasswordValue, otp: codeValue));
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
