import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/activity/model/response/screen_status_activity.dart';
import 'package:f2fbuu/module/activity/screen/add_activity.dart';
import 'package:f2fbuu/module/activity/screen/buildlistactivity.dart';
import 'package:f2fbuu/module/home/bloc/homebloc/home_bloc.dart';
import 'package:f2fbuu/module/home/model/response/screen_home_response.dart';
import 'package:f2fbuu/module/home/screen/morescreen/more_main_screen.dart';
import 'package:f2fbuu/module/login/model/response/sunmit_login_response.dart';
import 'package:f2fbuu/module/profile/model/response/api_profile.dart';
import 'package:f2fbuu/module/profile/screen/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:f2fbuu/customs/button/buildbuttoncustom.dart';
import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/dialog/texterror.dart';
import 'package:f2fbuu/module/login/screen/changepasswordscreen/changepassword_screen.dart';
import 'package:f2fbuu/module/login/screen/loginscreen/login_screen.dart';
import 'package:hexcolor/hexcolor.dart';
class HomeScreen extends StatelessWidget {
  final SunmitLoginResponse? screenLoginResponse;
  final String? valueLanguage;
  const HomeScreen({Key? key, this.screenLoginResponse, this.valueLanguage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      //context.read<HomeBloc>().add(HomeScreenInfoEvent(globalkey: global_key));
      child: HomePage(screenLoginResponse: screenLoginResponse, valueLanguage: valueLanguage),
    );
    return Container();
  }
}

