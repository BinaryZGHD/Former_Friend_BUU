import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color/colorconts.dart';
import '../dialog/texterror.dart';
import '../size/size.dart';

class buildTextFieldPasswordCustom extends StatefulWidget {
  final TextEditingController? textEditingController;
  final String hint_label;
  final TextInputType textInputType;
  final ValueChanged<String>? onChanged;
  final String? initialvalue;
  const buildTextFieldPasswordCustom(
      {Key? key, this.textEditingController, required this.hint_label, this.onChanged, required this.textInputType, this.initialvalue})
      : super(key: key);
  @override
  State<buildTextFieldPasswordCustom> createState() => _buildTextFieldPasswordCustomState();
}

class _buildTextFieldPasswordCustomState extends State<buildTextFieldPasswordCustom> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(12),
        margin: const EdgeInsets.all(12),
        // decoration: BoxDecoration(color: Colors.red[50], borderRadius: BorderRadius.circular(16)),
        child: TextFormField(
          style: TextStyle(fontSize: sizeText18, color: Colors.black // height: 2.0,
          ),
          keyboardType: widget.textInputType,
          // controller: textEditingController,
          initialValue: widget.initialvalue,
          // decoration: InputDecoration.collapsed(hintText: hint_label), style: TextStyle(fontSize: 18)
          onChanged: widget.onChanged,
          obscureText: !_isVisible,
          decoration: InputDecoration(
              filled: true,
              fillColor: TC_Textfile,
              hintText: "" + widget.hint_label,

              suffixIcon: IconButton(
                  onPressed: () {
                    setState( () {
                      _isVisible = !_isVisible;
                    });
                  },
                  icon: _isVisible
                      ? Icon(Icons.visibility, color: Color(0xFF4F4F4F))
                      : Icon(Icons.visibility_off, color: Color(0xFF4F4F4F))),
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
