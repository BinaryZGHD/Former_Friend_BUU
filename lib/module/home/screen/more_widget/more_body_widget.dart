import 'package:f2fbuu/customs/card/cardmore.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
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
        "${screenMoreResponse?.body?.screenInfo?.textmore}",
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
                "${screenMoreResponse?.body?.screenInfo?.textboard}",
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
                  title: "${screenMoreResponse?.body?.screenInfo?.btnstd}",
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
                  title: "${screenMoreResponse?.body?.screenInfo?.btntc}",
                  iconBoard: Icons.badge_outlined,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: Text(
                "${screenMoreResponse?.body?.screenInfo?.textabdepart}",
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

              title: "${screenMoreResponse?.body?.screenInfo?.btndeparthis}",
            ),
            buildCardMore(
              context: context,
              onTap: () {
                setState(() {
                  launchInBrowser(Uri.parse("${screenMoreResponse?.body?.luksuitUrl}"));
                });
              },

              title: "${screenMoreResponse?.body?.screenInfo?.btncou}",
            ),
            buildCardMore(
              context: context,
              onTap: () {
                setState(() {
                  launchInBrowser(Uri.parse("${screenMoreResponse?.body?.facebookUrl}"));
                });
              },

              title: "${screenMoreResponse?.body?.screenInfo?.btnface}",
            ),
            buildCardMore(
              context: context,
              onTap: () {
                setState(() {
                  launchInBrowser(Uri.parse("${screenMoreResponse?.body?.websiteUrl}"));
                });
              },
              title: "${screenMoreResponse?.body?.screenInfo?.btnweb}",
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: Text(
                "${screenMoreResponse?.body?.screenInfo?.textsup}",
                style: const TextStyle(
                  fontSize: sizeTextBig20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            buildCardMore(
              context: context,
              title: "${screenMoreResponse?.body?.screenInfo?.btntermandcon}",
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
              title: "${screenMoreResponse?.body?.screenInfo?.btnfaq}",
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
              title: "${screenMoreResponse?.body?.screenInfo?.btnconus}",
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
