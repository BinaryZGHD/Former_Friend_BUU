import 'package:f2fbuu/customs/button/button_custom.dart';
import 'package:f2fbuu/customs/card/card_more.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:flutter/material.dart';

contactUsWidget(
  BuildContext context,
  setState,
  Future<void> Function(Uri url) launchInBrowser,
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
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: sizeTitle24, bottom: 10),
                        child: Text(
                          "ช่องทางการติดต่อเรา",
                          style: TextStyle(fontSize: sizeTitle24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // Padding(
                      //   child: Text(
                      //     "ภาควิชาคณิตศาสตร์ คณะวิทยาศาสตร์ ",
                      //     style: TextStyle(fontSize: sizeTextSmall16, fontWeight: FontWeight.bold),
                      //   ),
                      //   padding: EdgeInsets.only(top: sizeTextSmaller14, bottom: 10),
                      // ),
                      Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 5,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              // bottomLeft: Radius.circular(40),
                            ),
                            gradient: LinearGradient(stops: [
                              0.02,
                              0.02,
                              1,
                            ], colors: [
                              contactUsMath,
                              Colors.white,
                              Colors.white,
                            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              _contactThreeRow(
                                title: "ภาควิชาคณิตศาสตร์ คณะวิทยาศาสตร์ ",
                                textCenter: '  ',
                                value: "",
                                sizeColumnOne: 1,
                                sizeColumnTwo: 0.0,
                                sizeColumnThree: 0.0,
                              ),
                              _contactThreeRow(
                                title: "มหาวิทยาลัยบูรพา 169 ถ.ลงหาดบางแสน ต.แสนสุข อ.เมือง จ.ชลบุรี 20131",
                                textCenter: '  ',
                                value: "",
                                sizeColumnOne: 1,
                                sizeColumnTwo: 0.0,
                                sizeColumnThree: 0.0,
                              ),
                              _contactThreeRow(
                                title: "โทร",
                                textCenter: '  ',
                                value: "0-3810-3078",
                                sizeColumnOne: 0.2,
                                sizeColumnTwo: 0.05,
                                sizeColumnThree: 0.75,
                              ),
                              _contactThreeRow(
                                title: "แฟกซ์",
                                textCenter: '  ',
                                value: "0-3839-3496",
                                sizeColumnOne: 0.2,
                                sizeColumnTwo: 0.05,
                                sizeColumnThree: 0.75,
                              ),
                              _contactThreeRow(
                                title: "อิเมล",
                                textCenter: '  ',
                                value: "math_sci@buu.ac.th",
                                sizeColumnOne: 0.2,
                                sizeColumnTwo: 0.05,
                                sizeColumnThree: 0.75,
                              ),
                              const Center(
                                child: Text(
                                  " จันทร์ - ศุกร์ ",
                                  style: TextStyle(fontSize: sizeTextSmaller14),
                                ),
                              ),
                              const Center(
                                child: Text(
                                  " 08:00 - 16:00 น. ",
                                  style: TextStyle(fontSize: sizeTextSmaller14),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Padding(
                      //   child: Text(
                      //     "คณะวิทยาศาสตร์ มหาวิทยาลัยบูรพา",
                      //     style: TextStyle(fontSize: sizeTextSmall16, fontWeight: FontWeight.bold),
                      //   ),
                      //   padding: EdgeInsets.only(top: 20, bottom: 20),
                      // ),
                      Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 5,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(0),
                              // bottomLeft: Radius.circular(40),
                            ),
                            gradient: LinearGradient(stops: [
                              0.02,
                              0.02,
                              1,
                            ], colors: [
                              contactUsFaulty,
                              Colors.white,
                              Colors.white,
                            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              _contactThreeRow(
                                title: "คณะวิทยาศาสตร์ มหาวิทยาลัยบูรพา ",
                                textCenter: '  ',
                                value: "",
                                sizeColumnOne: 1,
                                sizeColumnTwo: 0.0,
                                sizeColumnThree: 0.0,
                              ),
                              _contactThreeRow(
                                title: "มหาวิทยาลัยบูรพา 169 ถ.ลงหาดบางแสน ต.แสนสุข อ.เมือง จ.ชลบุรี 20131",
                                textCenter: '  ',
                                value: "",
                                sizeColumnOne: 1,
                                sizeColumnTwo: 0.0,
                                sizeColumnThree: 0.0,
                              ),
                              _contactThreeRow(
                                title: "โทร",
                                textCenter: '  ',
                                value: "0-3810-3011",
                                sizeColumnOne: 0.2,
                                sizeColumnTwo: 0.05,
                                sizeColumnThree: 0.75,
                              ),
                              _contactThreeRow(
                                title: "แฟกซ์",
                                textCenter: '  ',
                                value: "0-3839-3496",
                                sizeColumnOne: 0.2,
                                sizeColumnTwo: 0.05,
                                sizeColumnThree: 0.75,
                              ),
                              _contactThreeRow(
                                title: "อิเมล",
                                textCenter: '  ',
                                value: "scibuu.pr@gmail.com",
                                sizeColumnOne: 0.2,
                                sizeColumnTwo: 0.05,
                                sizeColumnThree: 0.75,
                              ),
                              const Center(
                                child: Text(
                                  " จันทร์ - ศุกร์ ",
                                  style: TextStyle(fontSize: sizeTextSmaller14),
                                ),
                              ),
                              const Center(
                                child: Text(
                                  " 08:00 - 16:00 น. ",
                                  style: TextStyle(fontSize: sizeTextSmaller14),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildCardSocial(
                                context,
                                iconSocial: Icons.facebook_outlined,
                                title: 'Facebook',
                                onTap: () {
                                  setState(() {
                                    launchInBrowser(Uri.parse("https://www.facebook.com/scibuu.pr/"));
                                  });
                                },
                              ),
                              buildCardSocial(
                                context,
                                iconSocial: Icons.facebook_outlined,
                                title: 'Twitter',
                                onTap: () {
                                  setState(() {
                                    launchInBrowser(Uri.parse("https://twitter.com/scibuu"));
                                  });
                                },
                              ),
                              buildCardSocial(
                                context,
                                iconSocial: Icons.facebook_outlined,
                                title: 'Instagram',
                                onTap: () {
                                  setState(() {
                                    launchInBrowser(Uri.parse("https://www.instagram.com/scibuu/?__coig_restricted=1"));
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 20),
              child: Center(
                child: ButtonCustom(
                  onPressed: () {
                    setState(() {
                      launchInBrowser(Uri.parse("https://line.me/R/ti/p/%40ffy9217v"));
                    });
                  },
                  label: "  @ffy9217v  ",
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

_contactThreeRow({
  required String title,
  required String textCenter,
  required String value,
  required double sizeColumnOne,
  required double sizeColumnTwo,
  required double sizeColumnThree,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 10.0, top: 0.0, bottom: 5.0),
    child: Table(
      border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
      columnWidths: {
        0: FractionColumnWidth(sizeColumnOne),
        1: FractionColumnWidth(sizeColumnTwo),
        2: FractionColumnWidth(sizeColumnThree)
      },
      children: [
        TableRow(children: [
          Text(
            title,
            style: const TextStyle(fontSize: sizeTextSmall16, fontWeight: FontWeight.bold),
          ),
          Text(
            textCenter,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: sizeTextSmaller14),
          ),
          Text(
            value,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: sizeTextSmaller14),
          ),
        ])
      ],
    ),
  );
}
