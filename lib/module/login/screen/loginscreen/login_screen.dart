import 'package:f2fbuu/module/home/screen/homescreen/home_screen.dart';
import 'package:f2fbuu/module/login/model/response/sunmit_login_response.dart';
import 'package:f2fbuu/module/login/widget/generative_widget.dart';
import 'package:f2fbuu/module/login/widget/login_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/module/login/model/response/screen_login_response.dart';
import 'package:f2fbuu/module/login/bloc/loginbloc/login_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginBloc()..add(LoginScreenInfoEvent(userLanguage: "TH")),
        child: const GenerativeWidget());
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage( {Key? key, }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ProgressDialog {
  ScreenLoginResponse? _screenLoginResponse;
  SunmitLoginResponse? _loginSubmitResponse;
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late bool statusLoginSubmit;
  bool isDefaultLanguage = true;
  late String valueLanguage;
  @override
  void initState() {

    valueLanguage = "TH";

     _setIsDefaultLanguage (valueLanguage);

    // context.read<LoginBloc>().add(LoginScreenInfoEvent(userLanguage: valueLanguage));
    super.initState();
  }
  void _setIsDefaultLanguage (String valueLanguage) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userLanguage', valueLanguage);
  }


  void _toggleLanguageView() async {
    setState(
      () {
        isDefaultLanguage = !isDefaultLanguage;
        valueLanguage = isDefaultLanguage ? "TH" : "EN";
        context.read<LoginBloc>().add(OnClickLanguageEvent(userLanguage: valueLanguage));
      },
    );
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userLanguage', valueLanguage);
    setState(() {
      valueLanguage = prefs.getString('userLanguage') ?? 'TH';
      if (kDebugMode) {
        print(" value is $valueLanguage");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          showProgressDialog(context);
        }
        if (state is LoginEndLoading) {
          hideProgressDialog(context);
        }
        if (state is LoginError) {
          // show dialog error
          dialogOneLineOneBtn(context, '${state.message}\n ', "OK", onClickBtn: () {
            Navigator.of(context).pop();
          });
          if (kDebugMode) {
            print(state.message);
          }
        }
        if (state  is SubmitLoginState){
          _loginSubmitResponse = state.responseSunmitLoginscreen;
            Navigator.push(
              context,MaterialPageRoute(
                builder: (context) => HomeScreen(
                  screenLoginResponse: _loginSubmitResponse,
                )
            )
            );


        }

      },
      builder: (context, state) {
        if (state is ScreenInfoLoginSuccessState) {
          _screenLoginResponse = state.responseScreenInfoLogin;
          return loginPageWidget(context,_screenLoginResponse,userController,passwordController,onClickBtnLanguageView: () {
            _toggleLanguageView();
          });
        }
        else if (state is OnClickLanguageLoginScreenInfoSuccessState) {
          _screenLoginResponse = state.responseLanguageLoginscreen;
          return loginPageWidget(context,_screenLoginResponse,userController,passwordController,onClickBtnLanguageView: () {
            _toggleLanguageView();
          });
        }

        return Scaffold(body: Container(
          color: Colors.white,
        ));
      },
      buildWhen: (context, state) {
        return state is ScreenInfoLoginSuccessState || state is OnClickLanguageLoginScreenInfoSuccessState;
      },
    );
  }


}



