import 'package:f2fbuu/module/home/screen/homescreen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f2fbuu/customs/Imge/changimgetype.dart';
import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/dialog/texterror.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/customs/textfile/buildtextfieldcustom.dart';
import 'package:f2fbuu/customs/textfile/buildtextfieldpasswordcustom.dart';
import 'package:f2fbuu/customs/textlink/textlinktoscreencustom.dart';
import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/module/login/model/response/screen_login_response.dart';
import 'package:f2fbuu/module/login/screen/forgotpasswordscreen/forgotpassword_screen.dart';
import 'package:f2fbuu/module/login/screen/registerscreen/pdparegister_screen.dart';

import 'package:f2fbuu/module/login/bloc/loginbloc/login_bloc.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> with ProgressDialog {
  ScreenLoginResponse? _screenLoginResponse;

  @override
  Widget build(BuildContext context) {
    TextEditingController userController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    String userID = "";
    String passw = "";

    context.read<LoginBloc>().add(LoginScreenInfoEvent());

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          showProgressDialog(context);
        }
        if (state is LoginEndLoading) {
          hideProgressDialog(context);
        }
        if (state is LoginError) {
          // show dialog error
          print(state.message);
        }
      },
      child: Scaffold(
        body: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
          if (state is LoginScreenInfoSuccessState) {
            _screenLoginResponse = state.response;
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.05,
                              ),
                              Icon(
                                Icons.language,
                                size: sizeText18,
                              ),
                              Text(
                                "${_screenLoginResponse?.body?.screeninfo?.btnchangelang}",
                                style: TextStyle(fontSize: sizeText18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Center(
                              child: ChangeImageType(
                            urlimge_l: "${_screenLoginResponse?.body?.screeninfo?.imglogo}",
                          )),
                          // buildImge(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                          buildTextFieldCustom(
                            textEditingController: userController,
                            onChanged: (value) {
                              userID = value;
                              print("userID  login == " + userID);
                            },
                            hint_label: "${_screenLoginResponse?.body?.screeninfo?.edtID}",
                            textInputType: TextInputType.text,
                          ),
                          buildTextFieldPasswordCustom(
                            textEditingController: passwordController,
                            onChanged: (value) {
                              passw = value;
                              print("passwordController login  == " + value);
                            },
                            hint_label: "${_screenLoginResponse?.body?.screeninfo?.edtpass}",
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),

                          TextLinkToScreenCustom(
                            // onPressed: () {
                            //   context.read<LoginBloc>().add(LoginForgotEvent(regstatus: "F1"));
                            //   // print("User :"+user.value.text.toString() +"\n"+"Password :"+password.value.text.toString());
                            //   // print("User :" + userID + "\n" + "Password :" + passw);
                            //   // print(event.number);
                            // },
                            linklabel: "${_screenLoginResponse?.body?.screeninfo?.btnforgotpass}",
                            mapscreen: forgotPasswordScreen(),
                            linktextcolor: TC_forgot,
                            sizetext: sizeTextSmaller14,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),

                          Center(
                            child: ButtonCustom(
                              onPressed: () {
                                dialogOneLineOneBtn(
                                    context, errloin + '\n \n ' + 'Do you want to continue?',
                                     "OK", onClickBtn: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      // int index = int.parse(widget.id);
                                      return HomeScreen();
                                    }),
                                  );
                                });

                                // dialogOneLineTwoBtn(
                                //     context,
                                //     errpdpadecline +
                                //         '\n \n ' +
                                //         'Do you want to continue?',
                                //     'Confirm',
                                //     'Cancel', onClickBtn: (String result) {
                                //   Navigator.of(context).pop();
                                //   switch (result) {
                                //     case 'Cancel':
                                //       {
                                //         break;
                                //       }
                                //     case 'OK':
                                //       {
                                //         Navigator.push(context,
                                //             MaterialPageRoute(builder:
                                //                 (BuildContext context) {
                                //           // int index = int.parse(widget.id);
                                //           return HomeScreen();
                                //           // DisplayBeerScreen();
                                //         }));
                                //       }
                                //   }
                                // });

                                // context.read<LoginBloc>().add(LoginScreenInfoEvent());
                                // showDialog(
                                //     context: context,
                                //     builder: (context) => CustomDialogBox(
                                //           onPressed: () {
                                //             Navigator.of(context).pop(); // dialog
                                //             Navigator.of(context).pop(); // login
                                //             Navigator.of(context).pop(); // login
                                //           },
                                //           id: '',
                                //           textfieldvalue: "userID  :" + userID + "\n" + "Password :" + passw,
                                //           description: errloin + '\n \n ' + 'Do you want to continue?',
                                //           mapscreen: HomeScreen(),
                                //         ));
                              },
                              label: "  ${_screenLoginResponse?.body?.screeninfo?.btnlogin}  ",
                              colortext: BC_ButtonText_style_Black,
                              colorbutton: BC_ButtonText_style_White,
                              sizetext: sizeTextBig20,
                              colorborder: BC_ButtonText_style_Black_Boarder,
                              sizeborder: 10,
                            ),
                          ),

                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${_screenLoginResponse?.body?.screeninfo?.textreg} ",
                                style: TextStyle(
                                    fontSize: sizeTextSmall16, color: Colors.black, fontWeight: FontWeight.w300),
                              ),
                              TextLinkToScreenCustom(
                                linklabel: "${_screenLoginResponse?.body?.screeninfo?.btnReg}",
                                mapscreen: conditionPDPAScreen(),
                                linktextcolor: TC_regiter,
                                sizetext: sizeTextSmall16,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
