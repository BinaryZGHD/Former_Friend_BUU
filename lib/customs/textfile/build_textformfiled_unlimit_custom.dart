import 'package:f2fbuu/customs/size/size.dart';
import 'package:flutter/material.dart';

import '../color/colorconts.dart';

class BuildTextformfieldUnlimitCustom extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String hintLabel;
  final TextInputType textInputType;
  final ValueChanged<String>? onChanged;
  final String? initialvalue;
  const BuildTextformfieldUnlimitCustom(
      {Key? key, this.textEditingController, required this.hintLabel, this.onChanged, required this.textInputType, this.initialvalue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(12),
        margin: const EdgeInsets.all(12),
        // decoration: BoxDecoration(color: Colors.red[50], borderRadius: BorderRadius.circular(16)),
        child: TextFormField(

          style: const TextStyle(fontSize: sizeText18, color: Colors.black // height: 2.0,
          ),
          keyboardType: textInputType,
          maxLines: null,
          // controller: textEditingController,
          initialValue: initialvalue,
          // decoration: InputDecoration.collapsed(hintText: hint_label), style: TextStyle(fontSize: 18)
          onChanged: onChanged,
          // {
          //   onChangedtest!(value);
          //   print(hint_label + "    :" + value);
          // },
          decoration: InputDecoration(
              filled: true,
              fillColor: tcTextfile,
              hintText: " $hintLabel",
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: tcHint),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              contentPadding: const EdgeInsets.all(10),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: fcBlue, width: 2.0),
              )),
        ));
  }
}
