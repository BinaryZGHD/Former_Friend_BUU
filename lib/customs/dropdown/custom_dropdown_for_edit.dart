import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:flutter/material.dart';

class customDropdownForEdit extends StatefulWidget {
  final String hint;
  final List<String>? dropdownlist;
  final double width;
  final dropdownvalue;
  const customDropdownForEdit(
      {Key? key,
        required this.hint,
        required this.dropdownlist,
        required this.width,
        this.dropdownvalue})
      : super(key: key);

  @override
  State<customDropdownForEdit> createState() => _customDropdownForEditState();
}

class _customDropdownForEditState extends State<customDropdownForEdit> {
  @override
  Widget build(BuildContext context) {
    String hint = widget.hint;
    List<String>? dropdownlist = widget.dropdownlist;
    var dropdownValue = widget.dropdownvalue;
    print(dropdownValue);
    return Container(
      margin: const EdgeInsets.all(12),
      child: SizedBox(
        width: widget.width,
        child: DropdownButtonFormField<String>(
          // alignment: Alignment.centerRight,
          isExpanded: true,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: tcHint),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: fcBlue, width: 2.0),
              )),
          hint: Text(hint),
          value: dropdownValue,
          items: dropdownlist
              ?.map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: TextStyle(fontSize: 18),
              )))
              .toList(),
          onChanged: (item) => setState(() => dropdownValue = item ?? ''),
        ),
      ),
    );
  }
}
