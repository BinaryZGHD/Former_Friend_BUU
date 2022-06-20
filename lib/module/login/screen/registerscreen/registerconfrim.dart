import 'package:f2fbuu/module/login/screen/loginscreen/loginscreen.dart';
import 'package:f2fbuu/module/login/screen/registerscreen/registerscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../customs/button/buildbuttoncustom.dart';
import '../../../../customs/button/buttoncustom.dart';
import '../../../../customs/color/colorconts.dart';
import '../../../../customs/dialog/dialogboxcutom.dart';
import '../../../../customs/dialog/texterror.dart';
import '../../../../customs/size/size.dart';
import '../../../../customs/textfile/buildtextfieldcustom.dart';
import '../../../../customs/textlink/textlinkotpcustom.dart';
import '../../../../customs/textlink/textlinktoscreencustom.dart';


class registerConfirmScreen extends StatefulWidget {
  final VoidCallback? onPressed;
  final String titleconregis ;
  final String textotpwillsent;
  final String textpleaseconfirm;
  final String textsentotpagain;
  final String textotp;
  final String btnconfirm;
  final String edtemailreg;
   registerConfirmScreen({Key? key, this.onPressed, required this.titleconregis, required this.textotpwillsent, required this.textpleaseconfirm, required this.textsentotpagain, required this.btnconfirm, required this.edtemailreg, required this.textotp}) : super(key: key);

  @override
  State<registerConfirmScreen> createState() => _registerConfirmScreenState();
}

class _registerConfirmScreenState extends State<registerConfirmScreen> {

  TextEditingController confirmOTPController = TextEditingController();

  String confirmOTP = " ";
  @override
  Widget build(BuildContext context) {
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
        title: Text("${widget.titleconregis}",
          style: TextStyle(
            color: Colors.black,
            fontSize: sizeTitle24,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Text("${widget.textotpwillsent}",
                        style: TextStyle(
                          fontSize: sizeTextBig20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Text("${widget.edtemailreg}",
                        style: TextStyle(
                          fontSize: sizeTextBig20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Text("${widget.textpleaseconfirm}",
                        style: TextStyle(
                          fontSize: sizeTextBig20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ]),
                  ),
                  buildTextFieldCustom(
                    textEditingController: confirmOTPController,
                    onChanged: (value) {
                      confirmOTP = value;
                    },
                    hint_label: "${widget.textotp}", textInputType: TextInputType.number,
                  ),
                  Center(
                    child: TextLinkOTPCustom(
                      linklabel: "${widget.textsentotpagain}",
                      mapscreen: registerScreen(),
                      linktextcolor: TC_OTPSent,
                      sizetext: sizeTextSmall16,
                      tiltle: 'OTP sent to',
                      description: 'Email',
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Center(
                    child: ButtonCustom(
                      label: "  Confirm  ",

                      colortext: TC_Black,
                      colorbutton: BC_ButtonGreen,
                      sizetext: sizeTextBig20,
                      colorborder: BSC_transparent,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => CustomDialogBox(
                                  id: '',
                                  textfieldvalue: "OTP  :  ",
                                  description: errregidter2 + '\n \n ' + 'Do you want to continue?',
                                  mapscreen: loginScreen(),
                                ));
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
