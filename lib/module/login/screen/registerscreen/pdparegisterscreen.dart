import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/module/login/screen/loginscreen/loginscreen.dart';
import 'package:f2fbuu/module/login/screen/registerscreen/registerscreen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../customs/button/buttoncustom.dart';
import '../../../../customs/dialog/texterror.dart';
import '../../../../customs/size/size.dart';

class screens_Condition_PDPA extends StatefulWidget {
  const screens_Condition_PDPA({Key? key}) : super(key: key);

  @override
  State<screens_Condition_PDPA> createState() => _screens_Condition_PDPAState();
}

class _screens_Condition_PDPAState extends State<screens_Condition_PDPA> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                buildContainerTitle(),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/PDPA.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                // buildButtonComfirm(),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.08,
                    ),
                    Expanded(
                        child: ButtonCustom(
                      label: 'ACCEPT',
                      screengo: RegisterScreen(),
                      colortext: TC_Black,
                      colorbutton: BC_ButtonGreen,
                      sizetext: sizeTextBig20,
                      colorborder: BSC_transparent,error: errpdpaaccept,
                    )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Expanded(
                        child: ButtonCustom(
                      label: 'DECLINE',
                      screengo: LoginScreen(),
                      colortext: TC_Black,
                      colorbutton: BC_ButtonRed,
                      sizetext: sizeTextBig20,
                      colorborder: BSC_transparent,error: errpdpadecline,
                    )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.08,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildContainerTitle() {
    return Container(
      constraints: BoxConstraints.expand(height: 50),
      child: Text("Terms of Service and Privacy Policy",
          textAlign: TextAlign.center, style: TextStyle(fontSize: sizeTitle24, color: Colors.black)),
    );
  }
}
