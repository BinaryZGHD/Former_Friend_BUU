import 'package:f2fbuu/module/login/screen/forgotpasswordscreen/setnewforgotpassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../customs/button/buttoncustom.dart';
import '../../../../customs/color/colorconts.dart';
import '../../../../customs/dialog/dialogboxcutom.dart';
import '../../../../customs/dialog/texterror.dart';
import '../../../../customs/size/size.dart';
import '../../../../customs/textfile/buildtextfieldcustom.dart';

class ForgotPasswordScreen extends StatelessWidget {
  TextEditingController userID = TextEditingController();
  TextEditingController email = TextEditingController();

  String uservalue = " ";

  String emailvalue = " ";

  ForgotPasswordScreen({Key? key}) : super(key: key);

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
          "Forgot password",
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              buildTextFieldCustom(
                textEditingController: userID,
                onChangedtest: (value) {
                  uservalue = value;
                },
                hint_label: 'Student code / Teacher code',
                textInputType: TextInputType.text,
              ),
              buildTextFieldCustom(
                textEditingController: email,
                onChangedtest: (value) {
                  emailvalue = value;
                },
                hint_label: 'Email',
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Center(
                child: ButtonCustom(
                  label: "  NEXT  ",
                  screengo: SetNewForgotPasswordScreen(),
                  colortext: TC_Black,
                  colorbutton: BC_ButtonGreen,
                  sizetext: sizeTextBig20,
                  colorborder: BSC_transparent,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => CustomDialogBox(
                              id: '',
                              title: " ",
                              description: errforgotpasswordr1 + '\n \n ' + 'Do you want to continue?',
                              mapscreen: SetNewForgotPasswordScreen(),
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
