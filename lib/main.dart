// import 'package:f2fbuu/module/activity/bloc/activity_bloc.dart';
// import 'package:f2fbuu/module/login/bloc/login_bloc/login_bloc.dart';
import 'package:f2fbuu/module/login/screen/login_screen/login_screen.dart';
// import 'package:f2fbuu/module/profile/bloc/profile_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.landscapeLeft,
  ]);

  // debugPaintSizeEnabled = true;
  BlocOverrides.runZoned(
        () {runApp(const MyApp());},
    blocObserver: BUUBlocObserver(),
  );

  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final loginBloc = BlocProvider<LoginBloc>(create: (context) => LoginBloc(),lazy: false,);

    // final homeBloc = BlocProvider<HomeBloc>(create: (context) => HomeBloc());
    // final forgotpasswordBloc = BlocProvider<ForgorPasswordBloc>(create: (context) => ForgorPasswordBloc());
    // final pdpaBloc = BlocProvider<PdpaBloc>(create: (context) => PdpaBloc(),lazy: false,);
    // final registerBloc = BlocProvider<RegisterBloc>(create: (context) => RegisterBloc(),lazy: false,);
    // final changepasswordBloc = BlocProvider<ChangePasswordBloc>(create: (context) => ChangePasswordBloc());
    // final profileBloc = BlocProvider<ProfileBloc>(create: (context) => ProfileBloc());
    // final actitivtyBloc = BlocProvider<ActivityBloc>(create: (context) => ActivityBloc());

    return MultiBlocProvider(
      providers: [
        // loginBloc,
        // homeBloc,
        // forgotpasswordBloc,
        // pdpaBloc,
        // registerBloc,
        // changepasswordBloc,
        // profileBloc,
        // actitivtyBloc,
        // moreboarBloc,
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: white,
            scaffoldBackgroundColor: Colors.white,
            textTheme: GoogleFonts.notoSerifThaiTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          // home: HomeScreen(),
          routes: {
            '/': (context) => const LoginScreen(),
          }
          // home: ProfileScreen(),
///////////////////////
  //asdsadsadsadsasadsadsadasdsads
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
const MaterialColor white = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);

class BUUBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    // ignore: avoid_print
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    if (kDebugMode) {
      print(change);
    }
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    if (kDebugMode) {
      print(transition);
    }
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print('$error, $stackTrace');
    }
    super.onError(bloc, error, stackTrace);
  }
}
//555