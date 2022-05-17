
import 'package:flutter/material.dart';

import '../constants/colorname.dart';




class screens_Home extends StatefulWidget {
  const screens_Home({Key? key}) : super(key: key);

  @override
  State<screens_Home> createState() => _screens_HomeState();
}

class _screens_HomeState extends State<screens_Home> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            children: [
              Image.asset(
                "assets/logo/Buu-logo11.png",
                width: MediaQuery.of(context).size.width*0.1,
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.1,
              ),
              Text("Buu",style: TextStyle(color: color_white,fontSize: 20),),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.1,
              ),
              Text("Home",style: TextStyle(color: color_white,fontSize: 20),),
            ],
          ),
        ),
      ),


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
          padding: const EdgeInsets.fromLTRB(10, 1, 10, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width *0.9,
                  ),
                ),
                // Image.asset("assets/logo/Buu-logo11.png",
                //   width: MediaQuery.of(context).size.width,
                //   height: MediaQuery.of(context).size.height * 0.3,
                // ),
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
            style: TextStyle(fontSize: 18, color: Colors.black)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.green[200]),
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(12));
  }
  Container buildButtonRegister_Forgot() {
    return Container(
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildButtonRegister(),
          buildButtonForgot(),
        ],
      ),
    );
  }
  buildButtonRegister(){
    return Text("Register");
  }
  buildButtonForgot(){
    return Text("Forgot password");
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
