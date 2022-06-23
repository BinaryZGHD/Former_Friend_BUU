import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f2fbuu/module/login/screen/forgotpasswordscreen/setnewforgotpassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../customs/button/buttoncustom.dart';
import '../../../../customs/color/colorconts.dart';
import '../../../../customs/dialog/dialog_widget.dart';
import '../../../../customs/dialog/texterror.dart';
import '../../../../customs/progress_dialog.dart';
import '../../../../customs/size/size.dart';
import '../../../../customs/textfile/buildtextfieldcustom.dart';
import '../../bloc/fotgotpasswordbloc/forgorpassword_bloc.dart';
import '../../model/response/screen_forgotpassword.dart';

class forgotPasswordScreen extends StatefulWidget {
  const forgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<forgotPasswordScreen> createState() => _forgotPasswordScreenState();
}

class _forgotPasswordScreenState extends State<forgotPasswordScreen> with ProgressDialog {
  ScreenForgotPasswordResponse? _screenforgotpasswordResponse;
  TextEditingController userID = TextEditingController();
  TextEditingController email = TextEditingController();

  String uservalue = " ";

  String emailvalue = " ";

  @override
  Widget build(BuildContext context) {
    context.read<ForgorPasswordBloc>().add(ForgotPasswordScreenInfoEvent());
    return BlocListener<ForgorPasswordBloc, ForgorPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordLoading) {
          showProgressDialog(context);
        }
        if (state is ForgotPasswordEndLoading) {
          hideProgressDialog(context);
        }
        if (state is ForgotPasswordError) {
          // show dialog error
          print(state.message);
        }
      },
      child: Scaffold(
        body: BlocBuilder<ForgorPasswordBloc, ForgorPasswordState>(builder: (context, state) {
          if (state is ForgotPasswordScreenInfoSuccessState) {
            _screenforgotpasswordResponse = state.response;
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
                    "${_screenforgotpasswordResponse?.body?.screeninfo?.textforgothead}",
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
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        buildTextFieldCustom(
                          textEditingController: userID,
                          onChanged: (value) {
                            uservalue = value;
                          },
                          hint_label: "${_screenforgotpasswordResponse?.body?.screeninfo?.edtIDforgot}",
                          textInputType: TextInputType.text,
                        ),
                        buildTextFieldCustom(
                          textEditingController: email,
                          onChanged: (value) {
                            emailvalue = value;
                          },
                          hint_label: "${_screenforgotpasswordResponse?.body?.screeninfo?.edtemailforgot}",
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Center(
                          child: ButtonCustom(
                            label: "  ${_screenforgotpasswordResponse?.body?.screeninfo?.btnforgotnext}  ",
                            colortext: TC_Black,
                            colorbutton: BC_ButtonGreen,
                            sizetext: sizeTextBig20,
                            colorborder: BSC_transparent,
                            onPressed: () {
                              dialogOneLineTwoBtn(context, errforgotpasswordr1 + '\n \n ' + 'Do you want to continue?',
                                  'Confirm', 'Cancel', onClickBtn: (String result) {
                                Navigator.of(context).pop();
                                switch (result) {
                                  case 'Cancel':
                                    {
                                      break;
                                    }
                                  case 'OK':
                                    {
                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                        // int index = int.parse(widget.id);
                                        return setNewForgotPasswordScreen(
                                            textheadsetnewpassword:
                                                "${_screenforgotpasswordResponse?.body?.screeninfo?.textheadsetnewpass}",
                                            textotpwillsent:
                                                "${_screenforgotpasswordResponse?.body?.screeninfo?.textotpwillsent}",
                                            edtemailforgot:
                                                "${_screenforgotpasswordResponse?.body?.screeninfo?.edtemailforgot}",
                                            edtpassword: "${_screenforgotpasswordResponse?.body?.screeninfo?.edtpass}",
                                            edtcpassword:
                                                "${_screenforgotpasswordResponse?.body?.screeninfo?.edtcpass}",
                                            otp: "${_screenforgotpasswordResponse?.body?.screeninfo?.otp}",
                                            texpleaseconfirm:
                                                "${_screenforgotpasswordResponse?.body?.screeninfo?.texpleaseconfirm}",
                                            btnsentotpagain:
                                                "${_screenforgotpasswordResponse?.body?.screeninfo?.btnsentotpagain}",
                                            btnconfirm:
                                                "${_screenforgotpasswordResponse?.body?.screeninfo?.btnconfirm}");
                                        // DisplayBeerScreen();
                                      }));
                                    }
                                }
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                      ],
                    ),
                  ),
                ));
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
