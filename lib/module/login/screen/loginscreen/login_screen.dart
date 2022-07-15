import 'package:f2fbuu/module/home/screen/homescreen/home_screen.dart';
import 'package:f2fbuu/module/login/model/response/sunmit_login_response.dart';
import 'package:f2fbuu/customs/particle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/dialog/texterror.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/customs/textfile/buildtextfieldcustom.dart';
import 'package:f2fbuu/customs/textfile/buildtextfieldpasswordcustom.dart';
import 'package:f2fbuu/customs/textlink/textlinktoscreencustom.dart';
import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/module/login/model/response/screen_login_response.dart';
import 'package:f2fbuu/module/login/screen/forgotpasswordscreen/forgotpassword_screen.dart';
import 'package:f2fbuu/module/login/screen/registerscreen/pdparegister_screen.dart';
import 'package:f2fbuu/module/login/bloc/loginbloc/login_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;
import 'dart:ui';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginBloc()..add(LoginScreenInfoEvent(userLanguage: "TH")),
        child: LoginPage());
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
    await prefs.setString('userLanguage', "$valueLanguage");
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
    await prefs.setString('userLanguage', "$valueLanguage");
    setState(() {
      valueLanguage = prefs.getString('userLanguage') ?? 'TH';
      print(" value is $valueLanguage");
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
          dialogOneLineOneBtn(context, state.message + '\n ', "OK", onClickBtn: () {
            Navigator.of(context).pop();
          });
          print(state.message);
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
          return buildContent(context);
        }
        else if (state is OnClickLanguageLoginScreenInfoSuccessState) {
          _screenLoginResponse = state.responseLanguageLoginscreen;
          return buildContent(context);
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

  buildContent(
    BuildContext context,
  ) {
    TextEditingController userController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child:  Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0,top: 20),
                      child: GestureDetector(
                          onTap: _toggleLanguageView,
                          child: Row(
                            children: [
                              Icon(
                                Icons.language,
                                color: Colors.black,
                                size: 18,
                              ),
                              Text("  ${_screenLoginResponse?.body?.screeninfo?.btnChangeLang}",
                                  style: TextStyle(
                                    // decoration: TextDecoration.underline,
                                      color: Colors.black,
                                      // decorationColor: linktextcolor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14)),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Center(
                      child: _screenLoginResponse?.body?.screeninfo?.imgLogo != null
                          ? CircleAvatar(
                        radius: 80.0,
                        backgroundImage: NetworkImage("${_screenLoginResponse?.body?.screeninfo?.imgLogo}"),
                      )
                          : CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage(
                          'assets/logo/Buulogo.png',
                        ),
                        // ChangeImageType(
                        //   urlimge_l: "${_screenLoginResponse?.body?.screeninfo?.imgLogo}" ,
                        //   // urlimge_l:
                        //   //     "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Buu-logo11.png/130px-Buu-logo11.png",
                        // )),
                        // buildImge(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildTextFieldCustom(
                      textEditingController: userController,
                      onChanged: (valueuserID) {
                        userController.text = valueuserID;
                        print("userController  login == " + userController.text);
                      },
                      hint_label: "${_screenLoginResponse?.body?.screeninfo?.edtID}",
                      textInputType: TextInputType.text,
                    ),
                    buildTextFieldPasswordCustom(
                      textEditingController: passwordController,
                      onChanged: (valuepassword) {
                        passwordController.text = valuepassword;
                        print("passwordController login  == " + passwordController.text);
                      },
                      hint_label: "${_screenLoginResponse?.body?.screeninfo?.edtPass}",
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextLinkToScreenCustom(
                          linklabel: "${_screenLoginResponse?.body?.screeninfo?.btnForgotPass}" + " ? ",
                          linktextcolor: TC_forgot,
                          sizetext: sizeTextSmaller14,
                          onTap: () async {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => forgotPasswordScreen()));
                          }
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //
                    Center(
                      child: ButtonCustom(
                        onPressed: () {
                          context.read<LoginBloc>().add(LoginSubmitEvent(
                            userID: userController.text,
                            password: passwordController.text,
                          ));
                        },
                        label: "  ${_screenLoginResponse?.body?.screeninfo?.btnLogin}  ",
                        colortext: BC_ButtonText_style_Black,
                        colorbutton: BC_ButtonText_style_White,
                        sizetext: sizeTextBig20,
                        colorborder: BC_ButtonText_style_Black_Boarder,
                        sizeborder: 10,
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${_screenLoginResponse?.body?.screeninfo?.textReg}" + " ? ",
                          style: TextStyle(fontSize: sizeTextSmall16, color: Colors.black, fontWeight: FontWeight.w300),
                        ),
                        TextLinkToScreenCustom(
                            linklabel: "${_screenLoginResponse?.body?.screeninfo?.btnReg}",
                            linktextcolor: TC_regiter,
                            sizetext: sizeTextSmall16,
                            onTap: () async {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ConditionPDPAScreen(valueLanguage: valueLanguage,)));
                            }
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                  ],
                ),
              ),
            )
          ),
        ),
      ),
    );
  }
}




class Generative extends StatefulWidget {
  @override
  _GenerativeState createState() => _GenerativeState();
}

class _GenerativeState extends State<Generative> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  List<Particle> particles = [];

  generateListOfParticles() {
    int numberOfParticles = 500;

    for (int i = 0; i < numberOfParticles; i++) {
      double randomSize = math.Random().nextDouble() * 10;

      int randomR = math.Random().nextInt(256);
      int randomG = math.Random().nextInt(256);
      int randomB = math.Random().nextInt(256);

      Color randomColor = Color.fromARGB(255, randomR, randomG, randomB);

      double randomRadius = math.Random().nextDouble() * 1000;
      double randomTheta = math.Random().nextDouble() * (1.9 * (math.pi ));

      Particle particle = Particle(
        size: randomSize,
        radius: randomRadius,
        startingTheta: randomTheta,
        color: randomColor,
      );
      particles.add(particle);
    }
  }

  @override
  void initState() {
    super.initState();

    generateListOfParticles();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 60),
    );

    Tween<double> _rotationTween = Tween(begin:  0.2 * math.pi, end: 2 * math.pi);

    animation = _rotationTween.animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: MyPainter(
          particles: particles,
          theta: animation.value,
        ),
        child: LoginPage(),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final List<Particle> particles;
  final double theta;

  MyPainter({required this.particles, required this.theta});

  @override
  void paint(Canvas canvas, Size size) {
    // generative art
    // double radius = 200.0;

    // paint brush
    var paint = Paint()..strokeWidth = 300;

    /// Calulation:
    /// ----------
    /// x = rcos(theta)
    /// y = rsin(theta)
    ///
    /// vary `theta` to generate different points
    ///

    particles.forEach((particle) {
      double randomTheta = particle.startingTheta + theta;
      double radius = particle.radius;

      double dx = radius * theta * math.cos(randomTheta) + size.width / 2;
      double dy = radius * theta * math.sin(randomTheta) + size.height / 2 ;

      Offset position = Offset(dx, dy);

      paint.color = particle.color;

      canvas.drawCircle(position, particle.size, paint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
