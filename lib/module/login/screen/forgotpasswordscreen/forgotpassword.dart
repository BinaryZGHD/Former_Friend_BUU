

import 'package:f2fbuu/module/login/screen/forgotpasswordscreen/setforgotpassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../customs/button/buildbuttoncustom.dart';
import '../../../../customs/textfile/buildtextfieldcustom.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return _FForgotPassword();
  }
}

class _FForgotPassword extends StatefulWidget {
  const _FForgotPassword({Key? key}) : super(key: key);

  @override
  State<_FForgotPassword> createState() => _FForgotPasswordState();
}

class _FForgotPasswordState extends State<_FForgotPassword> {
  @override
  Widget build(BuildContext context) {
    TextEditingController userID = TextEditingController();
    TextEditingController email = TextEditingController();
    String uservalue = "";
    String emailvalue = "";
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Icon(
                Icons.arrow_back ,
                size: MediaQuery.of(context).size.height * 0.08,
                color: Colors.black,

              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.1,
              // ),
              Center(
                child: Column(children: [
                  Text(
                    "Forgot password",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.05,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                ]),
              ),
              buildTextFieldCustom(
                textEditingController: userID,
                onChanged: (value) {
                  uservalue = value;
                },
                hint_label: 'Student code / Teacher code',
              ),
              buildTextFieldCustom(
                textEditingController: email,
                onChanged: (value) {
                  emailvalue = value;
                },
                hint_label: 'Email',
              ),


              buildButtonCustom(
                maptype: SetForgotPasswordScreen(), linklabel: 'NEXT ', linkurl: '', mapdetailscreen: 'register', mapscreen: 'step2',),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
            ],
          ),
        ));
  }
}
