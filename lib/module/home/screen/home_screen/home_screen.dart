import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/module/activity/model/response/screen_status_activity.dart';
import 'package:f2fbuu/module/home/bloc/home_bloc/home_bloc.dart';
import 'package:f2fbuu/module/home/model/response/home_response/alert_delete_account_response.dart';
import 'package:f2fbuu/module/home/model/response/home_response/alert_logout_response.dart';
import 'package:f2fbuu/module/home/model/response/home_response/alert_no_activity_response.dart';
import 'package:f2fbuu/module/home/model/response/home_response/screen_home_response.dart';
import 'package:f2fbuu/module/home/screen/home_widget/home_widget.dart';
import 'package:f2fbuu/module/profile/model/response/api_profile.dart';
import 'package:f2fbuu/utils/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:f2fbuu/module/login/screen/login_screen/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with ProgressDialog {
  ScreenHomeResponse? _screenHomeResponse;
  ApiProfileResponse? _screenProfileResponse;
  ScreenStatusActivityResponse? _screenStatusActivityResponse;
  AlertLogoutHomeResponse? _logoutHomeResponse;
  AlertDeleteAccountResponse? _deleteAccountResponse;
  AlertNoActivityResponse? _noActivityResponse;


  late SharedPreferences prefs;
  late String keyToken;
  late String _userLanguage;
  late bool _isHidden;

  @override
  void initState() {
    super.initState();
    _getDefaultLanguage();
  }

  _getDefaultLanguage() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _userLanguage = prefs.getString('userLanguage')!;
      if (_userLanguage == "TH") {
        _isHidden = true;
      } else {
        _isHidden = false;
      }
      context.read<HomeBloc>().add(HomeScreenInfoEvent());
    });
  }

  void _toggleLanguageView() async {

    _isHidden = !_isHidden;
    _isHidden ? _userLanguage = "TH" : _userLanguage = "EN";

    setState(
      () {
        context.read<HomeBloc>().add(OnClickChangeLanguageHomeEvent(userLanguage: _userLanguage));
      },
    );

  }
  void _changeLanguageSuccess(String userLanguage) async {
    setGlobalLanguage(userLanguage);
    context.read<HomeBloc>().add(HomeScreenInfoEvent());
  }

  void cleanDelete() async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove("globalKey");
    prefs.remove("userLanguage");
  }

  void cleanLogout() async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove("globalKey");
    prefs.remove("userLanguage");
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeLoading) {
          showProgressDialog(context);
        }
        if (state is HomeAlertLoading) {
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
          dialogOneLineTwoBtn(
              context,
              '${_deleteAccountResponse?.body?.deletealert} \n'
                  '${_deleteAccountResponse?.body?.subdeletalert} \n'
                  '${_deleteAccountResponse?.body?.emaideletelalert} \n'
                  '${_deleteAccountResponse?.body?.phonedeletealert} ',
              '${_deleteAccountResponse?.body?.confirm}',
              '${_deleteAccountResponse?.body?.cancel}', onClickBtn: (String result) {
            Navigator.of(context).pop();
            switch (result) {
              case 'Cancel':
                {
                  break;
                }
              case 'OK':
                {
                  context.read<HomeBloc>().add(OnClickConfirmDeleteAccountHomeEvent());
                }
            }
          });
        }

        if (state is OnClickHomeLogoutState) {
          _logoutHomeResponse = state.responseAlertLogoutHome;
          // show dialog error
          dialogOneLineTwoBtn(context, '${_logoutHomeResponse?.body?.alert}', '${_logoutHomeResponse?.body?.confirm}',
              '${_logoutHomeResponse?.body?.cancel}', onClickBtn: (String result) {
            Navigator.of(context).pop();
            switch (result) {
              case 'Cancel':
                {
                  break;
                }
              case 'OK':
                {
                  context.read<HomeBloc>().add(OnClickConfirmLogoutHomeEvent());
                }
            }
          });
        }
        if (state is OnClickConfirmHomeLogoutState) {
          cleanLogout();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()));
        }
        if (state is OnClickConfirmDeleteAccountState) {
          cleanDelete();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()));
        }
      },
      builder: (context, state) {
        if (state is ScreenInfoHomeSuccessState) {
          _screenHomeResponse = state.responseScreenInfoHome;
          _screenProfileResponse = state.responseProfile;
          _screenStatusActivityResponse = state.responseActivity;
          _noActivityResponse = state.responseNoActivity ;
          return buildContentHomeScreen(
            context,
            _toggleLanguageView,
            _isHidden,
            _screenHomeResponse,
            _screenProfileResponse,
            _userLanguage,
              _screenStatusActivityResponse,
              _noActivityResponse
          );
        }
        else if (state is OnClickScreenInfoHomeSuccessState ) {
          _changeLanguageSuccess(state.userLanguage);
        }

        return Scaffold(
            body: Container(
          color: Colors.white,
        ));
      },
      buildWhen: (context, state) {
        return state is ScreenInfoHomeSuccessState || state is OnClickScreenInfoHomeSuccessState  || state is  HomeError;
      },
    );
  }
}
