import 'package:f2fbuu/screens/login.dart';
import 'package:f2fbuu/screens/register_check.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colorname.dart';

class screens_Register_Check extends StatefulWidget {
  const screens_Register_Check({Key? key}) : super(key: key);

  @override
  State<screens_Register_Check> createState() => _screens_Register_CheckState();
}

class _screens_Register_CheckState extends State<screens_Register_Check> {
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
                buildTextFieldCode2FA_Register_Check(),
                buildButtonConfrim_Register_Check(),

              ],
            ),
          ),
        ),
      ),
    );
  }
  GestureDetector buildButtonConfrim_Register_Check() {
    return GestureDetector(
      child: Container(
        constraints: BoxConstraints.expand(height: 50),

        child: Text("Confrim",
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
  Container buildTextFieldCode2FA_Register_Check() {
    return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
            obscureText: true,
            decoration: InputDecoration.collapsed(hintText: "Code"),
            style: TextStyle(fontSize: 18)));
  }

}

