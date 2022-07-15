import 'package:f2fbuu/customs/card/cardmore.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/home/model/response/screen_home_response.dart';
import 'package:f2fbuu/module/home/screen/morescreen/boardscreen/more_board_student_screen.dart';
import 'package:f2fbuu/module/home/screen/morescreen/boardscreen/more_board_teacher_screen.dart';
import 'package:f2fbuu/module/home/screen/morescreen/contactus_screen.dart';
import 'package:f2fbuu/module/home/screen/morescreen/faq_screen.dart';
import 'package:f2fbuu/module/home/screen/morescreen/pdpa_screen.dart';
import 'package:flutter/material.dart';

class ScreenMoreMain extends StatefulWidget {
  final ScreenHomeResponse? responseHomeMoreResponse;
  const ScreenMoreMain({
    Key? key,
    required this.responseHomeMoreResponse,
  }) : super(key: key);

  @override
  State<ScreenMoreMain> createState() => _ScreenMoreMainState();
}

class _ScreenMoreMainState extends State<ScreenMoreMain> {
  @override
  void initState() {
    super.initState();
  }

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
          icon: const Icon(
            Icons.arrow_back,
            size: sizeTitle24,
            color: Colors.black,
          ),
        ),
        title: Text(
          "${widget.responseHomeMoreResponse?.body?.screenInfo?.screenmore?.textmore}",
          style: const TextStyle(
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
                "${widget.responseHomeMoreResponse?.body?.screenInfo?.screenmore?.textboard}",
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
                        builder: (context) => const moreBoardListStudentScreen(),
                      ),
                    );
                  },
                  context,
                  title: "${widget.responseHomeMoreResponse?.body?.screenInfo?.screenmore?.btnstd}",
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
                        builder: (context) => const moreBoardListTeacherScreen(),
                      ),
                    );
                  },
                  context,
                  title: "${widget.responseHomeMoreResponse?.body?.screenInfo?.screenmore?.btntc}",
                  iconBoard: Icons.badge_outlined,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${widget.responseHomeMoreResponse?.body?.screenInfo?.screenmore?.textabdepart}",
                style: const TextStyle(
                  fontSize: sizeTextBig20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            buildCardMore(
              context: context,
              onTap: () {
                setState(() {});
              },
              title: "${widget.responseHomeMoreResponse?.body?.screenInfo?.screenmore?.btndeparthis}",
            ),
            buildCardMore(
              context: context,
              onTap: () {
                setState(() {});
              },
              title: "${widget.responseHomeMoreResponse?.body?.screenInfo?.screenmore?.btncou}",
            ),
            buildCardMore(
              context: context,
              onTap: () {
                setState(() {});
              },
              title: "${widget.responseHomeMoreResponse?.body?.screenInfo?.screenmore?.btnface}",
            ),
            buildCardMore(
              context: context,
              onTap: () {
                setState(() {});
              },
              title: "${widget.responseHomeMoreResponse?.body?.screenInfo?.screenmore?.btnweb}",
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${widget.responseHomeMoreResponse?.body?.screenInfo?.screenmore?.textsup}",
                style: const TextStyle(
                  fontSize: sizeTextBig20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            buildCardMore(
              context: context,
              title: "${widget.responseHomeMoreResponse?.body?.screenInfo?.screenmore?.btntermandcon}",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => pdpaScreen(
                        title: "${widget.responseHomeMoreResponse?.body?.screenInfo?.screenmore?.btntermandcon}"),
                  ),
                );
              },
            ),
            buildCardMore(
              context: context,
              title: "${widget.responseHomeMoreResponse?.body?.screenInfo?.screenmore?.btnfaq}",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FaqScreen(title: "${widget.responseHomeMoreResponse?.body?.screenInfo?.screenmore?.btnfaq}"),
                  ),
                );
              },
            ),
            buildCardMore(
              context: context,
              title: "${widget.responseHomeMoreResponse?.body?.screenInfo?.screenmore?.btnconus}",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactUsScreen(
                        title: "${widget.responseHomeMoreResponse?.body?.screenInfo?.screenmore?.btnconus}"),
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
