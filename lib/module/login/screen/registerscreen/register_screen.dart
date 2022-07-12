import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/customs/textfile/buildtextfieldcustom.dart';
import 'package:f2fbuu/customs/textfile/buildtextfieldpasswordcustom.dart';
import 'package:f2fbuu/module/login/bloc/registerbloc/register_bloc.dart';
import 'package:f2fbuu/module/login/model/response/screen_register_response.dart';
import 'package:f2fbuu/module/login/model/response/submit_register_response.dart';
import 'package:f2fbuu/module/login/screen/registerscreen/register_confrim_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class registerScreen extends StatelessWidget {
  final String valueLanguage;

  const registerScreen({Key? key, required this.valueLanguage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterBloc()..add(ScreenInfoRegisterEvent(userLanguage: valueLanguage)),
        child: registerPage(valueLanguage: valueLanguage));

  }

}
class registerPage extends StatefulWidget {
  final String valueLanguage;
  const registerPage({Key? key, required this.valueLanguage}) : super(key: key);

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> with ProgressDialog {
  late String userLanguage;
  @override
  void initState() {
    super.initState();
    userLanguage = widget.valueLanguage;
    // context.read<RegisterBloc>().add(ScreenInfoRegisterEvent(userLanguage: userLanguage));
  }

  ScreenRegisterResponse? _screenRegisterResponse;
  SubmitRegisterResponse? _submitRegisterResponse;
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
    // context.read<RegisterBloc>().add(RegisterScreenInfoEvent());

    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          showProgressDialog(context);
        }
        if (state is RegisterEndLoading) {
          hideProgressDialog(context);
        }
        if (state is RegisterError) {
          // show dialog error
          dialogOneLineOneBtn(context, state.message + '\n ', "OK", onClickBtn: () {
            Navigator.of(context).pop();
          });
          print(state.message);
        }
        if (state is SubmitRegisterState) {
          _submitRegisterResponse = state.responseRegisterSubmit;
          var RegistervalueEmail = state.email;
          var RegistervalueUserID = state.userID;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => registerConfirmScreen(valueLanguage: userLanguage, RegistervalueEmail: RegistervalueEmail,RegistervalueUserID:RegistervalueUserID),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is ScreenInfoRegisterSuccessState) {
          _screenRegisterResponse = state.responseRegisterScreen;
          return buildContentRegister(context);
        }
        return Scaffold(
            body: Container(
              color: Colors.white,
            ));
      },
      buildWhen: (context, state) {
        return state is ScreenInfoRegisterSuccessState;
      },
    );
  }

  buildContentRegister(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
            "${_screenRegisterResponse?.body?.screeninfo?.titlereg}",
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
                  textInputType: TextInputType.text,
                ),
                buildTextFieldPasswordCustom(
                  textEditingController: confirmpassword,
                  onChanged: (value) {
                    confirmpasswordvalue = value;
                  },
                  hint_label: "${_screenRegisterResponse?.body?.screeninfo?.edtcpassreg}",
                  textInputType: TextInputType.text,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Center(
                  child: ButtonCustom(
                    onPressed: () {

                      BlocProvider.of<RegisterBloc>(context)
                      // ..isFetching = true
                        ..add(SubmitRegisterEvent(
                          userLanguage: userLanguage,
                          userID: uservalue,
                          phone: phonevalue,
                          emailRegister: emailvalue,
                          name: namevalue,
                          lastName: lastnamevalue,
                          password: passwordvalue,
                          confirmPassword: confirmpasswordvalue,
                        ));

                      // context.read<RegisterBloc>().add(SubmitRegisterEvent(
                      //   userLanguage: userLanguage,
                      //   userID: uservalue,
                      //   phone: phonevalue,
                      //   emailRegister: emailvalue,
                      //   name: namevalue,
                      //   lastName: lastnamevalue,
                      //   password: passwordvalue,
                      //   confirmPassword: confirmpasswordvalue,
                      // ));
                    },
                    label: "  " + "${_screenRegisterResponse?.body?.screeninfo?.edtsignup}" + "  ",
                    colortext: BC_ButtonText_style_Black,
                    colorbutton: BC_ButtonText_style_White,
                    sizetext: sizeTextBig20,
                    colorborder: BC_ButtonText_style_Black_Boarder,
                    sizeborder: 10,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
