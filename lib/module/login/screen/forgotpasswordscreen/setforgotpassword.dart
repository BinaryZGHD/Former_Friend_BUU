import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../customs/button/box.dart';
import '../../../../customs/button/buildbuttoncustom.dart';
import '../../../../customs/button/buttoncustom.dart';
import '../../../../customs/color/colorconts.dart';
import '../../../../customs/textfile/buildtextfieldcustom.dart';
import '../../../../customs/textfile/buildtextfieldpasswordcustom.dart';
import '../../../../customs/textlink/textlinkcustom.dart';
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
    TextEditingController userID = TextEditingController();
    TextEditingController email = TextEditingController();
    String uservalue = "";
    String emailvalue = "";
    return Material(
      child: Container(
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
                      "Set new password",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.05,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Text(
                      "OTP will sent to",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Text(
                      "Email",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Text(
                      "Please confirm",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                  ]),
                ),
                buildTextFieldPasswordCustom(
                  textEditingController: userID,
                  onChanged: (value) {
                    uservalue = value;
                  },
                  hint_label: 'Password',


                ),
                buildTextFieldPasswordCustom(
                  textEditingController: userID,
                  onChanged: (value) {
                    uservalue = value;
                  },
                  hint_label: 'Confirm Password',


                ),
                buildTextFieldCustom(
                  textEditingController: email,
                  onChanged: (value) {
                    emailvalue = value;
                  },
                  hint_label: 'OTP',
                ),

                const Center(
                  child: TextLinkCustom(

                    linklabel: 'Sent OTP again', mapscreen: box(), linkurl: '', linktextcolor: TC_regiter,
                  ),
                ),
                buildButtonCustom(
                  maptype: LoginScreen(), linklabel: '  NEXT  ', linkurl: '', mapscreen: '', mapdetailscreen: '',),
                Center(
                  child: ButtonCustom(
                    label: "  Login  ",
                    onPressed: () {
                      context.read<LoginBloc>().add(LoginSummitEvent(users: "q", password:"q"));
                      // print("User :"+user.value.text.toString() +"\n"+"Password :"+password.value.text.toString());
                      // print("User :" + userID + "\n" + "Password :" + passw);
                      // print(event.number);
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              ],
            ),
          )),
    );
  }
}

