

import 'package:f2fbuu/module/login/screen/registerscreen/registerconfrim.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../customs/button/buildbuttoncustom.dart';
import '../../../../customs/textfile/buildtextfieldcustom.dart';
import '../../../../customs/textfile/buildtextfieldpasswordcustom.dart';

class RegisterScreen extends StatelessWidget {TextEditingController user = TextEditingController();
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
   RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: SingleChildScrollView(
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
              hint_label: 'Student code / Teacher code',
            ),
            buildTextFieldCustom(
              textEditingController: phone,
              onChanged: (value) {
                phonevalue = value;
              },
              hint_label: 'Telephone number',
            ),
            buildTextFieldCustom(
              textEditingController: email,
              onChanged: (value) {
                emailvalue = value;
              },
              hint_label: 'Email',
            ),
            buildTextFieldCustom(
              textEditingController: name,
              onChanged: (value) {
                namevalue = value;
              },
              hint_label: 'Name',
            ),
            buildTextFieldCustom(
              textEditingController: lastname,
              onChanged: (value) {
                lastnamevalue = value;
              },
              hint_label: 'Lastname',
            ),
            buildTextFieldPasswordCustom(
              textEditingController: password,
              onChanged: (value) {
                passwordvalue = value;
              },
              hint_label: 'Password',
            ),
            buildTextFieldPasswordCustom(
              textEditingController: confirmpassword,
              onChanged: (value) {
                confirmpasswordvalue = value;
              },
              hint_label: 'Confirm Password',
            ),
             const buildButtonCustom(
              maptype: RegisterConfirmScreen(),
              linklabel: 'Singup ',
              linkurl: '', mapdetailscreen: 'register', mapscreen: 'step1',

            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
