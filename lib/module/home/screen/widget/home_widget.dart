import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/activity/model/response/screen_status_activity.dart';
import 'package:f2fbuu/module/activity/screen/add_activity.dart';
import 'package:f2fbuu/module/activity/screen/buildlistactivity.dart';
import 'package:f2fbuu/module/home/model/response/alert_noactivity_respone.dart';
import 'package:f2fbuu/module/home/model/response/screen_home_response.dart';
import 'package:f2fbuu/module/home/screen/morescreen/more_main_screen.dart';
import 'package:f2fbuu/module/home/screen/widget/drawer_widget.dart';
import 'package:f2fbuu/module/profile/model/response/api_profile.dart';
import 'package:f2fbuu/module/profile/screen/profile_page.dart';
import 'package:flutter/material.dart';

buildContentHomeScreen(
    BuildContext context,
    void Function() toggleLanguageView,
    isHidden,
    ScreenHomeResponse? screenhomeResponse,
    ApiProfileResponse? screenprofileResponse,
    userLanguage,
    ScreenStatusActivityResponse? screenstatusActivityResponse,
    AlertNoActivityResponse? alertNoActivityResponse,
    ) {
  return WillPopScope(
    onWillPop: () async {
      return false;
    },
    child: Scaffold(
      drawer: Drawer(
        child: drawerhome(context,toggleLanguageView,isHidden, screenhomeResponse, screenprofileResponse, ),
      ),
      appBar: AppBar(
        // backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.settings, color: tcBlack),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Center(
            child: Text("${screenhomeResponse?.body?.screenInfo?.screenhome?.titlestatus}    $userLanguage",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: tcBlack))),
        actions: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          if (screenstatusActivityResponse?.body?.activity?.length.toInt() == 0)
            Expanded(
              child: Card(
                color: Colors.grey[200],
                child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: transparent),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Icon(
                          Icons.running_with_errors_outlined,
                          color: tcNoActivity,
                          size: 100,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("${alertNoActivityResponse?.body?.noactiviry}",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: tcNoActivity)),
                        SizedBox(
                          height: 5,
                        ),
                        Text("${alertNoActivityResponse?.body?.subactlineone}",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: tcNoActivity)),
                        SizedBox(
                          height: 5,
                        ),
                        Text("${alertNoActivityResponse?.body?.subactlinetwo}",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: tcNoActivity)),
                      ],
                    )),
              ),
            ),
          if (screenstatusActivityResponse?.body?.activity?.length.toInt() != 0)
            // Expanded(
            //   child: Container(
            //     color: BC_ButtonRed,
            //     height: MediaQuery.of(context).size.height,
            //     width: MediaQuery.of(context).size.width,
            //     child: Center(
            //       child: Text(
            //         "No Activity",
            //         style: TextStyle(color: Colors.white, fontSize: 20),
            //       ),
            //     ),
            //   ),
            // ),
            Expanded(
              child: Container(
                color: tcButtonTextWhite,
                // height: MediaQuery.of(context).size.height*0.1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        buildListActivity(context, screenstatusActivityResponse),
                        const SizedBox(
                            // height: MediaQuery.of(context).size.height * 0.2,
                            ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
            child: ButtonCustom(
              label: "       ${screenhomeResponse?.body?.screenInfo?.screenhome?.btnadd}      ",
              colortext: tcButtonTextBlack,
              colorbutton: tcButtonTextWhite,
              sizetext: sizeTextSmaller14,
              colorborder: tcButtonTextBoarder,
              sizeborder: 1.0,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AddActivityScreen()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),

            // padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              color: tcButtonTextWhite,
              height: 50,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: IconButton(
                    icon: const Icon(Icons.account_circle, color: Colors.black, size: 50),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
                    },
                  )),
                  Expanded(
                      child: IconButton(
                    icon: const Icon(Icons.home, color: Colors.blue, size: 50),
                    onPressed: () {},
                  )),
                  Expanded(
                      child: IconButton(
                    icon: const Icon(Icons.auto_awesome_mosaic, color: Colors.black, size: 50),
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScreenMoreMain(
                                    responseHomeMoreResponse: screenhomeResponse,
                                  )));
                    },
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
