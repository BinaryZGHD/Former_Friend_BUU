import 'package:f2fbuu/customs/size/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../customs/button/box.dart';
import '../../../../customs/button/buildbuttoncustom.dart';
import '../../../../customs/button/buttoncustom.dart';
import '../../../../customs/color/colorconts.dart';
import '../../../../customs/textfile/buildtextfieldcustom.dart';
import '../../../../customs/textfile/buildtextfieldpasswordcustom.dart';
import '../../../../customs/textlink/textlinkscreencustom.dart';
import '../../bloc/loginbloc/login_bloc.dart';
import '../loginscreen/loginscreen.dart';


class SetForgotPasswordScreen extends StatelessWidget {
  const SetForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SetForgotPassword_ful();
  }
}
class SetForgotPassword_ful extends StatefulWidget {
  const SetForgotPassword_ful({Key? key}) : super(key: key);

  @override
  State<SetForgotPassword_ful> createState() => _SetForgotPassword_fulState();
}

class _SetForgotPassword_fulState extends State<SetForgotPassword_ful> {
  @override
  Widget build(BuildContext context) {
    TextEditingController Password = TextEditingController();
    TextEditingController Comfirm_Password = TextEditingController();
    TextEditingController OTP = TextEditingController();
    String password = "";
    String confirm_password = "";
    String otp = "";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back ,
            size: sizeTitle24,
            color: Colors.black,
          ),),
        title: Text(
          "Set new password",
          style: TextStyle(
            color: Colors.black,
            fontSize: sizeTitle24,
          ),
        ),
      ),
       body : SafeArea(
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
                        "Email",
                        style: TextStyle(
                          fontSize: sizeTextBig20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Text(
                        "Please confirm",
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
                    textEditingController: Password,
                    onChanged: (value) {
                      password = value;
                    },
                    hint_label: 'Password',


                  ),
                  buildTextFieldPasswordCustom(
                    textEditingController: Comfirm_Password,
                    onChanged: (value) {
                      confirm_password = value;
                    },
                    hint_label: 'Confirm password',


                  ),
                  buildTextFieldCustom(
                    textEditingController: OTP,
                    onChanged: (value) {
                      otp = value;
                    },
                    hint_label: 'OTP',textInputType: TextInputType.number,
                  ),

                  const Center(
                    child: TextLinkScreenCustom(

                      linklabel: 'Sent OTP again', mapscreen: box(), linktextcolor: TC_OTPSent, sizetext: sizeTextSmall16,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  const Center(

                    child: ButtonCustom(
                      label: "Confirm", screengo: LoginScreen(),colortext: TC_Black, colorbutton: BC_ButtonGreen,sizetext: sizeTextBig20,
                      // onPressed: () {context.read<LoginBloc>().add(LoginSummitEvent(users: "q", password:"q"));},
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

