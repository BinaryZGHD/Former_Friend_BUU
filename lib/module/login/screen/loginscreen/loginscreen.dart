import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../customs/Imge/changimgetype.dart';
import '../../../../customs/button/buttoncustom.dart';
import '../../../../customs/color/colorconts.dart';
import '../../../../customs/textfile/buildtextfieldcustom.dart';
import '../../../../customs/textfile/buildtextfieldpasswordcustom.dart';
import '../../../../customs/textlink/textlinkcustom.dart';
import '../../../../customs/textlink/textlinkforgotcustom.dart';
import '../../../../screens/condition_pdpa.dart';
import '../../bloc/loginbloc/login_bloc.dart';
import '../forgotpasswordscreen/forgotpassword.dart';
import '../registerscreen/register.dart';

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
                          size: 20,
                        ),
                        Text(
                          "TH / EN",
                          style: TextStyle(fontSize: 18),
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
                      hint_label: 'Email',
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
                      linklabel: 'Forgot Password?',
                      map: ForgotPasswordScreen(),
                      linkurl: '',
                      linktextcolor: TC_forgot,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Center(
                      child: ButtonCustom(
                        label: "  Login  ",
                        onPressed: () {print("object6666");
                          context.read<LoginBloc>().add(LoginSummitEvent(users: "q", password: "q"));
                          // print("User :"+user.value.text.toString() +"\n"+"Password :"+password.value.text.toString());
                          // print("User :" + userID + "\n" + "Password :" + passw);
                          // print(event.number);
                        },
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
                          style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w300),
                        ),
                        TextLinkCustom(
                          onPressed: () {
                            context.read<LoginBloc>().add(LoginRegisterEvent(regstatus: false));
                          },
                          linklabel: 'Regiter',
                          mapscreen: screens_Condition_PDPA(),
                          linkurl: '',
                          linktextcolor: TC_regiter,
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
