import 'package:f2fbuu/screens/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import '../constants/colorname.dart';
import '../customs/button/button.dart';
import 'condition_pdpa.dart';
import 'forgot_password_send.dart';
import 'home.dart';
import 'loginPage.dart';

class screens_Login extends StatefulWidget {
  const screens_Login({Key? key}) : super(key: key);

  @override
  State<screens_Login> createState() => _screens_LoginState();
}

class _screens_LoginState extends State<screens_Login> {
  TextEditingController user = TextEditingController();
  TextEditingController password = TextEditingController();
  String u = "";
  String p = "";
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    textEditingController.value.toString();
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        // decoration: buildBoxDecoration(),
        child: Stack(children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  buildImge(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  TextFormFieldCustom(hint_label: "Email",textEditingController: user,
                      onChanged: (value){
                        u = value;
                      },),
                  TextFormFieldCustom(hint_label: "Password",textEditingController: password,
                    onChanged: (value){
                      p = value;
                    }, ),

                  buildButtonSignIn(),
                  ButtonCustom(label: "Submit",onPressed: (){
                    // context.read<LoginBloc>().add(LoginsubmitEvent(userID: u, password: p));
                    // context.read<LoginBloc>().add(LoginsubmitEvent( userID:  u, password: '123456'));
                    // print("User :"+user.value.text.toString() +"\n"+"Password :"+password.value.text.toString());
                    print("User :"+u +"\n"+"Password :"+p);
                  },),

                  buildButtonRegister_Forgot(),
                  buildAccountLabel(),
                ],
              ),
            ),
          ),
          Positioned(top: 80, left: 0, child: _changeLanguage()),
        ]),
      ),
    );
  }

  Widget _changeLanguage() {
    return InkWell(
      // onTap: () {
      //   Navigator.pop(context);
      // },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            // Container(
            //   padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
            //   child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            // ),
            Text('TH / EN', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Container buildButtonSignIn() {
    return Container(
      constraints: BoxConstraints.expand(height: 50),
      child: GestureDetector(
          child: Text("Sign in", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.black)),
          onTap: () async {
            Navigator.push(context, MaterialPageRoute(builder: (context) => screens_Welcome()));
          }),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.green[200]),
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.all(12),
    );
  }
  // Container buildButtonSignIn() {
  //   return Container(
  //     constraints: BoxConstraints.expand(height: 50),
  //     child: GestureDetector(
  //         child: Text("Sign in", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.black)),
  //         onTap: () async {
  //           Navigator.push(context, MaterialPageRoute(builder: (context) => screens_Welcome()));
  //         }),
  //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.green[200]),
  //     margin: EdgeInsets.only(top: 16),
  //     padding: EdgeInsets.all(12),
  //   );
  // }

  Container buildButtonRegister_Forgot() {
    return Container(
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // buildButtonRegister(),

          buildButtonForgot(),
        ],
      ),
    );
  }


  buildButtonRegister() {
    return GestureDetector(
      child: Text("Register", style: TextStyle(decoration: TextDecoration.underline, color: Colors.black)),
      onTap: () async {
        Navigator.push(context, MaterialPageRoute(builder: (context) => screens_Condition_PDPA()));
      },
    );
  }

  buildButtonForgot() {
    return GestureDetector(
      child: Text("Forgot Password ?", style: TextStyle(decoration: TextDecoration.underline, color: Colors.black)),
      onTap: () async {
        Navigator.push(context, MaterialPageRoute(builder: (context) => screens_Send_Forgot_Password1()));
      },
    );
  }




  buildBoxDecoration() {
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
    ));
  }

  buildImge() {
    return Image.asset(
      "assets/logo/Buu-logo11.png",
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
    );
  }

  Widget buildAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => screens_Condition_PDPA()));
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
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
