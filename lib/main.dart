import 'package:f2fbuu/screens/home.dart';
import 'package:f2fbuu/screens/login.dart';
import 'package:f2fbuu/screens/test.dart';
import 'package:f2fbuu/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'module/main/mainscreen.dart';
import 'module/login/bloc/loginbloc/login_bloc.dart';
import 'module/main/mainbloc/main_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider<LoginBloc>(create: (context)=> LoginBloc());
    final MainnBloc = BlocProvider<MainBloc>(create: (context)=> MainBloc());
    return MultiBlocProvider(
        providers: [loginBloc,MainnBloc],
        child: MaterialApp
          (
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          home: MainScreen(



          ),
        )
    );
  }
}