import 'package:f2fbuu/module/activity/model/response/screen_status_activity.dart';
import 'package:f2fbuu/module/activity/screen/activitydetailscreen.dart';
import 'package:f2fbuu/module/activity/screen/itemactivity.dart';
import 'package:f2fbuu/module/home/bloc/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'activitydetailscreen.dart';
import 'itemactivity.dart';

buildListActivity(BuildContext context,
    ScreenStatusActivityResponse? screenstatusActivityResponse) {
  return SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
    scrollDirection: Axis.vertical,
    child: Column(
        children: List.generate(
            int.parse(
                "${screenstatusActivityResponse?.body?.activity?.length}"),
            (index) => ItemActivity(
                  data: screenstatusActivityResponse?.body?.activity?[index],
                  title: screenstatusActivityResponse?.body?.screeninfo,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ActivityDetailScreen(
                          title: screenstatusActivityResponse?.body?.screeninfo,
                          data: screenstatusActivityResponse
                              ?.body?.activity?[index]);
                    })).then((value) =>
                        {context.read<HomeBloc>().add(HomeScreenInfoEvent())});
                  },
                ))),
  );
}
