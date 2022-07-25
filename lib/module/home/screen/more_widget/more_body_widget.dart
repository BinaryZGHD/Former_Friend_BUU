import 'package:f2fbuu/customs/card/card_more.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/message/text_message.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/home/model/response/more_response/screen_more_response.dart';
import 'package:f2fbuu/module/home/screen/more_screen/board_screen/more_board_student_list_gen_screen.dart';
import 'package:f2fbuu/module/home/screen/more_screen/board_screen/more_board_teacher_screen.dart';
import 'package:f2fbuu/module/home/screen/more_screen/contact_us_screen.dart';
import 'package:f2fbuu/module/home/screen/more_screen/faq_screen.dart';
import 'package:f2fbuu/module/home/screen/more_screen/pdpa_screen.dart';
import 'package:flutter/material.dart';
moreBodyWidget(BuildContext context, ScreenMoreResponse? screenMoreResponse,Future<void> Function(Uri url) launchInBrowser,setState) {
  return   Scaffold(
    appBar: AppBar(
      backgroundColor: backgroundAppBar,
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
      title: Text(
        screenMoreResponse?.body?.screenInfo?.textmore?? moreTitleMore,
        style: const TextStyle(
          color: Colors.black,
          fontSize: sizeTitle24,
        ),
      ),
    ),
    body: SafeArea(

      child: Container(
        color: Colors.grey[100],
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: Text(
                screenMoreResponse?.body?.screenInfo?.textboard?? moreSubTitleBoard,
                style: const TextStyle(
                  fontSize: sizeTextBig20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildCardBoard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MoreBoardListStudentListGenScreen(),
                      ),
                    );
                  },
                  context,
                  title: screenMoreResponse?.body?.screenInfo?.btnstd?? moreBtnStd,
                  iconBoard: Icons.auto_stories_outlined,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                buildCardBoard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MoreBoardListTeacherScreen(),
                      ),
                    );
                  },
                  context,
                  title: screenMoreResponse?.body?.screenInfo?.btntc?? moreBtnTc,
                  iconBoard: Icons.badge_outlined,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: Text(
                screenMoreResponse?.body?.screenInfo?.textabdepart ??moreSubTitleDepart,
                style: const TextStyle(
                  fontSize: sizeTextBig20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            buildCardMore(
              context: context,
              onTap: () {
                setState(() {
                  launchInBrowser(Uri.parse("${screenMoreResponse?.body?.pavatUrl}"));
                });
              },

              title: screenMoreResponse?.body?.screenInfo?.btndeparthis?? moreBtnDepartHis,
            ),
            buildCardMore(
              context: context,
              onTap: () {
                setState(() {
                  launchInBrowser(Uri.parse("${screenMoreResponse?.body?.luksuitUrl}"));
                });
              },

              title: screenMoreResponse?.body?.screenInfo?.btncou?? moreBtnCou,
            ),
            buildCardMore(
              context: context,
              onTap: () {
                setState(() {
                  launchInBrowser(Uri.parse("${screenMoreResponse?.body?.facebookUrl}"));
                });
              },

              title: screenMoreResponse?.body?.screenInfo?.btnface??moreBtnFace,
            ),
            buildCardMore(
              context: context,
              onTap: () {
                setState(() {
                  launchInBrowser(Uri.parse("${screenMoreResponse?.body?.websiteUrl}"));
                });
              },
              title: screenMoreResponse?.body?.screenInfo?.btnweb??moreBtnWeb,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: Text(
                screenMoreResponse?.body?.screenInfo?.textsup??moreSubTitleSup,
                style: const TextStyle(
                  fontSize: sizeTextBig20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            buildCardMore(
              context: context,
              title: screenMoreResponse?.body?.screenInfo?.btntermandcon??moreBtnTermAndCon,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const PDPAScreen(),
                  ),
                );
              },
            ),
            buildCardMore(
              context: context,
              title: screenMoreResponse?.body?.screenInfo?.btnfaq??moreBtnFaq,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const FaqScreen(),
                  ),
                );
              },
            ),
            buildCardMore(
              context: context,
              title: screenMoreResponse?.body?.screenInfo?.btnconus?? moreBtnContactus,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const ContactUsScreen(),
                  ),
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
          ]),
        ),
      ),
    )
  );
}
