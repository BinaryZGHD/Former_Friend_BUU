import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as httpurl;
import 'package:f2fbuu/module/login/screen/registerscreen/registerconfrim.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../../customs/button/buttoncustom.dart';
import '../../../../customs/color/colorconts.dart';
import '../../../../customs/dialog/dialog_widget.dart';
import '../../../../customs/dialog/dialogboxcutom.dart';
import '../../../../customs/dialog/texterror.dart';
import '../../../../customs/progress_dialog.dart';
import '../../../../customs/size/size.dart';
import '../../../../customs/textfile/buildtextfieldcustom.dart';
import '../../../../customs/textfile/buildtextfieldpasswordcustom.dart';
import '../../bloc/registerbloc/register_bloc.dart';
import '../../model/response/screen_register.dart';


class registerScreen extends StatefulWidget {
  const registerScreen({Key? key}) : super(key: key);

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen>  with ProgressDialog {
  ScreenRegisterResponse? _screenRegisterResponse;
  TextEditingController user = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  String uservalue = " ";
  String phonevalue = " ";
  String emailvalue = " ";
  String namevalue = " ";
  String lastnamevalue = "";
  String passwordvalue = "";
  String confirmpasswordvalue = "";

  @override
  Widget build(BuildContext context) {
    context.read<RegisterBloc>().add(RegisterScreenInfoEvent());

    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          showProgressDialog(context);
        }
        if (state is RegisterEndLoading) {
          hideProgressDialog(context);
        }
        if (state is RegisterError) {
          // show dialog error
          print(state.message);
        }
      },
      child:  BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
          if (state is RegisterScreenInfoSuccessState) {
            _screenRegisterResponse = state.response;
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
                  "${_screenRegisterResponse?.body?.screeninfo?.textreghead}",
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
                        textEditingController: user,
                        onChanged: (value) {
                          uservalue = value;
                        },
                        hint_label: "${_screenRegisterResponse?.body?.screeninfo?.edtIDreg}",
                        textInputType: TextInputType.text,
                      ),
                      buildTextFieldCustom(
                        textEditingController: phone,
                        onChanged: (value) {
                          phonevalue = value;
                        },
                        hint_label: "${_screenRegisterResponse?.body?.screeninfo?.edtphonereg}",
                        textInputType: TextInputType.number,
                      ),
                      buildTextFieldCustom(
                        textEditingController: email,
                        onChanged: (value) {
                          emailvalue = value;
                        },
                        hint_label: "${_screenRegisterResponse?.body?.screeninfo?.edtemailreg}",
                        textInputType: TextInputType.text,
                      ),
                      buildTextFieldCustom(
                        textEditingController: name,
                        onChanged: (value) {
                          namevalue = value;
                        },
                        hint_label: "${_screenRegisterResponse?.body?.screeninfo?.edtnamereg}",
                        textInputType: TextInputType.text,
                      ),
                      buildTextFieldCustom(
                        textEditingController: lastname,
                        onChanged: (value) {
                          lastnamevalue = value;
                        },
                        hint_label: "${_screenRegisterResponse?.body?.screeninfo?.edtlnamereg}",
                        textInputType: TextInputType.text,
                      ),
                      buildTextFieldPasswordCustom(
                        textEditingController: password,
                        onChanged: (value) {
                          passwordvalue = value;
                        },
                        hint_label: "${_screenRegisterResponse?.body?.screeninfo?.edtpassreg}",
                      ),
                      buildTextFieldPasswordCustom(
                        textEditingController: confirmpassword,
                        onChanged: (value) {
                          confirmpasswordvalue = value;
                        },
                        hint_label: "${_screenRegisterResponse?.body?.screeninfo?.edtcpassreg}",
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Center(
                        child: ButtonCustom(
                          label: "  "+"${_screenRegisterResponse?.body?.screeninfo?.btnsignup}"+"  ",
                          colortext: TC_Black,
                          colorbutton: BC_ButtonGreen,
                          sizetext: sizeTextBig20,
                          colorborder: BSC_transparent,
                          onPressed: () {
                            dialogOneLineTwoBtn(
                                context,
                                errregidter1 + '\n \n ' + 'Do you want to continue?',
                                'Confirm',
                                'Cancel', onClickBtn: (String result) {
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
                                      return registerConfirmScreen(
                                          titleconregis: "${_screenRegisterResponse?.body?.screeninfo?.titleconregis}" ,
                                          textotpwillsent: "${_screenRegisterResponse?.body?.screeninfo?.textotpwillsent}" ,
                                          textpleaseconfirm: "${_screenRegisterResponse?.body?.screeninfo?.textpleaseconfirm}" ,
                                          textsentotpagain:"${_screenRegisterResponse?.body?.screeninfo?.textsentotpagain}"  ,
                                          textotp: "${_screenRegisterResponse?.body?.screeninfo?.textotp}" ,
                                          btnconfirm: "${_screenRegisterResponse?.body?.screeninfo?.btnconfirm}" ,
                                          edtemailreg:"${_screenRegisterResponse?.body?.screeninfo?.edtemailreg}"
                                      );
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
              ),
            );
          } else {
            return Container();
          }
        }),

    );
  }
}
