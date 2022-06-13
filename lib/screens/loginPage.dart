import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String hint_label;
  final ValueChanged<String>? onChanged ;
  const TextFormFieldCustom({Key? key, required this.hint_label, this.textEditingController, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldCustomful(
      hint_label: hint_label,
      textEditingController: textEditingController,
      onChanged: onChanged,
    );
  }
}

class TextFormFieldCustomful extends StatefulWidget {
  final TextEditingController? textEditingController;
  final String hint_label;
  final ValueChanged<String>? onChanged ;
  const TextFormFieldCustomful({Key? key, required this.hint_label, this.textEditingController, this.onChanged}) : super(key: key);

  @override
  State<TextFormFieldCustomful> createState() => _TextFormFieldCustomfulState();
}

class _TextFormFieldCustomfulState extends State<TextFormFieldCustomful> {
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(5),
      child: TextFormField(
        controller: widget.textEditingController,
        // controller: textEditingController,
        // onChanged: onChanged,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromRGBO(224, 229, 242, 0.5),
            border: InputBorder.none,
            hintText:  widget.hint_label,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            contentPadding: EdgeInsets.all(10),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color: Color.fromRGBO(203, 217, 255, 1), width: 2.0),
            )
        ),
      ),
    );
    ;
  }
}
// Container buildTextFieldPassword() {
//   return Container(
//       padding: EdgeInsets.all(12),
//       margin: EdgeInsets.only(top: 12),
//       decoration: BoxDecoration(color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
//       child: TextField(
//           obscureText: true,
//           decoration: InputDecoration.collapsed(hintText: "Password"),
//           style: TextStyle(fontSize: 18)));
// }