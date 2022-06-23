import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpurl;
import '../../../../customs/card/card_build_board.dart';
import '../../../../customs/color/colorconts.dart';
import '../../../../customs/size/size.dart';
import '../../model/response/screen_homemore.dart';
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
  ScreenHomeMoreResponse? _dataFromAPIHomeMorewording;
  @override
  void initState() {
    super.initState();
    getAPIRegisterWording();
  }

  Future<ScreenHomeMoreResponse?> getAPIRegisterWording() async {
    // print("เรียกใช้ Get_Coin_price");
    var url = Uri.parse("https://webzbinaryz.web.app/v1/api/modules/home/wording/more");
    var response = await httpurl.get(url, headers: <String, String>{});

    _dataFromAPIHomeMorewording = screenhomemoreResponseFromJson(utf8.decode(response.bodyBytes));
    // print(response.body);
    // // print(_dataFromAPI?.head?.message);// get the data from the api
    // print(_dataFromAPIRegisterWording?.body?.screeninfo?.textreghead);// get the data from the api
    return _dataFromAPIHomeMorewording;

    // log(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAPIRegisterWording(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
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
                "${_dataFromAPIHomeMorewording?.body?.screeninfo?.textmore}",
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
                      "${_dataFromAPIHomeMorewording?.body?.screeninfo?.textboard}",
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
                        titile: "${_dataFromAPIHomeMorewording?.body?.screeninfo?.btnstd}",
                        IconBoard: Icons.auto_stories_outlined,

                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      buildBoard(
                        context,
                        titile: "${_dataFromAPIHomeMorewording?.body?.screeninfo?.btntc}",
                        IconBoard: Icons.badge_outlined,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${_dataFromAPIHomeMorewording?.body?.screeninfo?.textabdepart}",
                      style: TextStyle(
                        fontSize: sizeTextBig20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  CardMore(
                    title: "${_dataFromAPIHomeMorewording?.body?.screeninfo?.btndeparthis}",
                    URL: "${_dataFromAPIHomeMorewording?.body?.pavatUrl}",
                  ),
                  CardMore(
                    title: "${_dataFromAPIHomeMorewording?.body?.screeninfo?.btncou}",
                    URL: "${_dataFromAPIHomeMorewording?.body?.luksuitUrl}",
                  ),
                  CardMore(
                    title: "${_dataFromAPIHomeMorewording?.body?.screeninfo?.btnface}",
                    URL: "${_dataFromAPIHomeMorewording?.body?.facebookUrl}",
                  ),
                  CardMore(
                    title: "${_dataFromAPIHomeMorewording?.body?.screeninfo?.btnweb}",
                    URL: "${_dataFromAPIHomeMorewording?.body?.websiteUrl}",
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${_dataFromAPIHomeMorewording?.body?.screeninfo?.textsup}",
                      style: TextStyle(
                        fontSize: sizeTextBig20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  CardMore(
                    title: "${_dataFromAPIHomeMorewording?.body?.screeninfo?.btntermandcon}",
                    URL: 'https://flutter.dev',
                  ),
                  CardMore(
                    title: "${_dataFromAPIHomeMorewording?.body?.screeninfo?.btnfaq}",
                    URL: 'https://flutter.dev',
                  ),
                  CardMore(
                    title: "${_dataFromAPIHomeMorewording?.body?.screeninfo?.btnconus}",
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
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
