import 'package:f2fbuu/module/activity/bloc/activity_bloc.dart';
import 'package:f2fbuu/module/home/bloc/homemorebloc/homemore_bloc.dart';
import 'package:f2fbuu/module/home/screen/homescreen/home_screen.dart';
import 'package:f2fbuu/module/login/screen/loginscreen/login_screen.dart';
import 'package:f2fbuu/module/profile/bloc/profile_bloc.dart';
import 'package:f2fbuu/module/login/bloc/changepasswordbloc/changepassword_bloc.dart';
import 'package:f2fbuu/module/login/bloc/pdpabloc/pdpa_bloc.dart';
import 'package:f2fbuu/module/login/bloc/registerbloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'module/home/bloc/homebloc/home_bloc.dart';

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
    final loginBloc = BlocProvider<LoginBloc>(create: (context) => LoginBloc(),lazy: false,);

    // final homeBloc = BlocProvider<HomeBloc>(create: (context) => HomeBloc());
    // final forgotpasswordBloc = BlocProvider<ForgorPasswordBloc>(create: (context) => ForgorPasswordBloc());
    // final pdpaBloc = BlocProvider<PdpaBloc>(create: (context) => PdpaBloc(),lazy: false,);
    // final registerBloc = BlocProvider<RegisterBloc>(create: (context) => RegisterBloc(),lazy: false,);
    final changepasswordBloc = BlocProvider<ChangePasswordBloc>(create: (context) => ChangePasswordBloc());
    final profileBloc = BlocProvider<ProfileBloc>(create: (context) => ProfileBloc());
    final actitivtyBloc = BlocProvider<ActivityBloc>(create: (context) => ActivityBloc());
    final moreBloc = BlocProvider<MoreBloc>(create: (context) => MoreBloc());

    return MultiBlocProvider(
      providers: [
        loginBloc,
        // homeBloc,
        // forgotpasswordBloc,
        // pdpaBloc,
        // registerBloc,
        changepasswordBloc,
        profileBloc,
        actitivtyBloc,
        moreBloc,
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
            '/': (context) => LoginScreen(),
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
const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);

class BUUBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    print(change);
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}