import 'package:f2fbuu/customs/button/button_custom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/message/text_message.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/login/bloc/pdpa_bloc/pdpa_bloc.dart';
import 'package:f2fbuu/module/login/model/response/screen_pdpa_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

pDPAScreenWidget(BuildContext context, ScreenPDPAResponse? screenPDPAResponse) {
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
                  child: Text(screenPDPAResponse?.body?.screeninfo?.titlepdpa?? pDPATitlePDPA,
                      textAlign: TextAlign.center, style: const TextStyle(fontSize: sizeTitle24, color: Colors.black)),
                ),
                Expanded(
                  child: Container(
                      color: bscTransparent,
                      width: MediaQuery.of(context).size.width,
                      child: SfPdfViewer.network("${screenPDPAResponse?.body?.linkpdpa}")
                      ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.08,
                    ),
                    Expanded(
                        child: ButtonCustom(
                      label: screenPDPAResponse?.body?.screeninfo?.btnaccept ?? pDPABtnAccept,
                      colortext: tcButtonTextBlack,
                      colorbutton: tcButtonTextWhite,
                      sizetext: sizeTextBig20,
                      colorborder: tcButtonTextBoarder,
                      sizeborder: 10,
                      onPressed: () {
                        BlocProvider.of<PdpaBloc>(context).add(OnClickPDPAEvent(accept: true));

                      },
                    )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Expanded(
                        child: ButtonCustom(
                      label: screenPDPAResponse?.body?.screeninfo?.btndecline??pDPABtnDecline,
                      colortext: tcButtonTextWhite,
                      colorbutton: tcButtonTextRed,
                      sizetext: sizeTextBig20,
                      colorborder: tcButtonTextRedBoarder,
                      sizeborder: 10,
                      onPressed: () {
                        BlocProvider.of<PdpaBloc>(context)
                            // ..isFetching = true
                            .add(OnClickPDPAEvent(accept: false));

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
