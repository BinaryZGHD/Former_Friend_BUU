import 'package:f2fbuu/screens/condition_pdpa.dart';
import 'package:flutter/material.dart';


import '../constants/colorname.dart';
import 'forgot_password_send.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Widget _backButton() {
  //   return InkWell(
  //     onTap: () {
  //       Navigator.pop(context);
  //     },
  //     child: Container(
  //       padding: EdgeInsets.symmetric(horizontal: 10),
  //       child: Row(
  //         children: <Widget>[
  //           Container(
  //             padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
  //             child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
  //           ),
  //           Text('Back',
  //               style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _entryField(String title, {bool isPassword = false, required bool autofocus}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text(
          //   title,
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          // ),
          SizedBox(
            height: 10,
          ),
          TextField(
              autofocus: autofocus,
              obscureText: isPassword,
              decoration: InputDecoration(

                labelText: title  ,
                labelStyle: TextStyle(
                    color:  Colors.black
                ),
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: color_white,
                    width: 2.0,
                  ),
                ),
              )
          ),

        ],
      ),
    );
  }

  Widget _submitLoginButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 10,
                spreadRadius: 1)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xff645aaf), Color(0xff7b6cf6)])),
      child: Text(
        'Login',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => screens_Condition_PDPA()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'FORMER',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: color_box_2
          ),
          children: [
            TextSpan(
              text: 'FRIEND',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'BUU',
              style: TextStyle(color: color_box_1, fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Email id",autofocus: true),
        _entryField("Password", autofocus: false ,isPassword: true),
      ],
    );
  }

  Widget _Forgot_PasswordWidget() {
    return  Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.centerRight,
      child: GestureDetector(
        child: Text('Forgot Password ?',
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 14, fontWeight: FontWeight.w500)),
        onTap: () async {
          Navigator.push(context, MaterialPageRoute(builder: (context) => screens_Send_Forgot_Password()));
        },
      ),
    );
  }
  _BoxDecoration() {
    return BoxDecoration(
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
    );
  }
  @override
  Widget build(BuildContext context) {
    final heightscreen = MediaQuery.of(context).size.height;
    return Scaffold(

        body: Container(
          decoration:  _BoxDecoration(),
          height: heightscreen,
          child: Stack(
            children: <Widget>[
              // Positioned(
              //     top: -heightscreen * .15,
              //     right: -MediaQuery.of(context).size.width * .4,
              //     child: BezierContainer()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: heightscreen * .2),
                      _title(),
                      SizedBox(height: 50),
                      _emailPasswordWidget(),
                      SizedBox(height: 20),
                      _submitLoginButton(),

                      _Forgot_PasswordWidget(),
                      SizedBox(height: heightscreen * .055),
                      _createAccountLabel(),
                    ],
                  ),
                ),
              ),
              // Positioned(top: 40, left: 0, child: _backButton()),
            ],
          ),
        ));
  }
}
