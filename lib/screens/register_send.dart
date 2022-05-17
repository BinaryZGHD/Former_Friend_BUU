import 'package:f2fbuu/screens/register_check.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colorname.dart';

class screens_Register_Send extends StatefulWidget {
  const screens_Register_Send({Key? key}) : super(key: key);

  @override
  State<screens_Register_Send> createState() => _screens_Register_SendState();
}

class _screens_Register_SendState extends State<screens_Register_Send> {
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
                buildTextFieldUserID_Register_Send(),
                buildTextFieldPhone_Register_Send(),
                buildTextFieldEmai_Register_Send(),
                buildTextFieldName_Register_Send(),
                buildTextFieldLastName_Register_Send(),
                buildTextFieldPassword_Register_Send(),
                buildTextFieldConfirmPassword_Register_Send(),
                buildButtonNext_Register_Send(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector buildButtonNext_Register_Send() {
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => screens_Register_Check()));
      },
    );

  }
  Container buildTextFieldUserID_Register_Send() {
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
  Container buildTextFieldPhone_Register_Send() {
    return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration.collapsed(hintText: "Phone"),
            style: TextStyle(fontSize: 18)));
  }
  Container buildTextFieldEmai_Register_Send() {
    return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
            decoration: InputDecoration.collapsed(hintText: "Email"),
            style: TextStyle(fontSize: 18)));
  }

  Container buildTextFieldName_Register_Send() {
    return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
            decoration: InputDecoration.collapsed(hintText: "Name"),
            style: TextStyle(fontSize: 18)));
  }
  Container buildTextFieldLastName_Register_Send() {
    return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
            decoration: InputDecoration.collapsed(hintText: "Last Name"),
            style: TextStyle(fontSize: 18)));
  }

  Container buildTextFieldPassword_Register_Send() {
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
  Container buildTextFieldConfirmPassword_Register_Send() {
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

