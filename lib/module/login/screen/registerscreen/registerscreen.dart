

import 'package:f2fbuu/module/login/screen/registerscreen/registerconfrim.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../customs/button/buildbuttoncustom.dart';
import '../../../../customs/button/buttoncustom.dart';
import '../../../../customs/color/colorconts.dart';
import '../../../../customs/size/size.dart';
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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back ,
            size: sizeTitle24,
            color: Colors.black,
        ),),
        title: Text(
          "Register",
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
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.05,
              // ),
              // Row(
              //   children: [
              //     IconButton(
              //       onPressed: () {
              //         Navigator.pop(context);
              //       },
              //       icon: Icon(
              //         Icons.arrow_back ,
              //         size: MediaQuery.of(context).size.height * 0.05,
              //         color: Colors.black,
              //       ),),
              //     SizedBox(
              //       width: MediaQuery.of(context).size.width * 0.05,
              //     ),
              //     Text(
              //       "Register",
              //       style: TextStyle(
              //         fontSize: MediaQuery.of(context).size.height * 0.05,
              //         fontWeight: FontWeight.w600,
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              buildTextFieldCustom(
                textEditingController: user,
                onChanged: (value) {
                  uservalue = value;
                },
                hint_label: 'Student code / Teacher code', textInputType: TextInputType.text,
              ),
              buildTextFieldCustom(
                textEditingController: phone,
                onChanged: (value) {
                  phonevalue = value;
                },
                hint_label: 'Telephone number',textInputType: TextInputType.number,
              ),
              buildTextFieldCustom(
                textEditingController: email,
                onChanged: (value) {
                  emailvalue = value;
                },
                hint_label: 'Email',textInputType: TextInputType.text,
              ),
              buildTextFieldCustom(
                textEditingController: name,
                onChanged: (value) {
                  namevalue = value;
                },
                hint_label: 'Name',textInputType: TextInputType.text,
              ),
              buildTextFieldCustom(
                textEditingController: lastname,
                onChanged: (value) {
                  lastnamevalue = value;
                },
                hint_label: 'Last name',textInputType: TextInputType.text,
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
                hint_label: 'Confirm password',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Center(
                child: ButtonCustom(
                  label: "  Sign Up  ", screengo: RegisterConfirmScreen(),colortext: TC_Black, colorbutton: BC_ButtonGreen, sizetext: sizeTextBig20,
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
  }
}
