import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../module/login/bloc/loginbloc/login_bloc.dart';

class TextLinkForgotCustom extends StatelessWidget {
  final String linklabel;
  final String linkurl;
  final Widget map;
  final linktextcolor;
  final VoidCallback? onPressed;
  const TextLinkForgotCustom(
      {Key? key, required this.linklabel, required this.linkurl, required this.map, required this.linktextcolor, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: Text(linklabel,
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: linktextcolor,
            decorationColor: linktextcolor,
            fontWeight: FontWeight.w600,
          )),
      onTap: () {
        context.read<LoginBloc>().add(LoginForgotEvent(regstatus: "F1"));
      },
    );
  }
}
