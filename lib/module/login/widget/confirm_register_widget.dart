import 'package:custom_timer/custom_timer.dart';
import 'package:f2fbuu/customs/button/button_custom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/message/text_confirm_register.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/customs/text_file/text_field_custom.dart';
import 'package:f2fbuu/customs/text_link/text_link_otp_custom.dart';
import 'package:f2fbuu/module/login/bloc/register_bloc/register_bloc.dart';
import 'package:f2fbuu/module/login/model/response/screen_register_response.dart';
import 'package:f2fbuu/module/login/widget/count_time_otp_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget confirmRegisterPageWidget(
    BuildContext context, ScreenRegisterResponse? screenRegisterResponse, TextEditingController confirmOTPController,
    {required String valueUserRegister,
    required String valueEmailRegister,
    required CustomTimerController controller}) {
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
          screenRegisterResponse?.body?.screeninfo?.titleconregis ?? confirmRegisterTitleConfirmRegister,
          style: const TextStyle(
            color: Colors.black,
            fontSize: sizeTitle24,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Text(
                        screenRegisterResponse?.body?.screeninfo?.textotpwillsent?? confirmRegisterTextOTPWilSent,
                        style: const TextStyle(
                          fontSize: sizeTextBig20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
                        child: Text(valueEmailRegister,
                            style: const TextStyle(
                                decoration: TextDecoration.underline,
                                color: tcOTPSent,
                                decorationColor: tcOTPSent,
                                fontWeight: FontWeight.w500,
                                fontSize: sizeTextBig20)),
                      ),
                      Text(
                        screenRegisterResponse?.body?.screeninfo?.textpleaseconfirm?? confirmRegisterTextPleaseConfirm,
                        style: const TextStyle(
                          fontSize: sizeTextBig20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ]),
                  ),
                  TextFieldCustom(
                    maxLengthOTP: 6,
                    textEditingController: confirmOTPController,
                    onChanged: (valueConfirmRegisterOTP) {
                      confirmOTPController.text = valueConfirmRegisterOTP;
                    },
                    hintLabel: screenRegisterResponse?.body?.screeninfo?.edtotp ??confirmRegisterEdtOTP,
                    textInputType: TextInputType.number,
                  ),
                  CountTimeOTPWidget(
                    sendOTP: TextSendOTPCustom(
                      textlabel: screenRegisterResponse?.body?.screeninfo?.textsentotpagain??confirmRegisterTextSentOTPAgain,
                      textcolor: tcOTPSent,
                      sizetext: sizeTextSmall16,
                      onTap: () {
                        BlocProvider.of<RegisterBloc>(context)
                            .add(ReSentOTPConfirmRegisterEvent(userID: valueUserRegister, email: valueEmailRegister));
                      },
                    ),
                    controller: controller,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Center(
                    child: ButtonCustom(
                      label: screenRegisterResponse?.body?.screeninfo?.btnconfirm?? confirmRegisterBtnConfirm,
                      colortext: tcButtonTextBlack,
                      colorbutton: tcButtonTextWhite,
                      sizetext: sizeTextBig20,
                      colorborder: tcButtonTextBoarder,
                      sizeborder: 10,
                      onPressed: () {
                        BlocProvider.of<RegisterBloc>(context)
                            // ..isFetching = true
                            .add(SubmitConfirmRegisterEvent(
                                email: valueEmailRegister, userID: valueUserRegister, otp: confirmOTPController.text));
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                ],
              ),
            )),
      ),
    ),
  );
}
