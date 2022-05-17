import 'package:f2fbuu/screens/register_send.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colorname.dart';
import 'home.dart';
import 'login.dart';


class screens_Set_Forgot_Password extends StatefulWidget {
  const screens_Set_Forgot_Password({Key? key}) : super(key: key);

  @override
  State<screens_Set_Forgot_Password> createState() => _screens_Set_Forgot_PasswordState();
}

class _screens_Set_Forgot_PasswordState extends State<screens_Set_Forgot_Password> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                // 0.1,
                0.1,
                1.0,
              ],
              colors: [
                color_background_1,
                color_background_2,


              ],
            )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Image.asset("assets/logo/Buu-logo11.png",
                //   width: MediaQuery.of(context).size.width,
                //   height: MediaQuery.of(context).size.height * 0.3,
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1 , ),
                buildTextFieldCode2FA(),

                buildTextFieldPassword_Forgot(),
                buildTextFieldConfirmPassword_Forgot(),


                buildButtonComfirm(),

              ],
            ),
          ),
        ),
      ),
    );
  }





  GestureDetector buildButtonComfirm() {
    return GestureDetector(
      child: Container(
        constraints: BoxConstraints.expand(height: 50),

        child: Text("Comfirm",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.black)
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.green[200]),
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(12),

      ),
      onTap: () async {
        Navigator.push(context, MaterialPageRoute(builder: (context) => screens_Login()));
      },
    );
  }
  Container buildTextFieldCode2FA() {
    return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
            keyboardType: TextInputType.number,
            autofocus: true,
            decoration: InputDecoration.collapsed(hintText: "Code"),
            style: TextStyle(fontSize: 18)));
  }

  Container buildTextFieldPassword_Forgot() {
    return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
            obscureText: true,
            decoration: InputDecoration.collapsed(hintText: "Password"),
            style: TextStyle(fontSize: 18)));
  }
  Container buildTextFieldConfirmPassword_Forgot() {
    return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
            obscureText: true,
            decoration: InputDecoration.collapsed(hintText: "Confirm Password"),
            style: TextStyle(fontSize: 18)));
  }
}

