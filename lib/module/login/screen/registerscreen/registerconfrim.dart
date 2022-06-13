
import 'package:f2fbuu/module/login/screen/loginscreen/loginscreen.dart';
import 'package:f2fbuu/module/login/screen/registerscreen/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../customs/button/buildbuttoncustom.dart';
import '../../../../customs/color/colorconts.dart';
import '../../../../customs/textfile/buildtextfieldcustom.dart';
import '../../../../customs/textlink/textlinkcustom.dart';


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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Center(
                  child: Column(children: [
                    Text(
                      "OTP will sent to",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Text(
                      "EMAIL",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Text(
                      "Register Confirm",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.025,
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
                  hint_label: 'OTP',
                ),

                Center(
                  child: TextLinkCustom(

                    linklabel: 'Sent OTP again', mapscreen: RegisterScreen(), linkurl: '', linktextcolor: TC_regiter,
                  ),
                ),
                 const buildButtonCustom(
                  maptype: LoginScreen(), linklabel: 'Confirm ', linkurl: '', mapscreen: 'register', mapdetailscreen: 'step2',),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              ],
            ),
          )),
    );
  }
}
