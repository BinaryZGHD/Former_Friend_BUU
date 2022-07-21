import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/home/model/response/more_response/scree_more_pdpa_response.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

mPDPAWidget(BuildContext context, ScreenMorePDPAResponse? screenHomeMorePDPAResponse){
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          size: sizeTitle24,
          color: Colors.black,
        ),
      ),
      title: Text("${screenHomeMorePDPAResponse?.body?.screeninfo?.textPDPAhead}",
        style: const TextStyle(
          color: Colors.black,
          fontSize: sizeTitle24,
        ),
      ),
    ),
    body: SafeArea(
      child: Container(
          padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 20),
          color: bscTransparent,
          width: MediaQuery.of(context).size.width,
          child: SfPdfViewer.network("${screenHomeMorePDPAResponse?.body?.linkpdpa}")
        // Image.asset(
        //   "assets/PDPA.png",
        //   fit: BoxFit.fill,
        // ),
      ),
    ),
  );
}