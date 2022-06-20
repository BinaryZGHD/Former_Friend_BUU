import 'dart:convert';
import 'package:http/http.dart' as httpurl;
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/module/login/screen/loginscreen/loginscreen.dart';
import 'package:f2fbuu/module/login/screen/registerscreen/registerscreen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../customs/button/buttoncustom.dart';
import '../../../../customs/dialog/dialogboxcutom.dart';
import '../../../../customs/dialog/texterror.dart';
import '../../../../customs/size/size.dart';
import '../../../../model/loginmodel/loginmodelscreen/pdpawording.dart';

class conditionPDPAScreen extends StatefulWidget {
  const conditionPDPAScreen({Key? key}) : super(key: key);

  @override
  State<conditionPDPAScreen> createState() => _conditionPDPAScreenState();
}

class _conditionPDPAScreenState extends State<conditionPDPAScreen> {
  PdpaWording? _dataFromAPIPdpaWording;
  @override
  void initState() {
    super.initState();
    getAPIPdpaWording();
  }

  Future<PdpaWording?> getAPIPdpaWording() async {
    // print("เรียกใช้ Get_Coin_price");
    var url = Uri.parse("https://webzbinaryz.web.app/v1/api/modules/login/wording/PDPA");
    var response = await httpurl.get(url, headers: <String, String>{});

    _dataFromAPIPdpaWording = pdpawordingFromJson(utf8.decode(response.bodyBytes));
    // print(response.body);
    // print(_dataFromAPI?.head?.message);// get the data from the api
    // print(_dataFromAPI?.body?.screeninfo?.btnchangelang);// get the data from the api
    return _dataFromAPIPdpaWording;

    // log(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getAPIPdpaWording(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      buildContainerTitle(),
                      Expanded(
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: SfPdfViewer.network("${_dataFromAPIPdpaWording?.body?.linkpdpa}")
                          // Image.asset(
                          //   "assets/PDPA.png",
                          //   fit: BoxFit.fill,
                          // ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      // buildButtonComfirm(),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.08,
                          ),
                          Expanded(
                              child: ButtonCustom(
                                label: "${_dataFromAPIPdpaWording?.body?.screeninfo?.btnaccept}",

                                colortext: TC_Black,
                                colorbutton: BC_ButtonGreen,
                                sizetext: sizeTextBig20,
                                colorborder: BSC_transparent,
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => CustomDialogBox(
                                        id: '',
                                        textfieldvalue: "",
                                        description: errpdpaaccept + '\n \n ' + 'Do you want to continue?',
                                        mapscreen: registerScreen(),
                                      ));
                                },
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                          ),
                          Expanded(
                              child: ButtonCustom(
                                label: "${_dataFromAPIPdpaWording?.body?.screeninfo?.btndecline}",

                                colortext: TC_Black,
                                colorbutton: BC_ButtonRed,
                                sizetext: sizeTextBig20,
                                colorborder: BSC_transparent,
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => CustomDialogBox(
                                        id: '',
                                        textfieldvalue: "",
                                        description: errpdpadecline + '\n \n ' + 'Do you want to continue?',
                                        mapscreen: loginScreen(),
                                      ));
                                },
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.08,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
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
      ),
    );
  }

  Container buildContainerTitle() {
    return Container(
      constraints: BoxConstraints.expand(height: 50),
      child: Text("${_dataFromAPIPdpaWording?.body?.screeninfo?.textPDPAhead}" ,
          textAlign: TextAlign.center, style: TextStyle(fontSize: sizeTitle24, color: Colors.black)),
    );
  }
}
