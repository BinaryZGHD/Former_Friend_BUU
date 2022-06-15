import 'package:f2fbuu/module/login/screen/loginscreen/loginscreen.dart';
import 'package:f2fbuu/module/login/screen/registerscreen/registerscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../customs/button/buildbuttoncustom.dart';
import '../../../../customs/button/buttoncustom.dart';
import '../../../../customs/color/colorconts.dart';
import '../../../../customs/dialog/texterror.dart';
import '../../../../customs/size/size.dart';
import '../../../../customs/textfile/buildtextfieldcustom.dart';
import '../../../../customs/textlink/textlinkotpcustom.dart';
import '../../../../customs/textlink/textlinkscreencustom.dart';

class RegisterConfirmScreen extends StatelessWidget {
  final VoidCallback? onPressed;
  const RegisterConfirmScreen({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RegisterConfirm_ful();
  }
}

class RegisterConfirm_ful extends StatefulWidget {
  const RegisterConfirm_ful({Key? key}) : super(key: key);

  @override
  State<RegisterConfirm_ful> createState() => _RegisterConfirm_fulState();
}

class _RegisterConfirm_fulState extends State<RegisterConfirm_ful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Confirm register",
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
                        "OTP will sent to",
                        style: TextStyle(
                          fontSize: sizeTextBig20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Text(
                        "EMAIL",
                        style: TextStyle(
                          fontSize: sizeTextBig20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Text(
                        "Please confirm",
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
                    // textEditingController: user,
                    // onChanged: (value) {
                    // uservalue = value;
                    // },
                    hint_label: 'OTP', textInputType: TextInputType.number,
                  ),
                  Center(
                    child: TextLinkOTPCustom(
                      linklabel: 'Sent OTP again',
                      mapscreen: RegisterScreen(),
                      linktextcolor: TC_OTPSent,
                      sizetext: sizeTextSmall16, tiltle: 'OTP sent to', description: 'Email',
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Center(
                    child: ButtonCustom(
                      label: "  Confirm  ",
                      screengo: LoginScreen(),
                      colortext: TC_Black,
                      colorbutton: BC_ButtonGreen,
                      sizetext: sizeTextBig20,
                      colorborder: BSC_transparent,error: errregidter2,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
