import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/dialog/texterror.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/customs/textfile/buildtextfieldpasswordcustom.dart';
import 'package:f2fbuu/customs/textlink/textlinktoscreencustom.dart';
import 'package:f2fbuu/module/home/screen/homescreen/home_screen.dart';
import 'package:f2fbuu/module/login/bloc/changepasswordbloc/changepassword_bloc.dart';
import 'package:f2fbuu/module/login/model/response/screen_changepassword_response.dart';
import 'package:f2fbuu/module/login/screen/forgotpasswordscreen/forgotpassword_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class changePasswordScreen extends StatefulWidget {
  const changePasswordScreen({Key? key}) : super(key: key);

  @override
  State<changePasswordScreen> createState() => _changePasswordScreenState();
}

class _changePasswordScreenState extends State<changePasswordScreen> with ProgressDialog {
  ScreenChangePasswordResponse? _screenchangepasswordResponse;
  TextEditingController currentpasswordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  String currentpasswordvalue = "";
  String newpasswordvalue = "";
  String passwordvalue = " ";
  @override
  Widget build(BuildContext context) {
    context.read<ChangePasswordBloc>().add(ChangePasswordScreenInfoEvent());
    return BlocListener<ChangePasswordBloc, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordLoading) {
          showProgressDialog(context);
        }
        if (state is ChangePasswordEndLoading) {
          hideProgressDialog(context);
        }
        if (state is ChangePasswordError) {
          // show dialog error
          print(state.message);
        }
      },
      child: Scaffold(
        body: BlocBuilder<ChangePasswordBloc, ChangePasswordState>(builder: (context, state) {
          if (state is ChangePasswordScreenInfoSuccessState) {
            _screenchangepasswordResponse = state.response;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: sizeTitle24,
                    color: Colors.black,
                  ),
                ),
                title: Text(
                  "${_screenchangepasswordResponse?.body?.screeninfo?.textheadsetnewpass}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: sizeTitle24,
                  ),
                ),
              ),
              body: SafeArea(
                // height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      buildTextFieldPasswordCustom(
                        textEditingController: currentpasswordController,
                        onChanged: (value) {
                          currentpasswordvalue = value;
                        },
                        hint_label: "${_screenchangepasswordResponse?.body?.screeninfo?.edtcurrentpass}",
                      ),
                      buildTextFieldPasswordCustom(
                        textEditingController: newpasswordController,
                        onChanged: (value) {
                          newpasswordvalue = value;
                        },
                        hint_label: "${_screenchangepasswordResponse?.body?.screeninfo?.edtnewpass}",
                      ),
                      buildTextFieldPasswordCustom(
                        textEditingController: confirmpasswordController,
                        onChanged: (value) {
                          passwordvalue = value;
                        },
                        hint_label: "${_screenchangepasswordResponse?.body?.screeninfo?.edtcpass}",
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextLinkToScreenCustom(
                          linklabel: "${_screenchangepasswordResponse?.body?.screeninfo?.btnforgotpass}",
                          mapscreen: forgotPasswordScreen(),
                          linktextcolor: TC_forgot,
                          sizetext: sizeTextSmaller14,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Center(
                        child: ButtonCustom(
                            label: "  " + "${_screenchangepasswordResponse?.body?.screeninfo?.btnconfirm}" + "  ",
                            colortext: BC_ButtonText_style_Black,
                            colorbutton: BC_ButtonText_style_White,
                            sizetext: sizeTextBig20,
                            colorborder: BC_ButtonText_style_Black_Boarder,
                            sizeborder: 10,
                            onPressed: () {
                              dialogOneLineOneBtn(
                                  context, errchangepassword + '\n \n ' + 'Do you want to continue?',
                                  "OK", onClickBtn: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    // int index = int.parse(widget.id);
                                    return HomeScreen();
                                  }),
                                );
                              });
                            }),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
