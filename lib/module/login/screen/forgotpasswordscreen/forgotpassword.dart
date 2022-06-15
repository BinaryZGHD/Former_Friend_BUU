import 'package:f2fbuu/module/login/screen/forgotpasswordscreen/setforgotpassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../customs/button/buttoncustom.dart';
import '../../../../customs/color/colorconts.dart';
import '../../../../customs/size/size.dart';
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
            // size: MediaQuery.of(context).size.height * 0.05,
            size: sizeTitle24,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Forgot password",
          style: TextStyle(
            color: Colors.black,
            // fontSize: MediaQuery.of(context).size.height * 0.05,
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  buildTextFieldCustom(
                    textEditingController: userID,
                    onChanged: (value) {
                      uservalue = value;
                    },
                    hint_label: 'Student code / Teacher code',
                    textInputType: TextInputType.text,
                  ),
                  buildTextFieldCustom(
                    textEditingController: email,
                    onChanged: (value) {
                      emailvalue = value;
                    },
                    hint_label: 'Email',
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  const Center(
                    child: ButtonCustom(
                      label: "NEXT", screengo: SetForgotPasswordScreen(), colortext: TC_Black,
                      colorbutton: BC_ButtonGreen, sizetext: sizeTextBig20, colorborder: BSC_transparent,
                      // onPressed: () {context.read<LoginBloc>().add(LoginSummitEvent(users: "q", password:"q"));},
                    ),
                  ),
                  // buildButtonCustom(
                  //   maptype: SetForgotPasswordScreen(), linklabel: 'NEXT ', linkurl: '', mapdetailscreen: 'register', mapscreen: 'step2',),
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
