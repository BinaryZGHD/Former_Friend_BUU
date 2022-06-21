import 'dart:convert';
import 'package:http/http.dart' as httpurl;
import 'package:f2fbuu/module/login/screen/forgotpasswordscreen/setnewforgotpassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../customs/button/buttoncustom.dart';
import '../../../../customs/color/colorconts.dart';
import '../../../../customs/dialog/dialog_widget.dart';
import '../../../../customs/dialog/dialogboxcutom.dart';
import '../../../../customs/dialog/texterror.dart';
import '../../../../customs/size/size.dart';
import '../../../../customs/textfile/buildtextfieldcustom.dart';
import '../../../../model/loginmodel/forgotpasswordmodelscreen/forgotpasswording.dart';


class forgotPasswordScreen extends StatefulWidget {
  const forgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<forgotPasswordScreen> createState() => _forgotPasswordScreenState();
}

class _forgotPasswordScreenState extends State<forgotPasswordScreen> {
  TextEditingController userID = TextEditingController();
  TextEditingController email = TextEditingController();

  String uservalue = " ";

  String emailvalue = " ";
  ForgotPasswording? _dataFromAPIForgotPasswording;
  @override
  void initState() {
    super.initState();
    getAPIForgotPasswording();
  }

  Future<ForgotPasswording?> getAPIForgotPasswording() async {
    // print("เรียกใช้ Get_Coin_price");
    var url = Uri.parse("https://webzbinaryz.web.app/v1/api/modules/login/wording/forgotpassword");
    var response = await httpurl.get(url, headers: <String, String>{});

    _dataFromAPIForgotPasswording = forgotpasswordingFromJson(utf8.decode(response.bodyBytes));
    // print(response.body);
    // print(_dataFromAPIForgotPasswording?.head?.message);// get the data from the api
    // print("${_dataFromAPIForgotPasswording?.body?.screeninfo?.btnsentotpagain}"); // get the data from the api
    // print("textheadsetnewpassword:" "${_dataFromAPIForgotPasswording?.body?.screeninfo?.textheadsetnewpass} \n"
    //     "textotpwillsent:""${_dataFromAPIForgotPasswording?.body?.screeninfo?.textotpwillsent}\n"
    //     "edtemailforgot:""${_dataFromAPIForgotPasswording?.body?.screeninfo?.edtemailforgot}\n"
    //     "edtpassword:" "${_dataFromAPIForgotPasswording?.body?.screeninfo?.edtpass}\n"
    //     "edtcpassword:" "${_dataFromAPIForgotPasswording?.body?.screeninfo?.edtcpass}\n"
    //     "otp: ""${_dataFromAPIForgotPasswording?.body?.screeninfo?.otp}\n"
    //     "texpleaseconfirm:""${_dataFromAPIForgotPasswording?.body?.screeninfo?.texpleaseconfirm}\n"
    //    "btnsentotpagain:" "${_dataFromAPIForgotPasswording?.body?.screeninfo?.btnsentotpagain}\n"
    //     "btnconfirm:""${_dataFromAPIForgotPasswording?.body?.screeninfo?.btnconfirm}");
    return _dataFromAPIForgotPasswording;

    // log(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAPIForgotPasswording(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {

            return Scaffold(
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
                    "${_dataFromAPIForgotPasswording?.body?.screeninfo?.textforgothead}",
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    buildTextFieldCustom(
                      textEditingController: userID,
                      onChanged: (value) {
                        uservalue = value;
                      },
                      hint_label: "${_dataFromAPIForgotPasswording?.body?.screeninfo?.edtIDforgot}",
                      textInputType: TextInputType.text,
                    ),
                    buildTextFieldCustom(
                      textEditingController: email,
                      onChanged: (value) {
                        emailvalue = value;
                      },
                      hint_label: "${_dataFromAPIForgotPasswording?.body?.screeninfo?.edtemailforgot}",
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Center(
                      child: ButtonCustom(
                        label: "  ${_dataFromAPIForgotPasswording?.body?.screeninfo?.btnforgotnext}  ",

                        colortext: TC_Black,
                        colorbutton: BC_ButtonGreen,
                        sizetext: sizeTextBig20,
                        colorborder: BSC_transparent,

                        onPressed: () {

                          dialogOneLineTwoBtn(
                              context,
                              errforgotpasswordr1+ '\n \n ' + 'Do you want to continue?' ,
                              'Confirm',
                              'Cancel', onClickBtn: (String result) {
                            Navigator.of(context).pop();
                            switch (result) {
                              case 'Cancel':
                                {
                                  break;
                                }
                              case 'OK':
                                {
                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                    // int index = int.parse(widget.id);
                                    return setNewForgotPasswordScreen(
                                        textheadsetnewpassword: "${_dataFromAPIForgotPasswording?.body?.screeninfo?.textheadsetnewpass}" ,
                                        textotpwillsent:"${_dataFromAPIForgotPasswording?.body?.screeninfo?.textotpwillsent}" ,
                                        edtemailforgot:"${_dataFromAPIForgotPasswording?.body?.screeninfo?.edtemailforgot}" ,
                                        edtpassword: "${_dataFromAPIForgotPasswording?.body?.screeninfo?.edtpass}" ,
                                        edtcpassword: "${_dataFromAPIForgotPasswording?.body?.screeninfo?.edtcpass}" ,
                                        otp: "${_dataFromAPIForgotPasswording?.body?.screeninfo?.otp}" ,
                                        texpleaseconfirm:"${_dataFromAPIForgotPasswording?.body?.screeninfo?.texpleaseconfirm}"  ,
                                        btnsentotpagain: "${_dataFromAPIForgotPasswording?.body?.screeninfo?.btnsentotpagain}" ,
                                        btnconfirm:"${_dataFromAPIForgotPasswording?.body?.screeninfo?.btnconfirm}"
                                    );
                                    // DisplayBeerScreen();
                                  }));
                                }
                            }
                          });
                          // showDialog(
                          //     context: context,
                          //     builder: (context) => CustomDialogBox(
                          //           id: '',
                          //           textfieldvalue: "UserID  : " + uservalue + "\nEmail  : " + emailvalue,
                          //           description: errforgotpasswordr1 + '\n \n ' + 'Do you want to continue?',
                          //           mapscreen: setNewForgotPasswordScreen(
                          //               textheadsetnewpassword: "${_dataFromAPIForgotPasswording?.body?.screeninfo?.textheadsetnewpass}" ,
                          //               textotpwillsent:"${_dataFromAPIForgotPasswording?.body?.screeninfo?.textotpwillsent}" ,
                          //               edtemailforgot:"${_dataFromAPIForgotPasswording?.body?.screeninfo?.edtemailforgot}" ,
                          //               edtpassword: "${_dataFromAPIForgotPasswording?.body?.screeninfo?.edtpass}" ,
                          //               edtcpassword: "${_dataFromAPIForgotPasswording?.body?.screeninfo?.edtcpass}" ,
                          //               otp: "${_dataFromAPIForgotPasswording?.body?.screeninfo?.otp}" ,
                          //               texpleaseconfirm:"${_dataFromAPIForgotPasswording?.body?.screeninfo?.texpleaseconfirm}"  ,
                          //               btnsentotpagain: "${_dataFromAPIForgotPasswording?.body?.screeninfo?.btnsentotpagain}" ,
                          //               btnconfirm:"${_dataFromAPIForgotPasswording?.body?.screeninfo?.btnconfirm}"
                          //           )
                          //         ));
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                  ],
                ),
              ),
            )
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

    );
  }
}
