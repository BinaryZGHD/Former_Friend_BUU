import 'package:f2fbuu/module/profile/bloc/profile_bloc.dart';
import 'package:f2fbuu/module/login/bloc/changepasswordbloc/changepassword_bloc.dart';
import 'package:f2fbuu/module/login/bloc/pdpabloc/pdpa_bloc.dart';
import 'package:f2fbuu/module/login/bloc/registerbloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'module/home/bloc/homebloc/home_bloc.dart';
import 'module/home/screen/homescreen/homescreen.dart';

import 'package:flutter/services.dart';

import 'module/login/bloc/fotgotpasswordbloc/forgorpassword_bloc.dart';
import 'module/login/bloc/loginbloc/login_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.landscapeLeft,
  ]);
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider<LoginBloc>(create: (context) => LoginBloc());

    final homeBloc = BlocProvider<HomeBloc>(create: (context) => HomeBloc());
    final forgotpasswordBloc = BlocProvider<ForgorPasswordBloc>(create: (context) => ForgorPasswordBloc());
    final pdpaBloc = BlocProvider<PdpaBloc>(create: (context) => PdpaBloc());
    final registerBloc = BlocProvider<RegisterBloc>(create: (context) => RegisterBloc());
    final changepasswordBloc = BlocProvider<ChangePasswordBloc>(create: (context) => ChangePasswordBloc());
    final profileBloc = BlocProvider<ProfileBloc>(create: (context) => ProfileBloc());
    return MultiBlocProvider(
      providers: [loginBloc, homeBloc, forgotpasswordBloc, pdpaBloc, registerBloc, changepasswordBloc, profileBloc],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.white,
          ),
          // home: HomeScreen(),
          routes: {
            '/': (context) => HomeScreen(),
          }
          // home: ProfileScreen(),
///////////////////////

          // final loginBloc = BlocProvider<LoginBloc>(create: (context)=> LoginBloc());
          // final MainnBloc = BlocProvider<MainBloc>(create: (context)=> MainBloc());
          // return MultiBlocProvider(
          //     providers: [loginBloc,MainnBloc],
          //     child: MaterialApp
          //       (
          //       title: 'Flutter Demo',
          //       theme: ThemeData(
          //         primarySwatch: Colors.grey,
          //       ),
          //       home: ProfileScreen(),
          //     )
          ),
    );
  }
}
