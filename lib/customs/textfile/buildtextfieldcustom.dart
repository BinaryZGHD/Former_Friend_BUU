import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class buildTextFieldCustom extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String hint_label;
  final ValueChanged<String>? onChanged;
  const buildTextFieldCustom({Key? key, this.textEditingController, required this.hint_label, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(12),
        margin: const EdgeInsets.all(12),
        // decoration: BoxDecoration(color: Colors.red[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
          controller: textEditingController,
          // onChanged: onChanged,
          // autofocus: true,
          // decoration: InputDecoration.collapsed(hintText: hint_label), style: TextStyle(fontSize: 18)
          onChanged: (value) {
            print(hint_label + "    :" + value);
          },
          decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFFFF3FA),
              hintText: "" + hint_label,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFAFAFAF)),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              contentPadding: EdgeInsets.all(10),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Color(0xFF0647FD), width: 2.0),
              )),
        ));
  }
}
