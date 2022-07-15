import 'package:f2fbuu/customs/button/button_icon_text.dart';
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
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/dialog/texterror.dart';
import 'package:f2fbuu/module/login/screen/changepasswordscreen/changepassword_screen.dart';
import 'package:f2fbuu/module/login/screen/loginscreen/login_screen.dart';
import 'package:hexcolor/hexcolor.dart';
class HomeScreen extends StatelessWidget {
  final SunmitLoginResponse? screenLoginResponse;
  const HomeScreen({Key? key, this.screenLoginResponse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      //context.read<HomeBloc>().add(HomeScreenInfoEvent(globalkey: global_key));
      child: HomePage(screenLoginResponse: screenLoginResponse),
    );
  }
}

class HomePage extends StatefulWidget {
  final SunmitLoginResponse? screenLoginResponse;
  const HomePage({
    Key? key,
    this.screenLoginResponse,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with ProgressDialog {
  ScreenHomeResponse? _screenhomeResponse;
  ApiProfileResponse? _screenprofileResponse;
  ScreenStatusActivityResponse? _screenstatusActivityResponse;
  late String keytoken;
  late String _userLanguage;
  late bool _isHidden;
  @override
  void initState() {
    super.initState();
    keytoken = "${widget.screenLoginResponse?.body?.token}";
    _setGlobalkey(keytoken);
  }

  _setGlobalkey(String keytoken) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('globalKey', keytoken);
    setState(() {
      _userLanguage = prefs.getString('userLanguage')!;
    });
    if (_userLanguage == "TH") {
      _isHidden = true;
    } else {
      _isHidden = false;
    }
    context.read<HomeBloc>().add(HomeScreenInfoEvent());
  }

  void _toggleLanguageView() async {
    final prefs = await SharedPreferences.getInstance();

    setState(
      () {
        _isHidden = !_isHidden;
        _isHidden
            ? _userLanguage = "TH"
            : _userLanguage = "EN";
        context.read<HomeBloc>().add(OnClickHomeLanguageEvent(userLanguage:_userLanguage));
        // _isHidden
        //     ? context.read<HomeBloc>().add(OnClickHomeLanguageEvent(userLanguage:_userLanguage))
        //     : context.read<HomeBloc>().add(OnClickHomeLanguageEvent(userLanguage:_userLanguage));
      },
    );
    await prefs.setString('userLanguage', _userLanguage);
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
          if (kDebugMode) {
            print(state.message);
          }
        }
        if (state is OnClickScreenInfoHomeSuccessState) {
          _screenhomeResponse = state.responseScreenInfoHome;
          _screenprofileResponse = state.responseProfile;
          _screenstatusActivityResponse = state.responseActivity;
           buildContentHomeScreen(context);
        }
        if (state is OnClickHomeLogoutState) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()));

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
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
                icon: const Icon(Icons.settings, color: tcBlack),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Center(
              child: Text("${_screenhomeResponse?.body?.screenInfo?.screenhome?.titlestatus} + $_userLanguage",
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
            if (_screenstatusActivityResponse?.body?.activity?.length.toInt() == 0)
              Expanded(
                child: Card(
                  color: Colors.grey[200],
                  child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: transparent),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.error,
                            color: tcNoActivity,
                            size: 100,
                          ),
                          Text("No Activity",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: tcNoActivity)),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Please check your internet connection",
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: tcNoActivity)),
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
                  color: tcButtonTextWhite,
                  // height: MediaQuery.of(context).size.height*0.1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          buildListActivity(context, _screenstatusActivityResponse),
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
                label: "       ${_screenhomeResponse?.body?.screenInfo?.screenhome?.btnadd}      ",
                colortext: tcButtonTextBlack,
                colorbutton: tcButtonTextWhite,
                sizetext: sizeTextSmaller14,
                colorborder: tcButtonTextBoarder,
                sizeborder: 1.0,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const addActivity()));
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
                                      responseHomeMoreResponse: _screenhomeResponse,
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

  drawerhome(
    BuildContext context,
    ScreenHomeResponse? screenhomeResponse,
    ApiProfileResponse? screenprofileResponse,
  ) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              color: HexColor('${screenprofileResponse?.body?.profileGeneralInfo?.gencolor}'),
              padding: const EdgeInsets.all(20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                _buildTableGeneralImgeinfo(
                  context,
                  screenprofileResponse,
                  tb1: 0.65,
                  tb2: 0.05,
                  tb3: 0.3,
                ),
                const SizedBox(
                  height: 5,
                ),
                _buildTableGeneralinfo(
                  context,
                  textlefttitile: '${screenhomeResponse?.body?.screenInfo?.screenhome?.textname}',
                  textrightdetail: '${screenprofileResponse?.body?.profileGeneralInfo?.name} ${screenprofileResponse?.body?.profileGeneralInfo?.surname}',
                  tb1: 0.25,
                  tb2: 0.05,
                  tb3: 0.70,
                ),
                const SizedBox(
                  height: 5,
                ),
                _buildTableGeneralinfo(
                  context,
                  textlefttitile: '${screenhomeResponse?.body?.screenInfo?.screenhome?.textnickname}',
                  textrightdetail: '${screenprofileResponse?.body?.profileGeneralInfo?.nickname}',
                  tb1: 0.45,
                  tb2: 0.05,
                  tb3: 0.5,
                ),
                const SizedBox(
                  height: 5,
                ),
                _buildTableGeneralinfo(
                  context,
                  textlefttitile: '${screenhomeResponse?.body?.screenInfo?.screenhome?.textstdcode}',
                  textrightdetail: '${screenprofileResponse?.body?.profileGeneralInfo?.stuCode}',
                  tb1: 0.45,
                  tb2: 0.05,
                  tb3: 0.5,
                ),
                const SizedBox(
                  height: 5,
                ),
                _buildTableGeneralinfo(
                  context,
                  textlefttitile: '${screenhomeResponse?.body?.screenInfo?.screenhome?.textemail}',
                  textrightdetail: '${screenprofileResponse?.body?.profileGeneralInfo?.email}',
                  tb1: 0.2,
                  tb2: 0.02,
                  tb3: 0.77,
                ),
              ]),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              color: bscTransparent,
              padding: const EdgeInsets.only(top: 0, bottom: 0, left: 15, right: 15),
              child: _buildTableGeneralinfo(
                context,
                textlefttitile: '${screenhomeResponse?.body?.screenInfo?.screenhome?.textrole}',
                textrightdetail: '${screenprofileResponse?.body?.profileGeneralInfo?.role}',
                tb1: 0.5,
                tb2: 0.05,
                tb3: 0.45,
              ),
            ),
            Container(
              width: double.infinity,
              color: bscTransparent,
              padding: const EdgeInsets.only(top: 0, bottom: 0, left: 15, right: 15),
              child: _buildTableIconLanginfo(
                context,
                textlefttitile: '${screenhomeResponse?.body?.screenInfo?.screenhome?.textlang}',
                textrightdetail: '${screenhomeResponse?.body?.screenInfo?.screenhome?.textlangdetail}',
                tb1: 0.5,
                tb2: 0.00,
                tb3: 0.55,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangePasswordScreen()));
              },
              child: Container(
                width: double.infinity,
                color: bscTransparent,
                padding: const EdgeInsets.only(top: 0, bottom: 10, left: 15, right: 15),
                child: _buildTableGeneralinfo(
                  context,
                  textlefttitile: '${screenhomeResponse?.body?.screenInfo?.screenhome?.btncpass}',
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
                    context, '$errchangepassword\n \n Do you want to continue?', 'Confirm', 'Cancel',
                    onClickBtn: (String result) {
                  Navigator.of(context).pop();
                  switch (result) {
                    case 'Cancel':
                      {
                        break;
                      }
                    case 'OK':
                      {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen()),
                            (Route<dynamic> route) => false);
                      }
                  }
                });
              },
              child: Container(
                width: double.infinity,
                color: bscTransparent,
                padding: const EdgeInsets.only(top: 0, bottom: 10, left: 15, right: 15),
                child: _buildTableGeneralinfo(
                  context,
                  textlefttitile: '${screenhomeResponse?.body?.screenInfo?.screenhome?.btndelacc}',
                  textrightdetail: '',
                  tb1: 0.5,
                  tb2: 0.05,
                  tb3: 0.45,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: bscTransparent,
              padding: const EdgeInsets.only(top: 0, bottom: 15, left: 15, right: 15),
              child: _buildTableGeneralinfo(
                context,
                textlefttitile: '${screenhomeResponse?.body?.screenInfo?.screenhome?.textappver}',
                textrightdetail: '${screenhomeResponse?.body?.vs}',
                tb1: 0.5,
                tb2: 0.05,
                tb3: 0.45,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: buttonIconsText(
                onPressed: () {
                  dialogOneLineTwoBtn(context, '$errlogout\n \n Do you want to continue?', 'Confirm', 'Cancel',
                      onClickBtn: (String result) {
                    Navigator.of(context).pop();
                    switch (result) {
                      case 'Cancel':
                        {
                          break;
                        }
                      case 'OK':
                        {
                          context.read<HomeBloc>().add(OnClickHomeLogoutEvent());
                        }
                    }
                  });
                },
                label: "  ${screenhomeResponse?.body?.screenInfo?.screenhome?.btnlogout}  ",
                colortext: bcButtonLogout,
                colorbutton: tcButtonTextWhite,
                sizetext: sizeTextBig20,
                colorborder: bcButtonLogout,
                iconlabel: Icons.exit_to_app,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  _buildTableGeneralImgeinfo(BuildContext context, ApiProfileResponse? screenprofileResponse,
      {required tb1, required tb2, required tb3}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Table(
        border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
        columnWidths: {0: FractionColumnWidth(tb1), 1: FractionColumnWidth(tb2), 2: FractionColumnWidth(tb3)},
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${screenprofileResponse?.body?.profileGeneralInfo?.gen}",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Table(children: [
                  TableRow(children: [
                    Text(
                      '${screenprofileResponse?.body?.profileGeneralInfo?.genname}',
                      textAlign: TextAlign.end,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ]),
                ]),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            screenprofileResponse?.body?.profileGeneralInfo?.img != null
                ? CircleAvatar(
                    radius: 35.0,
                    backgroundImage: NetworkImage("${screenprofileResponse?.body?.profileGeneralInfo?.img}"),
                  )
                : const CircleAvatar(
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
      border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
      columnWidths: {0: FractionColumnWidth(tb1), 1: FractionColumnWidth(tb2), 2: FractionColumnWidth(tb3)},
      defaultVerticalAlignment: TableCellVerticalAlignment.top,
      children: [
        TableRow(children: [
          Text(
            textlefttitile,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: sizeTextSmaller14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(),
          Text(
            textrightdetail,
            textAlign: TextAlign.end,
            style: const TextStyle(fontSize: sizeTextSmaller14),
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

    return Table(
      border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
      columnWidths: {0: FractionColumnWidth(tb1), 1: FractionColumnWidth(tb2), 2: FractionColumnWidth(tb3)},
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(children: [
          Text(
            textlefttitile,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: sizeTextSmaller14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                textrightdetail,
                style: const TextStyle(fontSize: sizeTextSmaller14),
              ),
              //
              // _toggle(),
              IconButton(
                  onPressed: _toggleLanguageView,
                  icon: _isHidden
                      ? const Icon(Icons.toggle_on, color: Color(0xFF00A80A))
                      : const Icon(Icons.toggle_off, color: Color(0xFF4F4F4F)))
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
