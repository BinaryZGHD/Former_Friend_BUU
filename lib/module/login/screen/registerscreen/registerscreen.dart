import 'dart:convert';
import 'package:http/http.dart' as httpurl;
import 'package:f2fbuu/module/login/screen/registerscreen/registerconfrim.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../../customs/button/buttoncustom.dart';
import '../../../../customs/color/colorconts.dart';
import '../../../../customs/dialog/dialogboxcutom.dart';
import '../../../../customs/dialog/texterror.dart';
import '../../../../customs/size/size.dart';
import '../../../../customs/textfile/buildtextfieldcustom.dart';
import '../../../../customs/textfile/buildtextfieldpasswordcustom.dart';
import '../../../../model/loginmodel/registermodelscreen/registerwording.dart';


class registerScreen extends StatefulWidget {
  const registerScreen({Key? key}) : super(key: key);

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  TextEditingController user = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  String uservalue = " ";
  String phonevalue = " ";
  String emailvalue = " ";
  String namevalue = " ";
  String lastnamevalue = "";
  String passwordvalue = "";
  String confirmpasswordvalue = "";
  RegisterWording? _dataFromAPIRegisterWording;
  @override
  void initState() {
    super.initState();
    getAPIRegisterWording();
  }

  Future<RegisterWording?> getAPIRegisterWording() async {
    // print("เรียกใช้ Get_Coin_price");
    var url = Uri.parse("https://webzbinaryz.web.app/v1/api/modules/login/wording/register");
    var response = await httpurl.get(url, headers: <String, String>{});

    _dataFromAPIRegisterWording = registerwordingFromJson(utf8.decode(response.bodyBytes));
    // print(response.body);
    // // print(_dataFromAPI?.head?.message);// get the data from the api
    // print(_dataFromAPIRegisterWording?.body?.screeninfo?.textreghead);// get the data from the api
    return _dataFromAPIRegisterWording;

    // log(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAPIRegisterWording(),
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
                "${_dataFromAPIRegisterWording?.body?.screeninfo?.textreghead}",
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
                      textEditingController: user,
                      onChanged: (value) {
                        uservalue = value;
                      },
                      hint_label: "${_dataFromAPIRegisterWording?.body?.screeninfo?.edtIDreg}",
                      textInputType: TextInputType.text,
                    ),
                    buildTextFieldCustom(
                      textEditingController: phone,
                      onChanged: (value) {
                        phonevalue = value;
                      },
                      hint_label: "${_dataFromAPIRegisterWording?.body?.screeninfo?.edtphonereg}",
                      textInputType: TextInputType.number,
                    ),
                    buildTextFieldCustom(
                      textEditingController: email,
                      onChanged: (value) {
                        emailvalue = value;
                      },
                      hint_label: "${_dataFromAPIRegisterWording?.body?.screeninfo?.edtemailreg}",
                      textInputType: TextInputType.text,
                    ),
                    buildTextFieldCustom(
                      textEditingController: name,
                      onChanged: (value) {
                        namevalue = value;
                      },
                      hint_label: "${_dataFromAPIRegisterWording?.body?.screeninfo?.edtnamereg}",
                      textInputType: TextInputType.text,
                    ),
                    buildTextFieldCustom(
                      textEditingController: lastname,
                      onChanged: (value) {
                        lastnamevalue = value;
                      },
                      hint_label: "${_dataFromAPIRegisterWording?.body?.screeninfo?.edtlnamereg}",
                      textInputType: TextInputType.text,
                    ),
                    buildTextFieldPasswordCustom(
                      textEditingController: password,
                      onChanged: (value) {
                        passwordvalue = value;
                      },
                      hint_label: "${_dataFromAPIRegisterWording?.body?.screeninfo?.edtpassreg}",
                    ),
                    buildTextFieldPasswordCustom(
                      textEditingController: confirmpassword,
                      onChanged: (value) {
                        confirmpasswordvalue = value;
                      },
                      hint_label: "${_dataFromAPIRegisterWording?.body?.screeninfo?.edtcpassreg}",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Center(
                      child: ButtonCustom(
                        label: "  "+"${_dataFromAPIRegisterWording?.body?.screeninfo?.btnsignup}"+"  ",
                        colortext: TC_Black,
                        colorbutton: BC_ButtonGreen,
                        sizetext: sizeTextBig20,
                        colorborder: BSC_transparent,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => CustomDialogBox(
                                    id: '',
                                    textfieldvalue: "Register  :  $uservalue" +
                                        "\nTelrphone number  :  $phonevalue" +
                                        "\nEmail  :  $emailvalue" +
                                        "\nName  :  $namevalue" +
                                        "\nLast name  :  $lastnamevalue" +
                                        "\nPassword  :  $passwordvalue" +
                                        "\nConfirm password  :  $confirmpasswordvalue",
                                    description: errregidter1 + '\n \n ' + 'Do you want to continue?',
                                    mapscreen: registerConfirmScreen(
                                        titleconregis: "${_dataFromAPIRegisterWording?.body?.screeninfo?.titleconregis}" ,
                                        textotpwillsent: "${_dataFromAPIRegisterWording?.body?.screeninfo?.textotpwillsent}" ,
                                        textpleaseconfirm: "${_dataFromAPIRegisterWording?.body?.screeninfo?.textpleaseconfirm}" ,
                                        textsentotpagain:"${_dataFromAPIRegisterWording?.body?.screeninfo?.textsentotpagain}"  ,
                                        textotp: "${_dataFromAPIRegisterWording?.body?.screeninfo?.textotp}" ,
                                        btnconfirm: "${_dataFromAPIRegisterWording?.body?.screeninfo?.btnconfirm}" ,
                                        edtemailreg:"${_dataFromAPIRegisterWording?.body?.screeninfo?.edtemailreg}"
                                    ),
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
      },
    );
  }
}
