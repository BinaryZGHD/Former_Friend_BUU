import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:flutter/material.dart';

contactUsWidget(
  BuildContext context,
) {
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
      title: const Text(
        "ติดต่อเรา",
        style: TextStyle(
          color: Colors.black,
          fontSize: sizeTitle24,
        ),
      ),
    ),
    body: SafeArea(
      child: Container(
        color: Colors.grey[200],
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Container(

                    padding:  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                    ),

                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        _contactDetail(
                            titail: "widget.titlename", value:" widget.name"),
                        _contactDetail(
                            titail: "widget.titleposition", value: "widget.position"),
                        _contactDetail(
                            titail: "widget.titlephone", value: "widget.phone"),
                        _contactDetail(
                            titail: "widget.titleemail", value: "widget.email"),
                        const SizedBox(
                          height: 30,
                        ),
                        // TextButton(
                        //     onPressed: () {
                        //       setState(() {
                        //         _launched = _launchInBrowser(Uri.parse("https://sites.google.com/go.buu.ac.th/apisitp"));
                        //       });
                        //     },
                        //     child: Center(
                        //       child: Text(" > "+
                        //           "รายละเอียดเพิ่มเติม"+ " < ",
                        //         style: TextStyle(
                        //           fontSize: 14,
                        //           color: Colors.blue,
                        //         ),
                        //       ),
                        //     )),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 20),
              child: Center(
                child: ButtonCustom(
                  onPressed: () {},
                  label: "  @mathf2fbuu  ",
                  colortext: tcButtonTextWhite,
                  colorbutton: tcButtonLine,
                  sizetext: sizeTextBig20,
                  colorborder: tcButtonLine,
                  sizeborder: 10,
                ),
              ),
            ),
          ],
        ),
      ),

    ),
  );
}

_contactDetail({required String titail, required String value}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 10.0, top: 8.0, bottom: 15.0),
    child: Table(
      border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
      columnWidths: const {0: FractionColumnWidth(0.3), 1: FractionColumnWidth(0.05), 2: FractionColumnWidth(0.65)},
      // defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(children: [
          // if (_screenprofileResponse?.body?.profileGeneralInfo?.img == null)
          Text(
            titail,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            value,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 14),
          ),
        ])
      ],
    ),
  );
}
