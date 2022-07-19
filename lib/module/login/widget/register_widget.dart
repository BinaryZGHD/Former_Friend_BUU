import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/customs/textfile/buildtextfieldcustom.dart';
import 'package:f2fbuu/customs/textfile/buildtextfieldpasswordcustom.dart';
import 'package:f2fbuu/module/login/bloc/registerbloc/register_bloc.dart';
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
  TextEditingController confirmpasswordController,
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
          "${screenRegisterResponse?.body?.screeninfo?.titlereg}",
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
              BuildTextFieldCustom(
                textEditingController: userController,
                onChanged: (value) {
                  userController.text = value;
                },
                hintLabel: "${screenRegisterResponse?.body?.screeninfo?.edtIDreg}",
                textInputType: TextInputType.text,
              ),
              BuildTextFieldCustom(
                textEditingController: nameController,
                onChanged: (value) {
                  nameController.text = value;
                },
                hintLabel: "${screenRegisterResponse?.body?.screeninfo?.edtnamereg}",
                textInputType: TextInputType.text,
              ),
              BuildTextFieldCustom(
                textEditingController: lastnameController,
                onChanged: (value) {
                  lastnameController.text = value;
                },
                hintLabel: "${screenRegisterResponse?.body?.screeninfo?.edtlnamereg}",
                textInputType: TextInputType.text,
              ),
              BuildTextFieldCustom(
                textEditingController: emailController,
                onChanged: (value) {
                  emailController.text = value;
                },
                hintLabel: "${screenRegisterResponse?.body?.screeninfo?.edtemailreg}",
                textInputType: TextInputType.text,
              ),
              BuildTextFieldCustom(
                maxLengthOTP: 10,
                textEditingController: phoneController,
                onChanged: (value) {
                  phoneController.text = value;
                },
                hintLabel: "${screenRegisterResponse?.body?.screeninfo?.edtphonereg}",
                textInputType: TextInputType.number,
              ),


              buildTextFieldPasswordCustom(
                textEditingController: passwordController,
                onChanged: (value) {
                  passwordController.text = value;
                },
                hint_label: "${screenRegisterResponse?.body?.screeninfo?.edtpassreg}",
                textInputType: TextInputType.text,
              ),
              buildTextFieldPasswordCustom(
                textEditingController: confirmpasswordController,
                onChanged: (value) {
                  confirmpasswordController.text = value;
                },
                hint_label: "${screenRegisterResponse?.body?.screeninfo?.edtcpassreg}",
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
                      confirmPassword: confirmpasswordController.text,
                    ));

                    // context.read<RegisterBloc>().add(SubmitRegisterEvent(
                    //   userLanguage: userLanguage,
                    //   userID: uservalue,
                    //   phone: phonevalue,
                    //   emailRegister: emailvalue,
                    //   name: namevalue,
                    //   lastName: lastnamevalue,
                    //   password: passwordvalue,
                    //   confirmPassword: confirmpasswordvalue,
                    // ));
                  },
                  label: "  ${screenRegisterResponse?.body?.screeninfo?.edtsignup}  ",
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
