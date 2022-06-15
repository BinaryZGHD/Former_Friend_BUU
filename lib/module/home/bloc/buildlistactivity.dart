
import 'package:f2fbuu/module/home/screen/activitydetailscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../customs/button/box.dart';
import '../../../customs/dialog/dialogboxcutom.dart';
import '../screen/homescreen.dart';
import 'data.dart';
import 'itemactivity.dart';

class BuildListActivity extends StatefulWidget {
  const BuildListActivity({Key? key}) : super(key: key);

  @override
  State<BuildListActivity> createState() => _BuildListActivityState();
}

class _BuildListActivityState extends State<BuildListActivity> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 15),
      scrollDirection: Axis.vertical,
      child: Column(
          children: List.generate(
              recommends.length,
              (index) => ItemActivity(
                    data: recommends[index],
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => CustomDialogBox(
                                id: '${index}',
                                title: 'สถานะการทำกิจกรรมของคุณคือ',
                                description: 'กิจกรรมที่ทำแล้ว',
                                mapscreen: HomeScreen(),
                              ));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return ActivityDetailScreen(id: recommends[index]['id'], data: recommends[index]);
                          }));
                    },
                  ))),
    );
  }
}
