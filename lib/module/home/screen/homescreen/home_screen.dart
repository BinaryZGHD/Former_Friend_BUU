import 'dart:convert';

import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/activity/model/response/screen_status_activity.dart';
import 'package:f2fbuu/module/activity/screen/add_activity.dart';
import 'package:f2fbuu/module/home/bloc/buildlistactivity.dart';
import 'package:f2fbuu/module/home/bloc/homebloc/home_bloc.dart';
import 'package:f2fbuu/module/home/model/response/screen_home_response.dart';
import 'package:f2fbuu/module/home/screen/homescreen/home_drawer.dart';
import 'package:f2fbuu/module/home/screen/morescreen/more_main_screen.dart';
import 'package:f2fbuu/module/profile/model/response/api_profile.dart';
import 'package:f2fbuu/module/profile/screen/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with ProgressDialog {
  ScreenHomeResponse? _screenhomeResponse;
  ApiProfileResponse? _screenprofileResponse;
  ScreenStatusActivityResponse? _screenstatusActivityResponse;

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(HomeScreenInfoEvent());

    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeLoading) {
          showProgressDialog(context);
        }
        if (state is HomeEndLoading) {
          hideProgressDialog(context);
        }
        if (state is HomeError) {
          // show dialog error
          print(state.message);
        }
      },
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state is HomeScreenInfoSuccessState) {
            _screenhomeResponse = state.responseHome;
            _screenprofileResponse = state.responseProfile;
            _screenstatusActivityResponse = state.responseActivity;

            // print("length == " + "${_screenstatusActivityResponse?.body?.activity[0]?.name}");
            // print(JsonEncoder( ).convert(_screenstatusActivityResponse?.body?.activity));
            return Scaffold(
              drawer: Drawer(
                child: drawerhome(
                    context, _screenhomeResponse, _screenprofileResponse),
              ),
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(Icons.settings, color: TC_Black),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    );
                  },
                ),
                title: Center(
                    child: Text(
                        "${_screenhomeResponse?.body?.screenInfo?.screenhome?.titlestatus}",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: TC_Black))),
                actions: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                ],
              ),
              body: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  if (_screenstatusActivityResponse?.body?.activity?.length
                          .toInt() ==
                      0)
                    Expanded(
                      child: Card(
                        color: Colors.grey[200],
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: transparent),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error,
                                  color: TC_NoActivity,
                                  size: 100,
                                ),
                                Text("No Activity",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: TC_NoActivity)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Please check your internet connection",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: TC_NoActivity)),
                              ],
                            )),
                      ),
                    ),
                  if (_screenstatusActivityResponse?.body?.activity?.length
                          .toInt() !=
                      0)
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
                        color: BC_ButtonText_style_White,
                        // height: MediaQuery.of(context).size.height*0.1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                buildListActivity(
                                    context, _screenstatusActivityResponse),
                                SizedBox(
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
                      label: "     " +
                          "  ${_screenhomeResponse?.body?.screenInfo?.screenhome?.btnadd} " +
                          "     ",
                      colortext: TC_Black,
                      colorbutton: BC_ButtonText_style_White,
                      sizetext: sizeTextSmaller14,
                      colorborder: BSC_Black,
                      sizeborder: 0.0,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => addActivity()));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),

                    // padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      color: BC_ButtonText_style_White,
                      height: 50,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: IconButton(
                            icon: Icon(Icons.account_circle,
                                color: Colors.black, size: 50),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfileScreen()));
                            },
                          )),
                          Expanded(
                              child: IconButton(
                            icon:
                                Icon(Icons.home, color: Colors.blue, size: 50),
                            onPressed: () {},
                          )),
                          Expanded(
                              child: IconButton(
                            icon: Icon(Icons.auto_awesome_mosaic,
                                color: Colors.black, size: 50),
                            onPressed: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => screenMoreMain(
                                            responseHomeMore:
                                                _screenhomeResponse,
                                          )));
                            },
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
