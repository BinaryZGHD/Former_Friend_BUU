import 'package:f2fbuu/module/login/screen/loginscreen/loginscreen.dart';
import 'package:f2fbuu/module/login/screen/registerscreen/registerconfrim.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../customs/button/box.dart';
import '../../../../customs/button/buildbuttoncustom.dart';
import '../../../../customs/button/buttoncustom.dart';
import '../../../../customs/color/colorconts.dart';
import '../../../../customs/dialog/dialogboxcutom.dart';
import '../../../../customs/dialog/texterror.dart';
import '../../../../customs/size/size.dart';
import '../../../../customs/textfile/buildtextfieldcustom.dart';
import '../../../../customs/textfile/buildtextfieldpasswordcustom.dart';
import '../../../../customs/textlink/textlinkotpcustom.dart';
import '../../../../customs/textlink/textlinktoscreencustom.dart';

class setNewForgotPasswordScreen extends StatefulWidget {
  //
  final String textheadsetnewpassword;
  final String textotpwillsent;
  final String edtemailforgot;
  final String edtpassword;
  final String edtcpassword;
  final String otp;
  final String texpleaseconfirm;
  final String btnsentotpagain;
  final String btnconfirm;

  setNewForgotPasswordScreen({
    Key? key,
    required this.textheadsetnewpassword,
    required this.textotpwillsent,
    required this.edtemailforgot,
    required this.edtpassword,
    required this.edtcpassword,
    required this.otp,
    required this.texpleaseconfirm,
    required this.btnsentotpagain,
    required this.btnconfirm,
  }) : super(key: key);

  @override
  State<setNewForgotPasswordScreen> createState() => _setNewForgotPasswordScreenState();
}

class _setNewForgotPasswordScreenState extends State<setNewForgotPasswordScreen> {

  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController code = TextEditingController();

  String passwordvalue = "";
  String confirmpasswordvalue = "";
  String codevalue = " ";
  @override
  Widget build(BuildContext context) {
    print((widget.textheadsetnewpassword));
    print((widget.textotpwillsent));
    print((widget.edtemailforgot));
    print((widget.edtpassword));
    print((widget.edtcpassword));
    print((widget.otp));
    print((widget.texpleaseconfirm));
    print((widget.btnsentotpagain));
    print((widget.btnconfirm));

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
        title: Text(widget.textheadsetnewpassword ,
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
                  Text(widget.textotpwillsent ,
                    style: TextStyle(
                      fontSize: sizeTextBig20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Text(widget.edtemailforgot ,
                    style: TextStyle(
                      fontSize: sizeTextBig20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Text(widget.texpleaseconfirm,
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
                hint_label: widget.edtpassword,
              ),
              buildTextFieldPasswordCustom(
                textEditingController: confirmpassword,
                onChanged: (value) {
                  confirmpasswordvalue = value;
                },
                hint_label: widget.edtcpassword,
              ),
              buildTextFieldCustom(
                textEditingController: code,
                onChanged: (value) {
                  codevalue = value;
                },
                hint_label: widget.otp,
                textInputType: TextInputType.number,
              ),
               Center(
                child: TextLinkOTPCustom(
                  linklabel: widget.btnsentotpagain,
                  mapscreen: box(),
                  linktextcolor: TC_OTPSent,
                  sizetext: sizeTextSmall16,
                  tiltle: widget.textotpwillsent ,
                  description: widget.edtemailforgot,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Center(
                child: ButtonCustom(
                  label: "  ${widget.btnconfirm}  ",
                  colortext: TC_Black,
                  colorbutton: BC_ButtonGreen,
                  sizetext: sizeTextBig20,
                  colorborder: BSC_transparent,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => CustomDialogBox(
                              id: '',
                              textfieldvalue: "Password  : $passwordvalue" +
                                  "\n" +
                                  "Confirm password : $confirmpasswordvalue" +
                                  "\n" +
                                  "OTP : $codevalue",
                              description: errforgotpasswordr2 + '\n \n ' + 'Do you want to continue?',
                              mapscreen: loginScreen(),
                            ));
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
    );
  }
}
