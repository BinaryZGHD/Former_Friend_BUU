import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../customs/color/colorconts.dart';
import '../../../../customs/size/size.dart';
import 'cardmore.dart';

class MoreMainScreen extends StatelessWidget {
  const MoreMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _FMoreMainScreen();
  }
}

class _FMoreMainScreen extends StatefulWidget {
  const _FMoreMainScreen({Key? key}) : super(key: key);

  @override
  State<_FMoreMainScreen> createState() => _FMoreMainScreenState();
}

class _FMoreMainScreenState extends State<_FMoreMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundAppBar,
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
          "Register",
          style: TextStyle(
            color: Colors.black,
            fontSize: sizeTitle24,
          ),
        ),
      ),
      body: Container(
        // color: TC_regiter,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Board",
                style: TextStyle(
                  fontSize: sizeTextBig20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.3,
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: BC_ButtonRed),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            children: [
                              Icon(
                                Icons.auto_stories_rounded,
                                color: Colors.white,
                                size: MediaQuery.of(context).size.width * 0.2,
                              ),
                              Text(
                                "Student",
                                style: TextStyle(
                                  fontSize: sizeTextBig20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ))),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.3,
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: BC_ButtonRed),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            children: [
                              Icon(
                                Icons.auto_stories_rounded,
                                color: Colors.white,
                                size: MediaQuery.of(context).size.width * 0.2,
                              ),
                              Text(
                                "Teacher",
                                style: TextStyle(
                                  fontSize: sizeTextBig20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "About department",
                style: TextStyle(
                  fontSize: sizeTextBig20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            CardMore(title: "Department history"),
            CardMore(title: "Course"),
            CardMore(title: "Facebook"),
            CardMore(title: "Website"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Support",
                style: TextStyle(
                  fontSize: sizeTextBig20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            CardMore(title: "Terms and conditions"),
            CardMore(title: "FAQ"),
            CardMore(title: "Contact us")
          ]),
        ),
      ),
    );
  }
}
