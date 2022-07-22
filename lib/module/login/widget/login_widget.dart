import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/customs/textfile/textfield_custom.dart';
import 'package:f2fbuu/customs/textfile/textfield_password_custom.dart';
import 'package:f2fbuu/customs/textlink/textlink_to_screen_custom.dart';
import 'package:f2fbuu/module/login/bloc/login_bloc/login_bloc.dart';
import 'package:f2fbuu/module/login/model/response/screen_login_response.dart';
import 'package:f2fbuu/module/login/screen/forgot_password_screen/forgot_password_screen.dart';
import 'package:f2fbuu/module/login/screen/register_screen/pdpa_register_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

loginPageWidget(BuildContext context, ScreenLoginResponse? screenLoginResponse, TextEditingController userController,
    TextEditingController passwordController,
    {required Null Function() onClickBtnLanguageView}) {
  void _handleClickBtnLanguageView() {
    onClickBtnLanguageView();
  }

  return WillPopScope(
    onWillPop: () async {
      return false;
    },
    child: Scaffold(
      // backgroundColor: Colors.transparent,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 20),
                      child: Row (
                        children: [
                          GestureDetector(
                              onTap: () => {_handleClickBtnLanguageView()},
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.language,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                                  Text("  ${screenLoginResponse?.body?.screeninfo?.btnChangeLang}",
                                      style: const TextStyle(
                                        // decoration: TextDecoration.underline,
                                          color: Colors.black,
                                          // decorationColor: linktextcolor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14)),
                                ],
                              )),
                        ],
                      ),


                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Center(
                      child: screenLoginResponse?.body?.screeninfo?.imgLogo != null
                          ? CircleAvatar(
                              radius: 80.0,
                              backgroundImage: NetworkImage("${screenLoginResponse?.body?.screeninfo?.imgLogo}"),
                            )
                          : const CircleAvatar(
                              radius: 80,
                              backgroundImage: AssetImage(
                                'assets/logo/Buulogo.png',
                              ),
                            ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldCustom(
                      textEditingController: userController,
                      onChanged: (valueuserID) {
                        userController.text = valueuserID;
                        if (kDebugMode) {
                          print("userController  login == ${userController.text}");
                        }
                      },
                      hintLabel: "${screenLoginResponse?.body?.screeninfo?.edtID}",
                      textInputType: TextInputType.text,
                    ),
                    TextFieldPasswordCustom(
                      textEditingController: passwordController,
                      onChanged: (valuepassword) {
                        passwordController.text = valuepassword;
                        if (kDebugMode) {
                          print("passwordController login  == ${passwordController.text}");
                        }
                      },
                      hintLabel: "${screenLoginResponse?.body?.screeninfo?.edtPass}",
                      textInputType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextLinkToScreenCustom(
                          linklabel: "${screenLoginResponse?.body?.screeninfo?.btnForgotPass}" " ? ",
                          linktextcolor: tcForgot,
                          sizetext: sizeTextSmaller14,
                          onTap: () async {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //
                    Center(
                      child: ButtonCustom(
                        onPressed: () {
                          context.read<LoginBloc>().add(LoginSubmitEvent(
                                userID: userController.text.isEmpty ? "demo":userController.text  ,
                                password: passwordController.text.isEmpty ? "demo": passwordController.text
                              ));
                        },
                        label: "  ${screenLoginResponse?.body?.screeninfo?.btnLogin}  ",
                        colortext: tcButtonTextBlack,
                        colorbutton: tcButtonTextWhite,
                        sizetext: sizeTextBig20,
                        colorborder: tcButtonTextBoarder,
                        sizeborder: 10,
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${screenLoginResponse?.body?.screeninfo?.textReg}" " ? ",
                          style: const TextStyle(
                              fontSize: sizeTextSmall16, color: Colors.black, fontWeight: FontWeight.w300),
                        ),
                        TextLinkToScreenCustom(
                            linklabel: "${screenLoginResponse?.body?.screeninfo?.btnReg}",
                            linktextcolor: tcRegiter,
                            sizetext: sizeTextSmall16,
                            onTap: () async {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => const ConditionPDPAScreen()));
                            }),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                  ],
                ),
              ),
            )),
      ),
    ),
  );
}