class HomePage extends StatefulWidget {
  final SunmitLoginResponse? screenLoginResponse;
  final String? valueLanguage;
  const HomePage({
    Key? key,
    this.screenLoginResponse,
    this.valueLanguage,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with ProgressDialog {
  ScreenHomeResponse? _screenhomeResponse;
  ApiProfileResponse? _screenprofileResponse;
  ScreenStatusActivityResponse? _screenstatusActivityResponse;
  late String keytoken;
  late String global_key;
  late String _userLanguage;
  late bool _isHidden;
  @override
  void initState() {
    super.initState();
    keytoken = "${widget.screenLoginResponse?.body?.token}";
    _setglobal_key(keytoken);
  }

  _setglobal_key(String keytoken) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('global_key', "$keytoken");
    setState(() {
      global_key = prefs.getString('global_key') ?? "$keytoken";
      _userLanguage = prefs.getString('userLanguage')!;
    });
    if (_userLanguage == "TH") {
      _isHidden = true;
    } else {
      _isHidden = false;
    }
    context.read<HomeBloc>().add(HomeScreenInfoEvent(globalkey: global_key));
  }

  void _toggleLanguageView() async {
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setString('userLanguage', "$_userLanguage");
    setState(
      () {
        _isHidden = !_isHidden;
        _isHidden
            ? context.read<HomeBloc>().add(OnClickHomeLanguageEvent(globalkey: global_key))
            : context.read<HomeBloc>().add(OnClickHomeLanguageEvent(globalkey: global_key));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
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
        if (state is OnClickScreenInfoHomeSuccessState) {
          _screenhomeResponse = state.responseScreenInfoHome;
          _screenprofileResponse = state.responseProfile;
          _screenstatusActivityResponse = state.responseActivity;
          return buildContentHomeScreen(context);
        }
        if (state is OnClickHomeLogoutState) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
            return loginScreen();
          }));
        }
      },
      builder: (context, state) {
        if (state is ScreenInfoHomeSuccessState) {
          _screenhomeResponse = state.responseScreenInfoHome;
          _screenprofileResponse = state.responseProfile;
          _screenstatusActivityResponse = state.responseActivity;
          return buildContentHomeScreen(context);
        }

        return Scaffold(
            body: Container(
          color: Colors.white,
        ));
      },
      buildWhen: (context, state) {
        return state is ScreenInfoHomeSuccessState;
      },
    );
  }

  buildContentHomeScreen(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: drawerhome(
          context,
          _screenhomeResponse,
          _screenprofileResponse,
        ),
      ),
      appBar: AppBar(
        // backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.settings, color: TC_Black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Center(
            child: Text("${_screenhomeResponse?.body?.screenInfo?.screenhome?.titlestatus} + $_userLanguage",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: TC_Black))),
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
          if (_screenstatusActivityResponse?.body?.activity?.length.toInt() == 0)
            Expanded(
              child: Card(
                color: Colors.grey[200],
                child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: transparent),
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
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: TC_NoActivity)),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Please check your internet connection",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: TC_NoActivity)),
                      ],
                    )),
              ),
            ),
          if (_screenstatusActivityResponse?.body?.activity?.length.toInt() != 0)
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
                        buildListActivity(context, _screenstatusActivityResponse),
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
              label: "     " + "  ${_screenhomeResponse?.body?.screenInfo?.screenhome?.btnadd} " + "     ",
              colortext: BC_ButtonText_style_Black,
              colorbutton: BC_ButtonText_style_White,
              sizetext: sizeTextSmaller14,
              colorborder: BC_ButtonText_style_Black_Boarder,
              sizeborder: 1.0,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => addActivity()));
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
                    icon: Icon(Icons.account_circle, color: Colors.black, size: 50),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                    },
                  )),
                  Expanded(
                      child: IconButton(
                    icon: Icon(Icons.home, color: Colors.blue, size: 50),
                    onPressed: () {},
                  )),
                  Expanded(
                      child: IconButton(
                    icon: Icon(Icons.auto_awesome_mosaic, color: Colors.black, size: 50),
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => screenMoreMain(
                                    responseHomeMore: _screenhomeResponse,
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
  }

  drawerhome(
    BuildContext context,
    ScreenHomeResponse? _screenhomeResponse,
    ApiProfileResponse? _screenprofileResponse,
  ) {
    VoidCallback? onPressed;
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                color: HexColor('${_screenprofileResponse?.body?.profileGeneralInfo?.gencolor}'),
                padding: EdgeInsets.all(20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                  _buildTableGeneralImgeinfo(
                    context,
                    _screenprofileResponse,
                    tb1: 0.65,
                    tb2: 0.05,
                    tb3: 0.3,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  _buildTableGeneralinfo(
                    context,
                    textlefttitile: '${_screenhomeResponse?.body?.screenInfo?.screenhome?.textname}',
                    textrightdetail: '${_screenprofileResponse?.body?.profileGeneralInfo?.name}' +
                        ' ' +
                        '${_screenprofileResponse?.body?.profileGeneralInfo?.surname}',
                    tb1: 0.25,
                    tb2: 0.05,
                    tb3: 0.70,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  _buildTableGeneralinfo(
                    context,
                    textlefttitile: '${_screenhomeResponse?.body?.screenInfo?.screenhome?.textnickname}',
                    textrightdetail: '${_screenprofileResponse?.body?.profileGeneralInfo?.nickname}',
                    tb1: 0.45,
                    tb2: 0.05,
                    tb3: 0.5,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  _buildTableGeneralinfo(
                    context,
                    textlefttitile: '${_screenhomeResponse?.body?.screenInfo?.screenhome?.textstdcode}',
                    textrightdetail: '${_screenprofileResponse?.body?.profileGeneralInfo?.stuCode}',
                    tb1: 0.45,
                    tb2: 0.05,
                    tb3: 0.5,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  _buildTableGeneralinfo(
                    context,
                    textlefttitile: '${_screenhomeResponse?.body?.screenInfo?.screenhome?.textemail}',
                    textrightdetail: '${_screenprofileResponse?.body?.profileGeneralInfo?.email}',
                    tb1: 0.2,
                    tb2: 0.02,
                    tb3: 0.77,
                  ),
                ]),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                color: BSC_transparent,
                padding: EdgeInsets.only(top: 0, bottom: 0, left: 15, right: 15),
                child: _buildTableGeneralinfo(
                  context,
                  textlefttitile: '${_screenhomeResponse?.body?.screenInfo?.screenhome?.textrole}',
                  textrightdetail: '${_screenprofileResponse?.body?.profileGeneralInfo?.role}',
                  tb1: 0.5,
                  tb2: 0.05,
                  tb3: 0.45,
                ),
              ),
              Container(
                width: double.infinity,
                color: BSC_transparent,
                padding: EdgeInsets.only(top: 0, bottom: 0, left: 15, right: 15),
                child: _buildTableIconLanginfo(
                  context,
                  textlefttitile: '${_screenhomeResponse?.body?.screenInfo?.screenhome?.textlang}',
                  textrightdetail: '${_screenhomeResponse?.body?.screenInfo?.screenhome?.textlangdetail}',
                  tb1: 0.5,
                  tb2: 0.00,
                  tb3: 0.55,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => changePasswordScreen()));
                },
                child: Container(
                  width: double.infinity,
                  color: BSC_transparent,
                  padding: EdgeInsets.only(top: 0, bottom: 10, left: 15, right: 15),
                  child: _buildTableGeneralinfo(
                    context,
                    textlefttitile: '${_screenhomeResponse?.body?.screenInfo?.screenhome?.btncpass}',
                    textrightdetail: '',
                    tb1: 0.5,
                    tb2: 0.05,
                    tb3: 0.45,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  dialogOneLineTwoBtn(
                      context, errchangepassword + '\n \n ' + 'Do you want to continue?', 'Confirm', 'Cancel',
                      onClickBtn: (String result) {
                    Navigator.of(context).pop();
                    switch (result) {
                      case 'Cancel':
                        {
                          break;
                        }
                      case 'OK':
                        {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => loginScreen()),
                              (Route<dynamic> route) => false);
                        }
                    }
                  });
                },
                child: Container(
                  width: double.infinity,
                  color: BSC_transparent,
                  padding: EdgeInsets.only(top: 0, bottom: 10, left: 15, right: 15),
                  child: _buildTableGeneralinfo(
                    context,
                    textlefttitile: '${_screenhomeResponse?.body?.screenInfo?.screenhome?.btndelacc}',
                    textrightdetail: '',
                    tb1: 0.5,
                    tb2: 0.05,
                    tb3: 0.45,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: BSC_transparent,
                padding: EdgeInsets.only(top: 0, bottom: 15, left: 15, right: 15),
                child: _buildTableGeneralinfo(
                  context,
                  textlefttitile: '${_screenhomeResponse?.body?.screenInfo?.screenhome?.textappver}',
                  textrightdetail: '${_screenhomeResponse?.body?.vs}',
                  tb1: 0.5,
                  tb2: 0.05,
                  tb3: 0.45,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 15, right: 15),
                child: buildButtonCustom(
                  onPressed: () {
                    dialogOneLineTwoBtn(context, errlogout + '\n \n ' + 'Do you want to continue?', 'Confirm', 'Cancel',
                        onClickBtn: (String result) {
                      Navigator.of(context).pop();
                      switch (result) {
                        case 'Cancel':
                          {
                            break;
                          }
                        case 'OK':
                          {
                            context.read<HomeBloc>().add(OnClickHomeLogoutEvent(globalkey: global_key));
                          }
                      }
                    });
                  },
                  label: "  ${_screenhomeResponse?.body?.screenInfo?.screenhome?.btnlogout}  ",
                  colortext: BC_ButtonLogout,
                  colorbutton: BC_ButtonText_style_White,
                  sizetext: sizeTextBig20,
                  colorborder: BC_ButtonLogout,
                  iconlabel: Icons.exit_to_app,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildTableGeneralImgeinfo(BuildContext context, ApiProfileResponse? _screenprofileResponse,
      {required tb1, required tb2, required tb3}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Table(
        border: TableBorder.symmetric(outside: BorderSide(width: 2, color: Colors.transparent)),
        columnWidths: {0: FractionColumnWidth(tb1), 1: FractionColumnWidth(tb2), 2: FractionColumnWidth(tb3)},
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${_screenprofileResponse?.body?.profileGeneralInfo?.gen}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Table(children: [
                  TableRow(children: [
                    Text(
                      '${_screenprofileResponse?.body?.profileGeneralInfo?.genname}',
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 18),
                    ),
                  ]),
                ]),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            _screenprofileResponse?.body?.profileGeneralInfo?.img != null
                ? CircleAvatar(
                    radius: 35.0,
                    backgroundImage: NetworkImage("${_screenprofileResponse?.body?.profileGeneralInfo?.img}"),
                  )
                : CircleAvatar(
                    radius: 35.0,
                    backgroundImage: AssetImage(
                      'assets/logo/profile.png',
                    ),
                  ),
          ])
        ],
      ),
    );
  }

  _buildTableGeneralinfo(
    BuildContext context, {
    required textlefttitile,
    required String textrightdetail,
    required tb1,
    required tb2,
    required tb3,
  }) {
    return Table(
      border: TableBorder.symmetric(outside: BorderSide(width: 2, color: Colors.transparent)),
      columnWidths: {0: FractionColumnWidth(tb1), 1: FractionColumnWidth(tb2), 2: FractionColumnWidth(tb3)},
      defaultVerticalAlignment: TableCellVerticalAlignment.top,
      children: [
        TableRow(children: [
          Text(
            textlefttitile,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: sizeTextSmaller14, fontWeight: FontWeight.bold),
          ),
          SizedBox(),
          Text(
            textrightdetail,
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: sizeTextSmaller14),
          ),
        ])
      ],
    );
  }

  _buildTableIconLanginfo(
    BuildContext context, {
    required String textlefttitile,
    required String textrightdetail,
    required tb1,
    required tb2,
    required tb3,
  }) {
    bool _isVisible = false;
    VoidCallback? onPressed;

    return Table(
      border: TableBorder.symmetric(outside: BorderSide(width: 2, color: Colors.transparent)),
      columnWidths: {0: FractionColumnWidth(tb1), 1: FractionColumnWidth(tb2), 2: FractionColumnWidth(tb3)},
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(children: [
          Text(
            textlefttitile,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: sizeTextSmaller14, fontWeight: FontWeight.bold),
          ),
          SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                textrightdetail,
                style: TextStyle(fontSize: sizeTextSmaller14),
              ),
              //
              // _toggle(),
              IconButton(
                  onPressed: _toggleLanguageView,
                  icon: _isHidden
                      ? Icon(Icons.toggle_on, color: Color(0xFF00A80A))
                      : Icon(Icons.toggle_off, color: Color(0xFF4F4F4F)))
              // IconButton(
              //     onPressed: () {
              //       _isVisible = !_isVisible;
              //     },
              //     icon: _isVisible
              //         ? Icon(Icons.toggle_off, color: Color(0xFF4F4F4F))
              //         : Icon(Icons.toggle_on, color: Color(0xFF00A80A))),
            ],
          ),
        ])
      ],
    );
  }
}
