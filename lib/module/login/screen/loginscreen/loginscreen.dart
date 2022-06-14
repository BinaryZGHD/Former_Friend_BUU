import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../../customs/Imge/changimgetype.dart';
import '../../../../customs/button/buttoncustom.dart';
import '../../../../customs/color/colorconts.dart';
import '../../../../customs/size/size.dart';
import '../../../../customs/textfile/buildtextfieldcustom.dart';
import '../../../../customs/textfile/buildtextfieldpasswordcustom.dart';
import '../../../../customs/textlink/textlinkscreencustom.dart';
import '../../../../customs/textlink/textlinkforgotcustom.dart';

import '../../../home/screen/homescreen.dart';

import '../forgotpasswordscreen/forgotpassword.dart';
import '../registerscreen/pdparegisterscreen.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _FLoginScreen();
  }
}
class _FLoginScreen extends StatefulWidget {
  const _FLoginScreen({Key? key}) : super(key: key);

  @override
  State<_FLoginScreen> createState() => _FLoginScreenState();
}

class _FLoginScreenState extends State<_FLoginScreen> {
  TextEditingController user = TextEditingController();
  TextEditingController password = TextEditingController();
  String userID = "";
  String passw = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        // decoration: buildBoxDecoration(),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.language,
                          size: sizeText18,
                        ),
                        Text(
                          "TH / EN",
                          style: TextStyle(fontSize: sizeText18),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Center(
                        child: ChangeImageType(
                          urlimge_l:
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Buu-logo11.png/130px-Buu-logo11.png',
                        )),
                    // buildImge(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    buildTextFieldCustom(
                      textEditingController: user,
                      onChanged: (value) {
                        userID = value;
                      },
                      hint_label: 'Student code / Teacher code',textInputType: TextInputType.text,
                    ),
                    buildTextFieldPasswordCustom(
                      textEditingController: password,
                      onChanged: (value) {
                        passw = value;
                      },
                      hint_label: 'Password',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),

                    TextLinkForgotCustom(
                      // onPressed: () {
                      //   context.read<LoginBloc>().add(LoginForgotEvent(regstatus: "F1"));
                      //   // print("User :"+user.value.text.toString() +"\n"+"Password :"+password.value.text.toString());
                      //   // print("User :" + userID + "\n" + "Password :" + passw);
                      //   // print(event.number);
                      // },
                      linklabel: 'Forgot Password ?',
                      mapgo: ForgotPasswordScreen(),
                      linkurl: '',
                      linktextcolor: TC_forgot, sizetext: sizeTextSmaller14,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Center(
                      child: ButtonCustom(
                        label: "  Login  ", screengo: HomeScreen(),colortext: TC_Black, colorbutton: BC_ButtonGreen, sizetext: sizeTextBig20,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account ?  ',
                          style: TextStyle(fontSize: sizeTextSmall16, color: Colors.black, fontWeight: FontWeight.w300),
                        ),
                        TextLinkScreenCustom(
                          linklabel: 'Register',
                          mapscreen: screens_Condition_PDPA(),

                          linktextcolor: TC_regiter, sizetext:sizeTextSmall16,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
