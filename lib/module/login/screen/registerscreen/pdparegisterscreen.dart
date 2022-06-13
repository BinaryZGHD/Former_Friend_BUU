import 'package:f2fbuu/module/login/screen/loginscreen/loginscreen.dart';
import 'package:f2fbuu/module/login/screen/registerscreen/register.dart';
import 'package:f2fbuu/screens/login.dart';
import 'package:f2fbuu/screens/register_send.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class screens_Condition_PDPA extends StatefulWidget {
  const screens_Condition_PDPA({Key? key}) : super(key: key);

  @override
  State<screens_Condition_PDPA> createState() => _screens_Condition_PDPAState();
}

class _screens_Condition_PDPAState extends State<screens_Condition_PDPA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Image.asset("assets/logo/Buu-logo11.png",
                //   width: MediaQuery.of(context).size.width,
                //   height: MediaQuery.of(context).size.height * 0.3,
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                buildContainerTitle(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: Image.asset(
                    "assets/PDPA.png",
                    fit: BoxFit.fill,
                  ),
                ),
                buildButtonComfirm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildContainerTitle() {
    return Container(
      constraints: BoxConstraints.expand(height: 80),
      child: Text("Terms of Service  \n and Privacy Policy",
          textAlign: TextAlign.center, style: TextStyle(fontSize: 30, color: Colors.black)),
    );
  }

  Row buildButtonComfirm() {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.05,
        ),
        Expanded(
          child: GestureDetector(
            child: buildButtonComfirm2(width_Box: MediaQuery.of(context).size.width * 0.3, text_button: "ACCEPT",
              color_button:  Colors.green[200],
            ),
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
            },
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.05,
        ),
        Expanded(
          child: GestureDetector(
            child: buildButtonComfirm2(width_Box: MediaQuery.of(context).size.width * 0.3, text_button: "DECLINE",
              color_button:  Colors.red[200],
            ),
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.05,
        ),
      ],
    );
  }
}

Container buildButtonComfirm2({required double width_Box, required String text_button, required, Color? color_button }) {
  return Container(
    height: 50,
    width: width_Box,
    child: Text(text_button,
        textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.black)),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: color_button ?? Colors.white),
    margin: EdgeInsets.only(top: 16),
    padding: EdgeInsets.all(12),
  );
}
