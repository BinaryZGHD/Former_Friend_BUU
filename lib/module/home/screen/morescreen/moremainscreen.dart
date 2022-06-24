import 'package:f2fbuu/module/home/model/response/screen_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../customs/card/card_build_board.dart';
import '../../../../customs/color/colorconts.dart';
import '../../../../customs/size/size.dart';

import 'cardmore.dart';

class MoreMainScreen extends StatefulWidget {
  final ScreenHomeResponse? responseHomeMore;
  MoreMainScreen( {
    Key? key,required this.responseHomeMore,
  }) : super(key: key);

  @override
  State<MoreMainScreen> createState() => _MoreMainScreenState();
}


class _MoreMainScreenState extends State<MoreMainScreen> {
  var _screenhomeResponse;
  @override
  void initState() {
    _screenhomeResponse = widget.responseHomeMore;
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
                buildBoard(
                  context,
                  titile: "${_screenhomeResponse?.body?.screenInfo?.screenmore?.btnstd}",
                  IconBoard: Icons.auto_stories_outlined,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                buildBoard(
                  context,
                  titile: "${_screenhomeResponse?.body?.screenInfo?.screenmore?.btntc}",
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
            CardMore(
              title: "${_screenhomeResponse?.body?.screenInfo?.screenmore?..btndeparthis}",
              URL: "${_screenhomeResponse?.body?.pavatUrl}",
            ),
            CardMore(
              title: "${_screenhomeResponse?.body?.screenInfo?.screenmore?..btncou}",
              URL: "${_screenhomeResponse?.body?.luksuitUrl}",
            ),
            CardMore(
              title: "${_screenhomeResponse?.body?.screenInfo?.screenmore?..btnface}",
              URL: "${_screenhomeResponse?.body?.facebookUrl}",
            ),
            CardMore(
              title: "${_screenhomeResponse?.body?.screenInfo?.screenmore?.btnweb}",
              URL: "${_screenhomeResponse?.body?.websiteUrl}",
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
            CardMore(
              title: "${_screenhomeResponse?.body?.screenInfo?.screenmore?.btntermandcon}",
              URL: 'https://flutter.dev',
            ),
            CardMore(
              title: "${_screenhomeResponse?.body?.screenInfo?.screenmore?..btnfaq}",
              URL: 'https://flutter.dev',
            ),
            CardMore(
              title: "${_screenhomeResponse?.body?.screenInfo?.screenmore?.btnconus}",
              URL: '',
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
