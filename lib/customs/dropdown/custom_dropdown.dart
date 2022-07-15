import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:flutter/material.dart';

class customDropdown extends StatefulWidget {
  final String hint;
  final List<String>? dropdownList;
  final double width;
  final dropdownvalue;
  const customDropdown(
      {Key? key,
      required this.hint,
      required this.dropdownList,
      required this.width,
      this.dropdownvalue})
      : super(key: key);

  @override
  State<customDropdown> createState() => _customDropdownState();
}

class _customDropdownState extends State<customDropdown> {
  @override
  Widget build(BuildContext context) {
    String hint = widget.hint;
    List<String>? dropdownlist = widget.dropdownList;
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
                borderSide: BorderSide(color: TC_Hint),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: FC_Blue, width: 2.0),
              )),
          hint: Text(hint),
          // value: dropdownValue,
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
