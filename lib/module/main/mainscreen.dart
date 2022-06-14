import 'package:f2fbuu/module/login/screen/forgotpasswordscreen/setforgotpassword.dart';
import 'package:f2fbuu/module/login/screen/loginscreen/loginscreen.dart';
import 'package:f2fbuu/module/login/screen/registerscreen/registerscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../customs/button/box.dart';
import '../login/bloc/loginbloc/login_bloc.dart';
import '../login/screen/forgotpasswordscreen/forgotpassword.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Container();
    // return Scaffold(
    //     body: Container(
    //   margin: EdgeInsets.all(8),
    //   // alignment: Alignment.center,
    //   child: BlocBuilder<LoginBloc, LoginState>(
    //     builder: (context, mainState) {
    //       if (mainState is LoginStatusState) {
    //         if (mainState.statuscheck == true) {
    //           print("Login s ");
    //           return box();
    //         } else if (mainState.statuscheck == false) {
    //           print("Login f");
    //           return box();
    //         } else {
    //           return RegisterScreen();
    //         }
    //       } else if (mainState is LoginRegisterState) {
    //         if (mainState.regstatus == true) {
    //           print("object3");
    //           return LoginScreen();
    //         } else if (mainState.regstatus == false) {
    //           print("object3");
    //           return RegisterScreen();
    //         } else {
    //           print("object4");
    //           return box();
    //         }
    //       } else if (mainState is LoginForgotState) {
    //         if (mainState.regstatus == "F1") {
    //           print("F1");
    //           return ForgotPasswordScreen();
    //         } else {
    //           print("object4");
    //           return SetForgotPasswordScreen();
    //         }
    //       } else {
    //         print("main");
    //         return LoginScreen();
    //       }
    //     },
    //   ),
    // ));
  }
}
