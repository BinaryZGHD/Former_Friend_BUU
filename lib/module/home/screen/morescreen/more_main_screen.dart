import 'package:f2fbuu/customs/card/cardmore.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/home/model/response/screen_home_response.dart';
import 'package:f2fbuu/module/home/screen/morescreen/boardscreen/more_board_student_screen.dart';
import 'package:f2fbuu/module/home/screen/morescreen/boardscreen/more_board_teacher_screen.dart';
import 'package:f2fbuu/module/home/screen/morescreen/contactus_screen.dart';
import 'package:f2fbuu/module/home/screen/morescreen/faq_screen.dart';
import 'package:f2fbuu/module/home/screen/morescreen/pdpa_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class screenMoreMain extends StatefulWidget {
  final ScreenHomeResponse? responseHomeMore;
  screenMoreMain({
    Key? key,
    required this.responseHomeMore,
  }) : super(key: key);

  @override
  State<screenMoreMain> createState() => _screenMoreMainState();
}

class _screenMoreMainState extends State<screenMoreMain> {
  var _screenhomeResponse;
  @override
  void initState() {
    _screenhomeResponse = widget.responseHomeMore;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<void>? _launched;

    Future<void> _launchInBrowser(Uri url) async {
      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      )) {
        throw 'Could not launch $url';
      }
    }

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
          "${_screenhomeResponse?.body?.screenInfo?.screenmore?.textmore}",
          style: TextStyle(
            color: Colors.black,
            fontSize: sizeTitle24,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[100],
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${_screenhomeResponse?.body?.screenInfo?.screenmore?.textboard}",
                style: TextStyle(
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
                        builder: (context) => moreBoardListStudentScreen(),
                      ),
                    );
                  },
                  context,
                  title: "${_screenhomeResponse?.body?.screenInfo?.screenmore?.btnstd}",
                  IconBoard: Icons.auto_stories_outlined,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                buildCardBoard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => moreBoardListTeacherScreen(),
                      ),
                    );
                  },
                  context,
                  title: "${_screenhomeResponse?.body?.screenInfo?.screenmore?.btntc}",
                  IconBoard: Icons.badge_outlined,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${_screenhomeResponse?.body?.screenInfo?.screenmore?.textabdepart}",
                style: TextStyle(
                  fontSize: sizeTextBig20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            buildCardMore(
              context: context,
              onTap: () {
                setState(() {
                  _launched = _launchInBrowser(Uri.parse("${_screenhomeResponse?.body?.pavatUrl}"));
                });
              },
              title: "${_screenhomeResponse?.body?.screenInfo?.screenmore?.btndeparthis}",
            ),
            buildCardMore(
              context: context,
              onTap: () {
                setState(() {
                  _launched = _launchInBrowser(Uri.parse("${_screenhomeResponse?.body?.luksuitUrl}"));
                });
              },
              title: "${_screenhomeResponse?.body?.screenInfo?.screenmore?.btncou}",
            ),
            buildCardMore(
              context: context,
              onTap: () {
                setState(() {
                  _launched = _launchInBrowser(Uri.parse("${_screenhomeResponse?.body?.facebookUrl}"));
                });
              },
              title: "${_screenhomeResponse?.body?.screenInfo?.screenmore?.btnface}",
            ),
            buildCardMore(
              context: context,
              onTap: () {
                setState(() {
                  _launched = _launchInBrowser(Uri.parse("${_screenhomeResponse?.body?.websiteUrl}"));
                });
              },
              title: "${_screenhomeResponse?.body?.screenInfo?.screenmore?.btnweb}",
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${_screenhomeResponse?.body?.screenInfo?.screenmore?.textsup}",
                style: TextStyle(
                  fontSize: sizeTextBig20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            buildCardMore(
              context: context,
              title: "${_screenhomeResponse?.body?.screenInfo?.screenmore?.btntermandcon}",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => pdpaScreen(title: "${_screenhomeResponse?.body?.screenInfo?.screenmore?.btntermandcon}"),
                  ),
                );
              },
            ),
            buildCardMore(
              context: context,
              title: "${_screenhomeResponse?.body?.screenInfo?.screenmore?.btnfaq}",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => faqScreen(title: "${_screenhomeResponse?.body?.screenInfo?.screenmore?.btnfaq}"),
                  ),
                );
              },
            ),
            buildCardMore(
              context: context,
              title: "${_screenhomeResponse?.body?.screenInfo?.screenmore?.btnconus}",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => contactUsScreen(title: "${_screenhomeResponse?.body?.screenInfo?.screenmore?.btnconus}"),
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
    );
  }
}
