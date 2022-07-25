import 'package:f2fbuu/customs/button/button_custom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/dialog/texterror.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/customs/text_file/text_field_password_custom.dart';
import 'package:f2fbuu/customs/text_link/text_link_to_screen_custom.dart';
import 'package:f2fbuu/module/home/screen/home_screen/home_screen.dart';
import 'package:f2fbuu/module/login/bloc/change_password_bloc/change_password_bloc.dart';
import 'package:f2fbuu/module/login/model/response/screen_change_password_response.dart';
import 'package:f2fbuu/module/login/screen/forgot_password_screen/forgot_password_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ChangePasswordBloc(),
        // child: const GenerativeWidget());
        child: const ChangePasswordPage());
  }
}

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> with ProgressDialog {
  ScreenChangePasswordResponse? _screenChangePasswordResponse;
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String currentPasswordValue = "";
  String newPasswordValue = "";
  String passwordValue = " ";
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
          if (kDebugMode) {
            print(state.message);
          }
        }
      },
      child: Scaffold(
        body: BlocBuilder<ChangePasswordBloc, ChangePasswordState>(builder: (context, state) {
          if (state is ScreenInfoChangePasswordSuccessState) {
            _screenChangePasswordResponse = state.responseChangePasswordScreenInfo;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: sizeTitle24,
                    color: Colors.black,
                  ),
                ),
                title: Text(
                  "${_screenChangePasswordResponse?.body?.screeninfo?.textheadsetnewpass}",
                  style: const TextStyle(
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
                      TextFieldPasswordCustom(
                        textEditingController: currentPasswordController,
                        onChanged: (value) {
                          currentPasswordValue = value;
                        },
                        hintLabel: "${_screenChangePasswordResponse?.body?.screeninfo?.edtcurrentpass}",
                        textInputType: TextInputType.text,
                      ),
                      TextFieldPasswordCustom(
                        textEditingController: newPasswordController,
                        onChanged: (value) {
                          newPasswordValue = value;
                        },
                        hintLabel: "${_screenChangePasswordResponse?.body?.screeninfo?.edtnewpass}",
                        textInputType: TextInputType.text,
                      ),
                      TextFieldPasswordCustom(
                        textEditingController: confirmPasswordController,
                        onChanged: (value) {
                          passwordValue = value;
                        },
                        hintLabel: "${_screenChangePasswordResponse?.body?.screeninfo?.edtcpass}",
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextLinkToScreenCustom(
                            linklabel: "${_screenChangePasswordResponse?.body?.screeninfo?.btnforgotpass}",
                            linktextcolor: tcForgot,
                            sizetext: sizeTextSmaller14,
                            onTap: () async {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
                            }),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Center(
                        child: ButtonCustom(
                            label: "  ${_screenChangePasswordResponse?.body?.screeninfo?.btnconfirm}  ",
                            colortext: tcButtonTextBlack,
                            colorbutton: tcButtonTextWhite,
                            sizetext: sizeTextBig20,
                            colorborder: tcButtonTextBoarder,
                            sizeborder: 10,
                            onPressed: () {
                              dialogOneLineOneBtn(context, '$errchangepassword\n \n Do you want to continue?', "OK",
                                  onClickBtn: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    // int index = int.parse(widget.id);
                                    return const HomeScreen();
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
