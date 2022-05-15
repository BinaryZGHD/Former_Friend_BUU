import 'package:f2fbuu/screens/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'condition_pdpa.dart';
import 'forgot_password.dart';
import 'home.dart';


class screens_Login extends StatefulWidget {
  const screens_Login({Key? key}) : super(key: key);

  @override
  State<screens_Login> createState() => _screens_LoginState();
}

class _screens_LoginState extends State<screens_Login> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
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
                Image.asset("assets/logo/Buu-logo11.png",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1 , ),
                buildTextFieldEmail(),
                buildTextFieldPassword(),
                buildButtonRegister_Forgot(),
                buildButtonSignIn(),

              ],
            ),
          ),
        ),
      ),
    );
  }
  Container buildButtonSignIn() {
    return Container(
        constraints: BoxConstraints.expand(height: 50),

        child: Text("Sign in",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.black)
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.green[200]),
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(12),

    );
  }
  Container buildButtonRegister_Forgot() {
    return Container(
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildButtonForgot(),
          buildButtonRegister(),

        ],
      ),
    );
  }
  // buildButtonRegister(){
  //   return Text("Register",
  //       style: TextStyle(decoration: TextDecoration.underline, color: Colors.black)
  //   );
  // }
  buildButtonRegister(){
    return GestureDetector(
      child: Text("Register", style: TextStyle(decoration: TextDecoration.underline, color: Colors.black)),
      onTap: () async {
        Navigator.push(context, MaterialPageRoute(builder: (context) => screens_Condition_PDPA()));
      },
    );
  }
  buildButtonForgot(){
    return GestureDetector(
      child: Text("Forgot Password", style: TextStyle(decoration: TextDecoration.underline, color: Colors.black)),
      onTap: () async {
        Navigator.push(context, MaterialPageRoute(builder: (context) => screens_Forgot_Password()));
      },
    );
  }
  Container buildTextFieldEmail() {
    return Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
            decoration: InputDecoration.collapsed(hintText: "Email"),
            style: TextStyle(fontSize: 18)));
  }

  Container buildTextFieldPassword() {
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
}

