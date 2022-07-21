import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/customs/textfile/textfield_custom.dart';
import 'package:f2fbuu/module/login/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:f2fbuu/module/login/model/response/screen_forgot_password_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

forgotPasswordPageWidget(BuildContext context, ScreenForgotPasswordResponse? screenforgotpasswordResponse,
    TextEditingController emailController, TextEditingController userIDController) {
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
            "${screenforgotpasswordResponse?.body?.screeninfo?.titleforgot}",
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                TextFieldCustom(
                  textEditingController: userIDController,
                  onChanged: (valueUserID) {
                    userIDController.text = valueUserID;
                  },
                  hintLabel: "${screenforgotpasswordResponse?.body?.screeninfo?.edtIDforgot}",
                  textInputType: TextInputType.text,
                ),
                TextFieldCustom(
                  textEditingController: emailController,
                  onChanged: (valueEmail) {
                    emailController.text = valueEmail;
                  },
                  hintLabel: "${screenforgotpasswordResponse?.body?.screeninfo?.edtemailforgot}",
                  textInputType: TextInputType.text,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Center(
                  child: ButtonCustom(
                      label: "  ${screenforgotpasswordResponse?.body?.screeninfo?.btnforgotnext}  ",
                      colortext: tcButtonTextBlack,
                      colorbutton: tcButtonTextWhite,
                      sizetext: sizeTextBig20,
                      colorborder: tcButtonTextBoarder,
                      sizeborder: 10,
                      onPressed: () {
                        context.read<ForgorPasswordBloc>().add(SubmitForgotPasswordEvent(
                              userID: userIDController.text,
                              email: emailController.text,
                            ));
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
