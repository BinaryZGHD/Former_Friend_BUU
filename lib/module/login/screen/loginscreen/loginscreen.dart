import 'dart:convert';

import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpurl;
import '../../../../customs/Imge/changimgetype.dart';
import '../../../../customs/button/buttoncustom.dart';
import '../../../../customs/color/colorconts.dart';
import '../../../../customs/dialog/dialogboxcutom.dart';
import '../../../../customs/dialog/texterror.dart';
import '../../../../customs/size/size.dart';
import '../../../../customs/textfile/buildtextfieldcustom.dart';
import '../../../../customs/textfile/buildtextfieldpasswordcustom.dart';
import '../../../../customs/textlink/textlinktoscreencustom.dart';
import '../../../../model/loginmodel/loginmodelscreen/loginwording.dart';
import '../../../home/screen/homescreen/homescreen.dart';

import '../forgotpasswordscreen/forgotpassword.dart';
import '../registerscreen/pdparegisterscreen.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  LoginWording? _dataFromAPI;
  @override
  void initState() {
    super.initState();
    getAPILoginwording();
  }

  Future<LoginWording?> getAPILoginwording() async {
    // print("เรียกใช้ Get_Coin_price");
    var url = Uri.parse("https://webzbinaryz.web.app/v1/api/modules/login/wording/login");
    var response = await httpurl.get(url, headers: <String, String>{});

    _dataFromAPI = loginwordingFromJson(utf8.decode(response.bodyBytes));
    // print(response.body);
    // print(_dataFromAPI?.head?.message);// get the data from the api
    // print(_dataFromAPI?.body?.screeninfo?.btnchangelang);// get the data from the api
    return _dataFromAPI;

    // log(response.body);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController userController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    String userID = "";
    String passw = "";
    return Scaffold(
      body: FutureBuilder(
        future: getAPILoginwording(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              height: MediaQuery.of(context).size.height,
              // decoration: buildBoxDecoration(),
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
                                "${_dataFromAPI?.body?.screeninfo?.btnchangelang}",
                                style: TextStyle(fontSize: sizeText18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Center(
                              child: ChangeImageType(
                            urlimge_l:
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Buu-logo11.png/130px-Buu-logo11.png',
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
                            hint_label: "${_dataFromAPI?.body?.screeninfo?.edtID}",
                            textInputType: TextInputType.text,
                          ),
                          buildTextFieldPasswordCustom(
                            textEditingController: passwordController,
                            onChanged: (value) {
                              passw = value;
                              print("passwordController login  == " + value);
                            },
                            hint_label: "${_dataFromAPI?.body?.screeninfo?.edtpass}",
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
                            linklabel: "${_dataFromAPI?.body?.screeninfo?.btnforgotpass}",
                            mapscreen: forgotPasswordScreen(),
                            linktextcolor: TC_forgot, sizetext: sizeTextSmaller14,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          Center(
                            child: ButtonCustom(
                              onPressed: () {

                                // dialogOneLineOneBtn(
                                //     context,
                                //     "userID  :" +  userID + "\n" + "Password :" + passw,
                                //     'Ok',
                                //     onClickBtn: () {
                                //
                                //       Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                //         // int index = int.parse(widget.id);
                                //         return HomeScreen();
                                //         // DisplayBeerScreen();
                                //       }));
                                //     });

                                dialogOneLineTwoBtn(
                                    context,
                                    "userID  :" +  userID + "\n" + "Password :" + passw,
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
                                      return HomeScreen();
                                      // DisplayBeerScreen();
                                      }));
                                      }
                                  }
                                });

                                // showDialog(
                                //     context: context,
                                //     builder: (context) => CustomDialogBox(
                                //           id: '',
                                //           textfieldvalue: "userID  :" +  userID + "\n" + "Password :" + passw,
                                //           description: errloin  + '\n \n ' + 'Do you want to continue?',
                                //           mapscreen: HomeScreen(),
                                //         ));
                              },
                              label: "  ${_dataFromAPI?.body?.screeninfo?.btnlogin}  ",
                              colortext: TC_Black,
                              colorbutton: BC_ButtonGreen,
                              sizetext: sizeTextBig20,
                              colorborder: BSC_transparent,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${_dataFromAPI?.body?.screeninfo?.textreg} ",
                                style: TextStyle(
                                    fontSize: sizeTextSmall16, color: Colors.black, fontWeight: FontWeight.w300),
                              ),
                              TextLinkToScreenCustom(
                                linklabel: "${_dataFromAPI?.body?.screeninfo?.btnReg}",
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
                  ),
                ],
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
