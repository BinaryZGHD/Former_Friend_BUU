import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/dialog/texterror.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/customs/textfile/buildtextfieldcustom.dart';
import 'package:f2fbuu/customs/textfile/buildtextfieldpasswordcustom.dart';
import 'package:f2fbuu/customs/textlink/textlinkotpcustom.dart';
import 'package:f2fbuu/module/login/model/response/screen_forgotpassword_response.dart';
import 'package:f2fbuu/module/login/screen/loginscreen/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class setNewForgotPasswordScreen extends StatefulWidget {

  final ScreenForgotPasswordResponse? screenforgotpasswordResponse;

   setNewForgotPasswordScreen( {
    Key? key, this.screenforgotpasswordResponse,

  }) : super(key: key);

  @override
  State<setNewForgotPasswordScreen> createState() => _setNewForgotPasswordScreenState();
}

class _setNewForgotPasswordScreenState extends State<setNewForgotPasswordScreen> {
  late final ScreenForgotPasswordResponse? _screenforgotpasswordResponse;
  late final String textheadsetnewpassword;
  late final String textotpwillsent;
  late final String edtemailforgot;
  late final String edtpassword;
  late final String edtcpassword;
  late final String otp;
  late final String texpleaseconfirm;
  late final String btnsentotpagain;
  late final String btnconfirm;
  @override
  void initState() {
    super.initState();
    _screenforgotpasswordResponse = widget.screenforgotpasswordResponse;
    textheadsetnewpassword= "${_screenforgotpasswordResponse?.body?.screeninfo?.textheadsetnewpass}";
    textotpwillsent="${_screenforgotpasswordResponse?.body?.screeninfo?.textotpwillsent}";
    edtemailforgot= "${_screenforgotpasswordResponse?.body?.screeninfo?.edtemailforgot}";
    edtpassword= "${_screenforgotpasswordResponse?.body?.screeninfo?.edtpass}";
    edtcpassword= "${_screenforgotpasswordResponse?.body?.screeninfo?.edtcpass}";
    otp= "${_screenforgotpasswordResponse?.body?.screeninfo?.otp}";
    texpleaseconfirm="${_screenforgotpasswordResponse?.body?.screeninfo?.texpleaseconfirm}";
    btnsentotpagain="${_screenforgotpasswordResponse?.body?.screeninfo?.btnsentotpagain}";
    btnconfirm= "${_screenforgotpasswordResponse?.body?.screeninfo?.btnconfirm}";
  }

  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController code = TextEditingController();

  String passwordvalue = "";
  String confirmpasswordvalue = "";
  String codevalue = " ";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: sizeTitle24,
              color: Colors.black,
            ),
          ),
          title: Text(
            textheadsetnewpassword,
            style: TextStyle(
              color: Colors.black,
              fontSize: sizeTitle24,
            ),
          ),
        ),
        body: SafeArea(
          // height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Column(children: [
                    Text(
                      textotpwillsent,
                      style: TextStyle(
                        fontSize: sizeTextBig20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Text(
                      edtemailforgot,
                      style: TextStyle(
                        fontSize: sizeTextBig20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Text(
                      texpleaseconfirm,
                      style: TextStyle(
                        fontSize: sizeTextBig20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                  ]),
                ),
                buildTextFieldPasswordCustom(
                  textEditingController: password,
                  onChanged: (value) {
                    passwordvalue = value;
                  },
                  hint_label:edtpassword,
                  textInputType: TextInputType.text,
                ),
                buildTextFieldPasswordCustom(
                  textEditingController: confirmpassword,
                  onChanged: (value) {
                    confirmpasswordvalue = value;
                  },
                  hint_label:edtcpassword,
                  textInputType: TextInputType.text,
                ),
                buildTextFieldCustom(
                  textEditingController: code,
                  onChanged: (value) {
                    codevalue = value;
                  },
                  hint_label:otp,
                  textInputType: TextInputType.number,
                ),
                Center(
                  child: textSentOTPCustom(
                    textlabel:btnsentotpagain,

                    textcolor: TC_OTPSent,
                    sizetext: sizeTextSmall16,
                    onTap: () {
                      dialogOneLineOneBtn(context, errregidter2 + '\n \n ' + 'Do you want to continue?', "OK",
                          onClickBtn: () {
                            Navigator.of(context).pop();
                          });
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Center(
                  child: ButtonCustom(
                    label: "  ${btnconfirm}  ",
                    colortext: BC_ButtonText_style_Black,
                    colorbutton: BC_ButtonText_style_White,
                    sizetext: sizeTextBig20,
                    colorborder: BC_ButtonText_style_Black_Boarder,
                    sizeborder: 10,
                    onPressed: () {
                      dialogOneLineOneBtn(context, errforgotpasswordr2 + '\n \n ' + 'Do you want to continue?', "OK",
                          onClickBtn: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                // int index = int.parse(widget.id);
                                return loginScreen();
                              }),
                            );
                          });
                    },
                    // onPressed: () {
                    //
                    //   dialogOneLineTwoBtn(
                    //       context,
                    //       errforgotpasswordr2+ '\n \n ' + 'Do you want to continue?',
                    //       'Confirm',
                    //       'Cancel', onClickBtn: (String result) {
                    //     Navigator.of(context).pop();
                    //     switch (result) {
                    //       case 'Cancel':
                    //         {
                    //           break;
                    //         }
                    //       case 'OK':
                    //         {
                    //           Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                    //             // int index = int.parse(widget.id);
                    //             return loginScreen();
                    //             // DisplayBeerScreen();
                    //           }));
                    //         }
                    //     }
                    //   });
                    // },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
