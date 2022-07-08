import 'package:f2fbuu/module/home/screen/homescreen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:shared_preferences/shared_preferences.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> with ProgressDialog {
  ScreenLoginResponse? _screenLoginResponse;
  // SunmitLoginResponse? _loginSubmitResponse;
  late bool statusLoginSubmit ;
  bool _isDefaultLanguage = true;
  late String valueLanguage;
  String userLanguage = "TH";
  @override
  void initState() {
    super.initState();
    valueLanguage = "TH";
    context.read<LoginBloc>().add(LoginScreenInfoEvent(userLanguage: valueLanguage));
  }

  void _toggleLanguageView() async {
    setState(
      () {
        _isDefaultLanguage = !_isDefaultLanguage;
        valueLanguage = _isDefaultLanguage ? "TH" : "EN";
        context.read<LoginBloc>().add(OnClickLanguageEvent(userLanguage: valueLanguage));
      },
    );
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userLanguage', "$valueLanguage");
    setState(() {
      userLanguage = prefs.getString('userLanguage') ?? 'TH';
      print(" value is $userLanguage");
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(listener: (context, state) {
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
        child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        if (state is LoginScreenInfoSuccessState) {
        _screenLoginResponse = state.response;
        return buildContent(context);
      } else if (state is OnClickLanguageLoginScreenInfoSuccessState) {
        _screenLoginResponse = state.responseLoginscreen;
        return buildContent(context);
      }
      return Scaffold(body: Container());
    }
    ),


    );
  }

  buildContent(
    BuildContext context,
  ) {
    TextEditingController userController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    String userID = "";
    String password = "";

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: GestureDetector(
                          onTap: _toggleLanguageView,
                          child: Row(
                            children: [
                              Icon(
                                Icons.language,
                                color: Colors.black,
                                size: 18,
                              ),
                              Text("  ${_screenLoginResponse?.body?.screeninfo?.btnChangeLang}",
                                  style: TextStyle(
                                      // decoration: TextDecoration.underline,
                                      color: Colors.black,
                                      // decorationColor: linktextcolor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14)),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Center(
                      child: _screenLoginResponse?.body?.screeninfo?.imgLogo != null
                          ? CircleAvatar(
                              radius: 80.0,
                              backgroundImage: NetworkImage("${_screenLoginResponse?.body?.screeninfo?.imgLogo}"),
                            )
                          : CircleAvatar(
                              radius: 80,
                              backgroundImage: AssetImage(
                                'assets/logo/Buulogo.png',
                              ),
                              // ChangeImageType(
                              //   urlimge_l: "${_screenLoginResponse?.body?.screeninfo?.imgLogo}" ,
                              //   // urlimge_l:
                              //   //     "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Buu-logo11.png/130px-Buu-logo11.png",
                              // )),
                              // buildImge(),
                            ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    buildTextFieldCustom(
                      textEditingController: userController,
                      onChanged: (valueuserID) {
                        userID = valueuserID;
                        print("userID  login == " + userID);
                      },
                      hint_label: "${_screenLoginResponse?.body?.screeninfo?.edtID}",
                      textInputType: TextInputType.text,
                    ),
                    buildTextFieldPasswordCustom(
                      textEditingController: passwordController,
                      onChanged: (valuepassword) {
                        password = valuepassword;
                        print("passwordController login  == " + password);
                      },
                      hint_label: "${_screenLoginResponse?.body?.screeninfo?.edtPass}",
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextLinkToScreenCustom(
                        // onPressed: () {
                        //   context.read<LoginBloc>().add(LoginForgotEvent(regstatus: "F1"));
                        //   // print("User :"+user.value.text.toString() +"\n"+"Password :"+password.value.text.toString());
                        //   // print("User :" + userID + "\n" + "Password :" + passw);
                        //   // print(event.number);
                        // },
                        linklabel: "${_screenLoginResponse?.body?.screeninfo?.btnForgotPass}" + " ? ",
                        mapscreen: forgotPasswordScreen(),
                        linktextcolor: TC_forgot,
                        sizetext: sizeTextSmaller14,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
          //context.read<LoginBloc>().add(LoginSubmitEvent( userID: userID,password: passw,));
                    Center(
                      child: ButtonCustom(
                        onPressed: () {
                          signIn(userID, password);


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
                        label:
                        "  ${_screenLoginResponse?.body?.screeninfo?.btnLogin}  ",
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
                          "${_screenLoginResponse?.body?.screeninfo?.textReg}" + " ? ",
                          style: TextStyle(fontSize: sizeTextSmall16, color: Colors.black, fontWeight: FontWeight.w300),
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
      ),
    );
  }

   signIn(String userID, String password) {
     // context.read<LoginBloc>().add(LoginSubmitEvent( userID: userID,password: password,));
     dialogOneLineOneBtn(
         context,
         errloin +
             '\n \n ' +
             'Do you want to continue?',
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

   }
}
