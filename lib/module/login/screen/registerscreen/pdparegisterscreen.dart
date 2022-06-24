import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as httpurl;
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/module/login/screen/loginscreen/loginscreen.dart';
import 'package:f2fbuu/module/login/screen/registerscreen/registerscreen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../../../customs/button/buttoncustom.dart';
import '../../../../customs/dialog/dialog_widget.dart';
import '../../../../customs/dialog/texterror.dart';
import '../../../../customs/progress_dialog.dart';
import '../../../../customs/size/size.dart';
import '../../bloc/pdpabloc/pdpa_bloc.dart';
import '../../model/response/screen_pdpa.dart';

class conditionPDPAScreen extends StatefulWidget {
  const conditionPDPAScreen({Key? key}) : super(key: key);

  @override
  State<conditionPDPAScreen> createState() => _conditionPDPAScreenState();
}

class _conditionPDPAScreenState extends State<conditionPDPAScreen>  with ProgressDialog {
  ScreenPDPAResponse? _screenPDPAResponse;
  @override


  @override
  Widget build(BuildContext context) {
    context.read<PdpaBloc>().add(PDPAScreenInfoEvent());
    return BlocListener<PdpaBloc, PdpaState>(
      listener: (context, state) {
        if (state is PDPALoading) {
          showProgressDialog(context);
        }
        if (state is PDPAEndLoading) {
          hideProgressDialog(context);
        }
        if (state is PDPAError) {
          // show dialog error
          print(state.message);
        }
      },
      child: Scaffold(
        body: BlocBuilder<PdpaBloc, PdpaState>(builder: (context, state) {
          if (state is PDPAScreenInfoSuccessState) {
            _screenPDPAResponse = state.response;
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
                            color: BSC_transparent,
                            width: MediaQuery.of(context).size.width,
                            child: SfPdfViewer.network("${_screenPDPAResponse?.body?.linkpdpa}")
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
                                label: "${_screenPDPAResponse?.body?.screeninfo?.btnaccept}",
                                colortext: BC_ButtonText_style_Black,
                                colorbutton: BC_ButtonText_style_White,
                                sizetext: sizeTextBig20,
                                colorborder: BC_ButtonText_style_Black_Boarder,
                                sizeborder: 10,
                                onPressed: () {
                                  dialogOneLineTwoBtn(
                                      context, errpdpaaccept + '\n \n ' + 'Do you want to continue?', 'Confirm', 'Cancel',
                                      onClickBtn: (String result) {
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
                                                return registerScreen();
                                                // DisplayBeerScreen();
                                              }));
                                            }
                                        }
                                      });
                                  // showDialog(
                                  //     context: context,
                                  //     builder: (context) => CustomDialogBox(
                                  //       id: '',
                                  //       textfieldvalue: "",
                                  //       description: errpdpaaccept + '\n \n ' + 'Do you want to continue?',
                                  //       mapscreen: registerScreen(),
                                  //     ));
                                },
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                          ),
                          Expanded(
                              child: ButtonCustom(
                                label: "${_screenPDPAResponse?.body?.screeninfo?.btndecline}",
                                colortext: BC_ButtonText_style_White,
                                colorbutton: BC_ButtonText_style_Black,
                                sizetext: sizeTextBig20,
                                colorborder: BC_ButtonText_style_Black,
                                sizeborder: 10,
                                onPressed: () {
                                  dialogOneLineTwoBtn(
                                      context, errpdpadecline + '\n \n ' + 'Do you want to continue?', 'Confirm', 'Cancel',
                                      onClickBtn: (String result) {
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
                                                return loginScreen();
                                                // DisplayBeerScreen();
                                              }));
                                            }
                                        }
                                      });
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

          } else {
            return Container();
          }
        }),
      ),
    );
  }
  Container buildContainerTitle() {
    return Container(
      constraints: BoxConstraints.expand(height: 60),
      child: Text("${_screenPDPAResponse?.body?.screeninfo?.textPDPAhead}",
          textAlign: TextAlign.center, style: TextStyle(fontSize: sizeTitle24, color: Colors.black)),
    );
  }
}

