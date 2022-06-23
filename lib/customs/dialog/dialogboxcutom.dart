import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../button/box.dart';
import '../size/size.dart';
import 'constantsdialog.dart';

class CustomDialogBox extends StatefulWidget {
  final String textfieldvalue, id, description;
  final Widget mapscreen;
  final VoidCallback? onPressed;
  const CustomDialogBox({
    Key? key,
    required this.id,
    required this.textfieldvalue,
    required this.description,
    required this.mapscreen,  this.onPressed,
  }) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ConstantsDialog.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: ConstantsDialog.padding,
              top: ConstantsDialog.avatarRadius + ConstantsDialog.padding,
              right: ConstantsDialog.padding,
              bottom: ConstantsDialog.padding),
          margin: EdgeInsets.only(top: ConstantsDialog.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(ConstantsDialog.padding),
              boxShadow: [
                BoxShadow(color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Text(
              //   widget.title,
              //   style: TextStyle(fontSize: sizeText18, fontWeight: FontWeight.w600),
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              Text("     "+
              widget.textfieldvalue,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 22,
              ),
              Text(
                  widget.description,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: this.widget.onPressed,
                    // onPressed: () {
                    //   // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                    //   //   // int index = int.parse(widget.id);
                    //   //   return widget.mapscreen;
                    //   //   // DisplayBeerScreen();
                    //   // }));
                    //   Navigator.of(context).pop();
                    // },
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 50.0, minHeight: 30.0),
                      alignment: Alignment.center,
                      child: Text(
                        "OK",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ) // Text(widget.text,style: TextStyle(fontSize: 18),)
                    ),
              ),
            ],
          ),
        ),
        // Positioned(
        //   left: ConstantsDialog.padding,
        //   right: ConstantsDialog.padding,
        //   child: CircleAvatar(
        //     backgroundColor: Colors.transparent,
        //     radius: ConstantsDialog.avatarRadius,
        //     child: ClipRRect(
        //         borderRadius: BorderRadius.all(Radius.circular(ConstantsDialog.avatarRadius)),
        //         child: Image.asset(widget.img,fit: BoxFit.cover,)
        //     ),
        //   ),
        // ),
        Positioned(
          right: 0.0,
          top: 50.0,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },

            child: Icon(
              Icons.close,
              color: Colors.black,
              size: 20,
            ), // Text(widget.text,style: TextStyle(fontSize: 18),)
          ),
          //Icon
        ),
      ],
    );
  }
}


// showDialog(
//     context: context,
//     builder: (context) => CustomDialogBox(
//           id: '',
//           textfieldvalue: "Register  :  $uservalue" +
//               "\nTelrphone number  :  $phonevalue" +
//               "\nEmail  :  $emailvalue" +
//               "\nName  :  $namevalue" +
//               "\nLast name  :  $lastnamevalue" +
//               "\nPassword  :  $passwordvalue" +
//               "\nConfirm password  :  $confirmpasswordvalue",
//           description: errregidter1 + '\n \n ' + 'Do you want to continue?',
//           mapscreen: registerConfirmScreen(
//               titleconregis: "${_dataFromAPIRegisterWording?.body?.screeninfo?.titleconregis}" ,
//               textotpwillsent: "${_dataFromAPIRegisterWording?.body?.screeninfo?.textotpwillsent}" ,
//               textpleaseconfirm: "${_dataFromAPIRegisterWording?.body?.screeninfo?.textpleaseconfirm}" ,
//               textsentotpagain:"${_dataFromAPIRegisterWording?.body?.screeninfo?.textsentotpagain}"  ,
//               textotp: "${_dataFromAPIRegisterWording?.body?.screeninfo?.textotp}" ,
//               btnconfirm: "${_dataFromAPIRegisterWording?.body?.screeninfo?.btnconfirm}" ,
//               edtemailreg:"${_dataFromAPIRegisterWording?.body?.screeninfo?.edtemailreg}"
//           ),
//         ));