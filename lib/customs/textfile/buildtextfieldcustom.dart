import 'package:f2fbuu/customs/size/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color/colorconts.dart';

class buildTextFieldCustom extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String hint_label;
  final TextInputType textInputType;
  final ValueChanged<String>? onChanged;
  const buildTextFieldCustom(
      {Key? key, this.textEditingController, required this.hint_label, this.onChanged, required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: EdgeInsets.all(12),
        margin: const EdgeInsets.all(12),
        // decoration: BoxDecoration(color: Colors.red[50], borderRadius: BorderRadius.circular(16)),
        child: TextFormField(
          style: TextStyle(fontSize: sizeText18, color: Colors.black // height: 2.0,
              ),
          keyboardType: textInputType,
          // controller: textEditingController,// decoration: InputDecoration.collapsed(hintText: hint_label), style: TextStyle(fontSize: 18)
          onChanged: onChanged,

          // {
          //   onChangedtest!(value);
          //   print(hint_label + "    :" + value);
          // },
          decoration: InputDecoration(
              filled: true,
              fillColor: TC_Textfile,
              hintText: "" + hint_label,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: TC_Hint),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              contentPadding: EdgeInsets.all(10),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: FC_Blue, width: 2.0),
              )),
        ));
  }
}
