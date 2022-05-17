import 'package:f2fbuu/screens/register_send.dart';
import 'package:f2fbuu/screens/forgot_password_set.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colorname.dart';
import 'home.dart';


class screens_Send_Forgot_Password extends StatefulWidget {
  const screens_Send_Forgot_Password({Key? key}) : super(key: key);

  @override
  State<screens_Send_Forgot_Password> createState() => _screens_Send_Forgot_PasswordState();
}

class _screens_Send_Forgot_PasswordState extends State<screens_Send_Forgot_Password> {
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
                buildTextFieldUserID_Send_Forgot(),
                buildTextFieldEmail_Send_Forgot(),
                buildButtonNext_Send_Forgot(),

              ],
            ),
          ),
        ),
      ),
    );
  }
  GestureDetector buildButtonNext_Send_Forgot() {
    return GestureDetector(
      child: Container(
        constraints: BoxConstraints.expand(height: 50),

        child: Text("Next",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.black)
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.green[200]),
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(12),


      ),
      onTap: () async {
        Navigator.push(context, MaterialPageRoute(builder: (context) => screens_Set_Forgot_Password()));
      },
    );

  }
  Container buildTextFieldUserID_Send_Forgot() {
    return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
            autofocus: true,
            decoration: InputDecoration.collapsed(hintText: "User ID"),
            style: TextStyle(fontSize: 18)));
  }
  Container buildTextFieldEmail_Send_Forgot() {
    return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
            decoration: InputDecoration.collapsed(hintText: "Email"),
            style: TextStyle(fontSize: 18)));
  }


}

