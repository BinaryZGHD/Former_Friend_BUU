import 'package:f2fbuu/customs/size/size.dart';
import 'package:flutter/material.dart';

import '../color/colorconts.dart';

class BuildTextFieldCustom extends StatefulWidget {
  final TextEditingController? textEditingController;
  final String hintLabel;
  final TextInputType textInputType;
  final ValueChanged<String>? onChanged;
  final int? maxLengthOTP;
  final String? initialvalue;
  const BuildTextFieldCustom(
      {Key? key, this.textEditingController, required this.hintLabel, this.onChanged, required this.textInputType, this.initialvalue, this.maxLengthOTP})
      : super(key: key);

  @override
  State<BuildTextFieldCustom> createState() => _BuildTextFieldCustomState();
}

class _BuildTextFieldCustomState extends State<BuildTextFieldCustom> {

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(12),
        margin: const EdgeInsets.all(12),
        // decoration: BoxDecoration(color: Colors.red[50], borderRadius: BorderRadius.circular(16)),
        child: TextFormField(
          maxLength: widget.maxLengthOTP,
          style: TextStyle(fontSize: sizeText18, color: Colors.black // height: 2.0,
          ),
          keyboardType: widget.textInputType,
          // controller: textEditingController,
          initialValue: widget.initialvalue,
          // decoration: InputDecoration.collapsed(hintText: hint_label), style: TextStyle(fontSize: 18)
          onChanged: widget.onChanged,

          // {
          //   onChangedtest!(value);
          //   print(hint_label + "    :" + value);
          // },
          decoration: InputDecoration(
              filled: true,
              fillColor: tcTextfile,
              hintText: "" + widget.hintLabel,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: tcHint),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              contentPadding: EdgeInsets.all(10),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: fcBlue, width: 2.0),
              )),
        ));
  }
}
