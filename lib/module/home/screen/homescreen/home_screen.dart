import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/module/activity/model/response/screen_status_activity.dart';
import 'package:f2fbuu/module/home/bloc/homebloc/home_bloc.dart';
import 'package:f2fbuu/module/home/model/response/alert_delete_account_response.dart';
import 'package:f2fbuu/module/home/model/response/alert_logout_response.dart';
import 'package:f2fbuu/module/home/model/response/logout_home_response.dart';
import 'package:f2fbuu/module/home/model/response/screen_home_response.dart';
import 'package:f2fbuu/module/home/screen/widget/home_widget.dart';
import 'package:f2fbuu/module/login/model/response/sunmit_login_response.dart';
import 'package:f2fbuu/module/profile/model/response/api_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:f2fbuu/module/login/screen/loginscreen/login_screen.dart';

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
  AlertLogoutHomeResponse? _logoutHomeResponse;
  AlertDeleteAccountResponse? _deleteAccountResponse;
  late SharedPreferences prefs;
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
     prefs = await SharedPreferences.getInstance();

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
     prefs = await SharedPreferences.getInstance();

    setState(
      () {
        _isHidden = !_isHidden;
        _isHidden ? _userLanguage = "TH" : _userLanguage = "EN";
        context.read<HomeBloc>().add(OnClickHomeLanguageEvent(userLanguage: _userLanguage));
        // _isHidden
        //     ? context.read<HomeBloc>().add(OnClickHomeLanguageEvent(userLanguage:_userLanguage))
        //     : context.read<HomeBloc>().add(OnClickHomeLanguageEvent(userLanguage:_userLanguage));
      },
    );
    await prefs.setString('userLanguage', _userLanguage);
  }
  void _cleanDelete() async{
    prefs = await SharedPreferences.getInstance();
    prefs.remove("globalKey");
    prefs.remove("userLanguage");
    setState(() {
    });
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()));
  }
  void _cleanLogout() async{
    prefs = await SharedPreferences.getInstance();
    prefs.remove("globalKey");
    prefs.remove("userLanguage");
    setState(() {
    });
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeLoading) {
          showProgressDialog(context);
        }if (state is HomeAlertLoading) {
          showProgressTransparent(context);
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
        if (state is OnClickDeleteAccountState) {
          _deleteAccountResponse = state.responseAlertDeleteAccount;
          // show dialog error
          dialogOneLineTwoBtn(context, '${_deleteAccountResponse?.body?.deletealert} \n'
              '${_deleteAccountResponse?.body?.subdeletalert} \n'
              '${_deleteAccountResponse?.body?.emaideletelalert} \n'
              '${_deleteAccountResponse?.body?.phonedeletealert} '
              , '${_deleteAccountResponse?.body?.confirm}', '${_deleteAccountResponse?.body?.cancel}',
              onClickBtn: (String result) {
                Navigator.of(context).pop();
                switch (result) {
                  case 'Cancel':
                    {
                      break;
                    }
                  case 'OK':
                    {
                      context.read<HomeBloc>().add(OnClickConfirmHomeLogoutEvent());
                    }
                }
              });
        }

        if (state is OnClickHomeLogoutState) {
          _logoutHomeResponse = state.responseAlertLogoutHome;
          // show dialog error
          dialogOneLineTwoBtn(context, '${_logoutHomeResponse?.body?.alert}', '${_logoutHomeResponse?.body?.confirm}', '${_logoutHomeResponse?.body?.cancel}',
              onClickBtn: (String result) {
                Navigator.of(context).pop();
                switch (result) {
                  case 'Cancel':
                    {
                      break;
                    }
                  case 'OK':
                    {
                      context.read<HomeBloc>().add(OnClickConfirmHomeLogoutEvent());
                    }
                }
              });
        }
        if (state is OnClickConfirmHomeLogoutState) {
          _cleanLogout();
        }
        if (state is OnClickConfirmDeleteAccountState) {
          _cleanDelete();
        }
        if (state is OnClickScreenInfoHomeSuccessState) {
          _screenhomeResponse = state.responseScreenInfoHome;
          _screenprofileResponse = state.responseProfile;
          _screenstatusActivityResponse = state.responseActivity;
          buildContentHomeScreen(
            context,
            _toggleLanguageView,
            _isHidden,
            _screenhomeResponse,
            _screenprofileResponse,
            _screenstatusActivityResponse,
            _userLanguage,
          );
        }

      },
      builder: (context, state) {
        if (state is ScreenInfoHomeSuccessState) {
          _screenhomeResponse = state.responseScreenInfoHome;
          _screenprofileResponse = state.responseProfile;
          _screenstatusActivityResponse = state.responseActivity;
          return buildContentHomeScreen(
            context,
            _toggleLanguageView,
            _isHidden,
            _screenhomeResponse,
            _screenprofileResponse,
            _screenstatusActivityResponse,
            _userLanguage,
          );
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
}
