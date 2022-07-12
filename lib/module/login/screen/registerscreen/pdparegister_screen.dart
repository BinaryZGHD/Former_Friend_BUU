import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/dialog/texterror.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/login/bloc/pdpabloc/pdpa_bloc.dart';
import 'package:f2fbuu/module/login/model/response/screen_pdpa_response.dart';
import 'package:f2fbuu/module/login/screen/registerscreen/register_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/module/login/screen/loginscreen/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class conditionPDPAScreen extends StatefulWidget {
  final String valueLanguage;
  const conditionPDPAScreen({Key? key, required this.valueLanguage}) : super(key: key);

  @override
  State<conditionPDPAScreen> createState() => _conditionPDPAScreenState();
}

class _conditionPDPAScreenState extends State<conditionPDPAScreen>  with ProgressDialog {
  ScreenPDPAResponse? _screenPDPAResponse;
  late String userLanguage;
  @override
  void initState() {
    super.initState();
    userLanguage = widget.valueLanguage;
    context.read<PdpaBloc>().add(ScreenInfoPDPAEvent(userLanguage: userLanguage));
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PdpaBloc, PdpaState>(
      listener: (context, state) {
        if (state is PDPALoading) {
          showProgressDialog(context);
        }
        if (state is PDPAEndLoading) {
          hideProgressDialog(context);
        }
        if (state is PDPAError) {
          // show dialog error
          dialogOneLineOneBtn(context, state.message + '\n ', "OK", onClickBtn: () {
            Navigator.of(context).pop();
          });
        }
        if (state is PDPADecline) {
          // show dialog error
          Navigator.push(
              context,MaterialPageRoute(
              builder: (context) => loginScreen()
          )
          );
          // dialogOneLineOneBtn(context, "state.message" + '\n \n ' + 'Do you want to continue?', "OK", onClickBtn: () {
          //   Navigator.of(context).pop();
          // });

        }
        if (state  is PDPAAccept){
          Navigator.push(
              context,MaterialPageRoute(
              builder: (context) => registerScreen( valueLanguage: userLanguage)
          )
          );


        }
      },
      builder: (context, state) {
        if (state is ScreenInfoPDPASuccessState) {
          _screenPDPAResponse = state.response;
          return buildContentPDPAScreen(context);
        }
        return Scaffold(body: Container(
          color: Colors.white,
        ));
      },
      buildWhen: (context, state) {
        return state is ScreenInfoPDPASuccessState ;
      },
    );
  }

  Container buildContainerTitle() {
    return Container(
      // constraints: BoxConstraints.expand(height: 60),
      child: Text("${_screenPDPAResponse?.body?.screeninfo?.titlepdpa}",
          textAlign: TextAlign.center, style: TextStyle(fontSize: sizeTitle24, color: Colors.black)),
    );
  }

  buildContentPDPAScreen(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 10),
                    child: buildContainerTitle(),
                  ),
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
                              context.read<PdpaBloc>().add(OnClickPDPAEvent(accept: true));
                              // dialogOneLineTwoBtn(
                              //     context, errpdpaaccept + '\n \n ' + 'Do you want to continue?', 'Confirm', 'Cancel',
                              //     onClickBtn: (String result) {
                              //       Navigator.of(context).pop();
                              //       switch (result) {
                              //         case 'Cancel':
                              //           {
                              //             break;
                              //           }
                              //         case 'OK':
                              //           {
                              //             Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                              //               // int index = int.parse(widget.id);
                              //               return registerScreen();
                              //               // DisplayBeerScreen();
                              //             }));
                              //           }
                              //       }
                              //     });

                            },
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                      Expanded(
                          child: ButtonCustom(
                            label: "${_screenPDPAResponse?.body?.screeninfo?.btndecline}",
                            colortext: BC_ButtonText_style_White,
                            colorbutton: BC_ButtonText_style_Red,
                            sizetext: sizeTextBig20,
                            colorborder: BC_ButtonText_style_Red_Boarder,
                            sizeborder: 10,
                            onPressed: () {
                              context.read<PdpaBloc>().add(OnClickPDPAEvent(accept: false));
                              // dialogOneLineTwoBtn(
                              //     context, errpdpadecline + '\n \n ' + 'Do you want to continue?', 'Confirm', 'Cancel',
                              //     onClickBtn: (String result) {
                              //       Navigator.of(context).pop();
                              //       switch (result) {
                              //         case 'Cancel':
                              //           {
                              //             break;
                              //           }
                              //         case 'OK':
                              //           {
                              //             Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                              //               // int index = int.parse(widget.id);
                              //               return loginScreen();
                              //               // DisplayBeerScreen();
                              //             }));
                              //           }
                              //       }
                              //     });
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
        ),
      ),
    );
  }
}

