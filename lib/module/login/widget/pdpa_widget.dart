import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/login/bloc/pdpabloc/pdpa_bloc.dart';
import 'package:f2fbuu/module/login/model/response/screen_pdpa_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

pdpaScreenWidget(BuildContext context, ScreenPDPAResponse? screenPDPAResponse) {
  return WillPopScope(
    onWillPop: () async {
      return false;
    },
    child: Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10),
                  child: Text("${screenPDPAResponse?.body?.screeninfo?.titlepdpa}",
                      textAlign: TextAlign.center, style: const TextStyle(fontSize: sizeTitle24, color: Colors.black)),
                ),
                Expanded(
                  child: Container(
                      color: bscTransparent,
                      width: MediaQuery.of(context).size.width,
                      child: SfPdfViewer.network("${screenPDPAResponse?.body?.linkpdpa}")
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
                      label: "${screenPDPAResponse?.body?.screeninfo?.btnaccept}",
                      colortext: tcButtonTextBlack,
                      colorbutton: tcButtonTextWhite,
                      sizetext: sizeTextBig20,
                      colorborder: tcButtonTextBoarder,
                      sizeborder: 10,
                      onPressed: () {
                        BlocProvider.of<PdpaBloc>(context).add(OnClickPDPAEvent(accept: true));
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
                      label: "${screenPDPAResponse?.body?.screeninfo?.btndecline}",
                      colortext: tcButtonTextWhite,
                      colorbutton: tcButtonTextRed,
                      sizetext: sizeTextBig20,
                      colorborder: tcButtonTextRedBoarder,
                      sizeborder: 10,
                      onPressed: () {
                        BlocProvider.of<PdpaBloc>(context)
                            // ..isFetching = true
                            .add(OnClickPDPAEvent(accept: false));
                        // context
                        //     .read<PdpaBloc>()
                        //     .add(OnClickPDPAEvent(accept: false));
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
