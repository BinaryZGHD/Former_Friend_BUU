import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/customs/textfile/buildtextfieldcustom.dart';
import 'package:f2fbuu/customs/textlink/textlinkotpcustom.dart';
import 'package:f2fbuu/module/login/bloc/registerbloc/register_bloc.dart';
import 'package:f2fbuu/module/login/model/response/re_send_otp_confirm_register_response.dart';
import 'package:f2fbuu/module/login/model/response/screen_register_response.dart';
import 'package:f2fbuu/module/login/model/response/submit_confirm_register_response.dart';
import 'package:f2fbuu/module/login/screen/loginscreen/login_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class registerConfirmScreen extends StatefulWidget {
  final String valueLanguage;
  final String RegistervalueEmail;
  final String RegistervalueUserID;
  registerConfirmScreen({
    Key? key,
    required this.valueLanguage,
    required this.RegistervalueEmail,
    required this.RegistervalueUserID,
  }) : super(key: key);

  @override
  State<registerConfirmScreen> createState() => _registerConfirmScreenState();
}

class _registerConfirmScreenState extends State<registerConfirmScreen> with ProgressDialog {
  late String userLanguage;
  @override
  void initState() {
    super.initState();
    userLanguage = widget.valueLanguage;
    context.read<RegisterBloc>().add(ScreenInfoConfirmRegisterEvent(userLanguage: userLanguage));
  }

  ScreenRegisterResponse? _screenRegisterResponse;
  ReSendOtpConfirmRegisterResponse? _reSendOtpConfirmRegisterResponse;
  SubmitConfirmRegisterResponse? _submitConfirmRegisterResponse;
  TextEditingController confirmOTPController = TextEditingController();
  String confirmregisterOTPvalue = " ";
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
          dialogOneLineOneBtn(context, state.message + '\n', "OK", onClickBtn: () {
            Navigator.of(context).pop();
          });
          print(state.message);
        }
        if (state is ReSentOTPConfirmRegisterState) {
          _reSendOtpConfirmRegisterResponse = state.responseReSentOTPConfirmRegistern;
          // show dialog error
          dialogOneLineOneBtn(context, "${_reSendOtpConfirmRegisterResponse?.head?.message}" + '\n ', "OK", onClickBtn: () {
            Navigator.of(context).pop();
          });
        }
        if (state is SubmitConfirmRegisterState) {
          _submitConfirmRegisterResponse = state.responseSubmitConfirmRegister;
          // show dialog error
          Navigator.pushAndRemoveUntil(
              context,MaterialPageRoute(
              builder: (context) => loginScreen(
              )
          ),
          (Route<dynamic> route) => false
          );
        }
      },
      builder: (context, state) {
        if (state is ScreenInfoConfirmRegisterSuccessState) {
          _screenRegisterResponse = state.responseConfirmRegisterScreen;
          return buildContentRegister(context,
              RegisterValueUserID: widget.RegistervalueUserID, RegisterValueEmail: widget.RegistervalueEmail);
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

  buildContentRegister(BuildContext context,
      {required String RegisterValueUserID, required String RegisterValueEmail}) {
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
            "${_screenRegisterResponse?.body?.screeninfo?.titleconregis}",
            style: TextStyle(
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
                          "${_screenRegisterResponse?.body?.screeninfo?.textotpwillsent}",
                          style: TextStyle(
                            fontSize: sizeTextBig20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
                          // ${_screenRegisterResponse?.body?.screeninfo?.edtemailreg} :
                          child: Text("${widget.RegistervalueEmail}",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: TC_OTPSent,
                                  decorationColor: TC_OTPSent,
                                  fontWeight: FontWeight.w500,
                                  fontSize: sizeTextBig20)),
                        ),
                        Text(
                          "${_screenRegisterResponse?.body?.screeninfo?.textpleaseconfirm}",
                          style: TextStyle(
                            fontSize: sizeTextBig20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                      ]),
                    ),
                    buildTextFieldCustom(
                      textEditingController: confirmOTPController,
                      onChanged: (valueConfirmrRegisterOTP) {
                        confirmregisterOTPvalue = valueConfirmrRegisterOTP;
                      },
                      hint_label: "${_screenRegisterResponse?.body?.screeninfo?.edtotp}",
                      textInputType: TextInputType.number,
                    ),
                    Center(
                      child: textSentOTPCustom(
                        textlabel: "${_screenRegisterResponse?.body?.screeninfo?.textsentotpagain}",
                        textcolor: TC_OTPSent,
                        sizetext: sizeTextSmall16,
                        onTap: () {
                          context.read<RegisterBloc>().add(ReSentOTPConfirmRegisterEvent(
                              userLanguage: userLanguage, userID: RegisterValueUserID, email: RegisterValueEmail));
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Center(
                      child: ButtonCustom(
                        label: "  ${_screenRegisterResponse?.body?.screeninfo?.btnconfirm}  ",
                        colortext: BC_ButtonText_style_Black,
                        colorbutton: BC_ButtonText_style_White,
                        sizetext: sizeTextBig20,
                        colorborder: BC_ButtonText_style_Black_Boarder,
                        sizeborder: 10,
                        onPressed: () {
                          context.read<RegisterBloc>().add(SubmitConfirmRegisterEvent(userLanguage: userLanguage,
                              email: RegisterValueEmail,
                              userID: RegisterValueUserID,
                              otp: confirmregisterOTPvalue));
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
}
