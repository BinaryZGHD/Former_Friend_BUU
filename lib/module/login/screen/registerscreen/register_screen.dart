import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/module/login/bloc/registerbloc/register_bloc.dart';
import 'package:f2fbuu/module/login/model/response/screen_register_response.dart';
import 'package:f2fbuu/module/login/screen/registerscreen/register_confrim_screen.dart';
import 'package:f2fbuu/module/login/widget/register_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterBloc()..add(ScreenInfoRegisterEvent()), child: const RegisterPage());
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with ProgressDialog {
  late String userLanguage;
  @override
  void initState() {
    super.initState();
  }

  ScreenRegisterResponse? _screenRegisterResponse;

  TextEditingController userController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

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
          dialogOneLineOneBtn(context, '${state.message}\n ', "OK", onClickBtn: () {
            Navigator.of(context).pop();
          });
          if (kDebugMode) {
            print(state.message);
          }
        }
        if (state is SubmitRegisterState) {
          var registervalueEmail = state.email;
          var registervalueUserID = state.userID;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegisterConfirmScreen(
                  registerValueEmail: registervalueEmail, registerValueUserID: registervalueUserID),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is ScreenInfoRegisterSuccessState) {
          _screenRegisterResponse = state.responseRegisterScreen;
          return registerPageWidget(
            context,
            _screenRegisterResponse,
            userController,
            phoneController,
            emailController,
            nameController,
            lastnameController,
            passwordController,
            confirmpasswordController,
          );
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
}
