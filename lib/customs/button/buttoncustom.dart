import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../module/login/bloc/loginbloc/login_bloc.dart';

class ButtonCustom extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  const ButtonCustom({Key? key, required this.label, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
        onPressed: () {
          context.read<LoginBloc>().add(LoginSummitEvent(users: "9", password: "q"));

        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF00A80A)),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(15)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ))),
        child: Text(
          " " + label + " ",
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ),
      );
  }
}
