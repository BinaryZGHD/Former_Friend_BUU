import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color/colorconts.dart';
import '../dialog/texterror.dart';
import '../size/size.dart';

class buildTextFieldPasswordCustom extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String hint_label;
  final ValueChanged<String>? onChanged;
  const buildTextFieldPasswordCustom({Key? key, this.textEditingController, required this.hint_label, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildTextFieldPasswordCustom_ful(
      textEditingController: textEditingController,
      hint_label: hint_label,
      onChanged: onChanged,
    );
  }


}
class buildTextFieldPasswordCustom_ful extends StatefulWidget {

  final TextEditingController? textEditingController;
  final String hint_label;
  final ValueChanged<String>? onChanged;
  // final TextInputType textInputType;
  const buildTextFieldPasswordCustom_ful({Key? key, this.textEditingController, required this.hint_label, this.onChanged, }) : super(key: key);

  @override
  State<buildTextFieldPasswordCustom_ful> createState() => _buildTextFieldPasswordCustom_fulState();
}

class _buildTextFieldPasswordCustom_fulState extends State<buildTextFieldPasswordCustom_ful> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {

    return
      Container(
        // padding: EdgeInsets.all(12),
          margin: const EdgeInsets.all(12),
          // decoration: BoxDecoration(color: Colors.red[50], borderRadius: BorderRadius.circular(16)),
          child: TextFormField(
            style: TextStyle(fontSize: sizeText18, color: Colors.black // height: 2.0,
            ),
            // keyboardType: textInputType,
            controller: widget.textEditingController,
            // onChanged: (value) {
            //   print(widget.hint_label + "  2  :"+value) ;
            //   setState(() { textconsole = value;});
            // },

            onChanged: widget.onChanged,
            // autofocus: true,
            // decoration: InputDecoration.collapsed(hintText: hint_label), style: TextStyle(fontSize: 18)
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
                  borderSide: BorderSide(color: Color(0xFFAFAFAF)),
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

