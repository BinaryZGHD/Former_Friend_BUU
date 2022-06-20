import 'dart:convert';
import 'package:f2fbuu/module/home/screen/homescreen/homescreen.dart';
import 'package:http/http.dart' as httpurl;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../customs/button/buttoncustom.dart';
import '../../../../customs/color/colorconts.dart';
import '../../../../customs/dialog/dialogboxcutom.dart';
import '../../../../customs/dialog/texterror.dart';
import '../../../../customs/size/size.dart';
import '../../../../customs/textfile/buildtextfieldpasswordcustom.dart';
import '../../../../customs/textlink/textlinktoscreencustom.dart';
import '../../../../model/loginmodel/loginmodelscreen/changepasswording.dart';
import '../forgotpasswordscreen/forgotpassword.dart';
import '../loginscreen/loginscreen.dart';

class changePasswordScreen extends StatefulWidget {
  const changePasswordScreen({Key? key}) : super(key: key);

  @override
  State<changePasswordScreen> createState() => _changePasswordScreenState();
}

class _changePasswordScreenState extends State<changePasswordScreen> {
  ChangePasswording? _dataFromAPIChangePasswording;
  @override
  void initState() {
    super.initState();
    getAPIChangePasswording();
  }

  Future<ChangePasswording?> getAPIChangePasswording() async {
    // print("เรียกใช้ Get_Coin_price");
    var url = Uri.parse("https://webzbinaryz.web.app/v1/api/modules/login/wording/changpassword");
    var response = await httpurl.get(url, headers: <String, String>{});

    _dataFromAPIChangePasswording = changepasswordingFromJson(utf8.decode(response.bodyBytes));
    // print(response.body);
    // print(_dataFromAPI?.head?.message);// get the data from the api
    // print(_dataFromAPI?.body?.screeninfo?.btnchangelang);// get the data from the api
    return _dataFromAPIChangePasswording;

    // log(response.body);
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController currentpasswordController = TextEditingController();
    TextEditingController newpasswordController = TextEditingController();
    TextEditingController confirmpasswordController = TextEditingController();

    String currentpasswordvalue = "";
    String newpasswordvalue = "";
    String passwordvalue = " ";

    return FutureBuilder(
        future: getAPIChangePasswording(),
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
                title: Text("${_dataFromAPIChangePasswording?.body?.screeninfo?.textheadsetnewpass}" ,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      buildTextFieldPasswordCustom(
                        textEditingController: currentpasswordController,
                        onChanged: (value) {
                          currentpasswordvalue = value;
                        },
                        hint_label: "${_dataFromAPIChangePasswording?.body?.screeninfo?.edtcurrentpass}",
                      ),
                      buildTextFieldPasswordCustom(
                        textEditingController: newpasswordController,
                        onChanged: (value) {
                          newpasswordvalue = value;
                        },
                        hint_label: "${_dataFromAPIChangePasswording?.body?.screeninfo?.edtnewpass}",
                      ),
                      buildTextFieldPasswordCustom(
                        textEditingController: confirmpasswordController,
                        onChanged: (value) {
                          passwordvalue = value;
                        },
                        hint_label: "${_dataFromAPIChangePasswording?.body?.screeninfo?.edtcpass}",
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextLinkToScreenCustom(
                          linklabel: "${_dataFromAPIChangePasswording?.body?.screeninfo?.btnforgotpass}",
                          mapscreen: forgotPasswordScreen(),
                          linktextcolor: TC_forgot, sizetext: sizeTextSmaller14,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Center(
                        child: ButtonCustom(
                          label: "  "+"${_dataFromAPIChangePasswording?.body?.screeninfo?.btnconfirm}"+"  ",
                          colortext: TC_Black,
                          colorbutton: BC_ButtonGreen,
                          sizetext: sizeTextBig20,
                          colorborder: BSC_transparent,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => CustomDialogBox(
                                  id: '',
                                  textfieldvalue:"Current password : $currentpasswordvalue"  +
                                      "\n" +
                                      "Password  : $newpasswordvalue" +
                                      "\n" +
                                      "Confirm password : $passwordvalue" ,
                                  description: errforgotpasswordr2 + '\n \n ' + 'Do you want to continue?',
                                  mapscreen: HomeScreen(),
                                ));
                          },
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                    ],
                  ),
                ),
              ),
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
