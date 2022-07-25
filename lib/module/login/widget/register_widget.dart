import 'package:f2fbuu/customs/button/button_custom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/message/text_message.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/customs/text_file/text_field_custom.dart';
import 'package:f2fbuu/customs/text_file/text_field_password_custom.dart';
import 'package:f2fbuu/module/login/bloc/register_bloc/register_bloc.dart';
import 'package:f2fbuu/module/login/model/response/screen_register_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

registerPageWidget(
  BuildContext context,
  ScreenRegisterResponse? screenRegisterResponse,
  TextEditingController userController,
  TextEditingController phoneController,
  TextEditingController emailController,
  TextEditingController nameController,
  TextEditingController lastnameController,
  TextEditingController passwordController,
  TextEditingController confirmPasswordController,
) {
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
          screenRegisterResponse?.body?.screeninfo?.titlereg?? registerTitleRegister,
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
                textEditingController: userController,
                onChanged: (value) {
                  userController.text = value;
                },
                hintLabel: screenRegisterResponse?.body?.screeninfo?.edtIDreg?? registerEdtIDRegister,
                textInputType: TextInputType.text,
              ),
              TextFieldCustom(
                textEditingController: nameController,
                onChanged: (value) {
                  nameController.text = value;
                },
                hintLabel: screenRegisterResponse?.body?.screeninfo?.edtnamereg?? registerEdtNameRegister,
                textInputType: TextInputType.text,
              ),
              TextFieldCustom(
                textEditingController: lastnameController,
                onChanged: (value) {
                  lastnameController.text = value;
                },
                hintLabel: screenRegisterResponse?.body?.screeninfo?.edtlnamereg?? registerEdtLastNameRegister,
                textInputType: TextInputType.text,
              ),
              TextFieldCustom(
                textEditingController: emailController,
                onChanged: (value) {
                  emailController.text = value;
                },
                hintLabel: screenRegisterResponse?.body?.screeninfo?.edtemailreg?? registerEdtEmailRegister,
                textInputType: TextInputType.text,
              ),
              TextFieldCustom(
                maxLengthOTP: 10,
                textEditingController: phoneController,
                onChanged: (value) {
                  phoneController.text = value;
                },
                hintLabel: screenRegisterResponse?.body?.screeninfo?.edtphonereg?? registerEdtPhoneRegister,
                textInputType: TextInputType.number,
              ),


              TextFieldPasswordCustom(
                textEditingController: passwordController,
                onChanged: (value) {
                  passwordController.text = value;
                },
                hintLabel: screenRegisterResponse?.body?.screeninfo?.edtpassreg?? registerEdtPasswordRegister,
                textInputType: TextInputType.text,
              ),
              TextFieldPasswordCustom(
                textEditingController: confirmPasswordController,
                onChanged: (value) {
                  confirmPasswordController.text = value;
                },
                hintLabel: screenRegisterResponse?.body?.screeninfo?.edtcpassreg?? registerEdtConfirmPasswordRegister,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Center(
                child: ButtonCustom(
                  onPressed: () {
                    BlocProvider.of<RegisterBloc>(context)
                        // ..isFetching = true
                        .add(SubmitRegisterEvent(
                      userID: userController.text,
                      phone: phoneController.text,
                      emailRegister: emailController.text,
                      name: nameController.text,
                      lastName: lastnameController.text,
                      password: passwordController.text,
                      confirmPassword: confirmPasswordController.text,
                    ));

                  },
                  label: screenRegisterResponse?.body?.screeninfo?.edtsignup?? registerEdtSignup,
                  colortext: tcButtonTextBlack,
                  colorbutton: tcButtonTextWhite,
                  sizetext: sizeTextBig20,
                  colorborder: tcButtonTextBoarder,
                  sizeborder: 10,
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
