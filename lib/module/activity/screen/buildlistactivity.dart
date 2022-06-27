import 'package:f2fbuu/module/activity/module/activity/screen/buildlistactivity.dart

import 'package:f2fbuu/module/activity/model/response/screen_status_activity.dart';
import 'package:f2fbuu/module/activity/screen/activitydetailscreen.dart';
import 'package:f2fbuu/module/home/bloc/itemactivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



BuildListActivity(BuildContext context,
    ScreenStatusActivityResponse? screenstatusActivityResponse) {

  return SingleChildScrollView(
    padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
    scrollDirection: Axis.vertical,
    child: Column(
        children: List.generate(
            int.parse("${screenstatusActivityResponse?.body?.activity?.length}"),
            (index) => ItemActivity(
                  data: screenstatusActivityResponse?.body?.activity?[index],
                  title: screenstatusActivityResponse?.body?.screeninfo,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ActivityDetailScreen(
                          title: screenstatusActivityResponse?.body?.screeninfo,
                          data: screenstatusActivityResponse?.body?.activity?[index]);
                    }));
                  },
                ))),
  );
}
