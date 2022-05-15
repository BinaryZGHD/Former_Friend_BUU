import 'package:f2fbuu/screens/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';


class screens_Forgot_Password extends StatefulWidget {
  const screens_Forgot_Password({Key? key}) : super(key: key);

  @override
  State<screens_Forgot_Password> createState() => _screens_Forgot_PasswordState();
}

class _screens_Forgot_PasswordState extends State<screens_Forgot_Password> {
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

                // Colors.yellow,
                Colors.pinkAccent,
                Colors.white,

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
                buildTextFieldUserID(),
                buildTextFieldEmail(),


                buildButtonComfirm(),

              ],
            ),
          ),
        ),
      ),
    );
  }
  Container buildButtonComfirm() {
    return Container(
      constraints: BoxConstraints.expand(height: 50),

      child: Text("Comfirm",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.black)
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.green[200]),
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.all(12),

    );
  }
  Container buildTextFieldEmail() {
    return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
            decoration: InputDecoration.collapsed(hintText: "Email"),
            style: TextStyle(fontSize: 18)));
  }

  Container buildTextFieldUserID() {
    return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
            obscureText: true,
            decoration: InputDecoration.collapsed(hintText: "UserID"),
            style: TextStyle(fontSize: 18)));
  }
}

