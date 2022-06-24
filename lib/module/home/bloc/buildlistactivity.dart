import 'package:f2fbuu/customs/button/box.dart';
import 'package:f2fbuu/module/home/model/response/screen_home.dart';
import 'package:f2fbuu/module/activity/screen/activitydetailscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'itemactivity.dart';

BuildListActivity(BuildContext context, ScreenHomeResponse? _screenhomeResponse) {
  return SingleChildScrollView(
    padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
    scrollDirection: Axis.vertical,
    child: Column(
        children: List.generate(
            int.parse("${_screenhomeResponse?.body?.dataListActivity?.length}"),
            (index) => ItemActivity(
                  data: _screenhomeResponse?.body?.dataListActivity?[index],
                  title: _screenhomeResponse?.body?.screeninfo,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ActivityDetailScreen(
                          title: _screenhomeResponse?.body?.screeninfo,
                          data: _screenhomeResponse?.body?.dataListActivity?[index],);
                    }));
                  },
                ))),
  );
}
