import 'package:f2fbuu/module/profile/screen/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'module/login/bloc/loginbloc/login_bloc.dart';
import 'module/main/mainbloc/main_bloc.dart';
import 'package:f2fbuu/module/login/screen/loginscreen/loginscreen.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.landscapeLeft,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoginScreen(),
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
    );
  }
}
