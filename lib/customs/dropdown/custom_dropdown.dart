import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:flutter/material.dart';

class customDropdown extends StatefulWidget {
  final String hint;
  final List<String> dropdownList;
  final double width;
  final dropdownvalue;
  // final Function(String result) callbackFromCustomDropdown;
  const customDropdown(
      {Key? key,
      required this.hint,
      required this.dropdownList,
      required this.width,
      this.dropdownvalue
        // , required this.callbackFromCustomDropdown
      })
      : super(key: key);

  @override
  State<customDropdown> createState() => _customDropdownState();
}

class _customDropdownState extends State<customDropdown> {
  String? dropdownValue;
  @override
  void initState(){
    dropdownValue = widget.dropdownvalue;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String hint = widget.hint;
    // List<String>? dropdownlist = widget.dropdownList;
    // var dropdownValue = widget.dropdownvalue;
    // print(dropdownValue);
    return Container(
      // height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: TC_Hint),
            borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(15),
      child: SizedBox(
        width: widget.width,
        child:
        //-----------------------------------------------------------//
        // DropdownButtonFormField<String>(
        //   // alignment: Alignment.centerRight,
        //   isExpanded: true,
        //   decoration: InputDecoration(
        //       contentPadding: EdgeInsets.all(10),
        //       border: OutlineInputBorder(),
        //       enabledBorder: OutlineInputBorder(
        //         borderSide: BorderSide(color: TC_Hint),
        //         borderRadius: BorderRadius.all(Radius.circular(30)),
        //       ),
        //       focusedBorder: OutlineInputBorder(
        //         borderRadius: BorderRadius.all(Radius.circular(30)),
        //         borderSide: BorderSide(color: FC_Blue, width: 2.0),
        //       )),
        //   hint: Text(hint),
        //   // value: dropdownValue,
        //   items: dropdownlist
        //       ?.map((item) => DropdownMenuItem<String>(
        //           value: item,
        //           child: Text(
        //             item,
        //             style: TextStyle(fontSize: 18),
        //           )))
        //       .toList(),
        //   onChanged: (item) => setState(() {
        //     dropdownValue = item ?? '';
        //     // widget.callbackFromCustomDropdown(dropdownValue);
        //   }),
        // ),
        //---------------------------------------------------------//
        PopupMenuButton<String>(
          child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        dropdownValue??hint,
                        style: TextStyle(fontSize: sizeText18, color: Colors.black
                        ),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                      ),
                    )),
                const Icon(Icons.keyboard_arrow_down)
              ]),
          itemBuilder: (context) {
            return List.generate(widget.dropdownList.length,
                    (index) {
                  return PopupMenuItem(
                    child:
                    Text(widget.dropdownList[index]),
                    value: widget.dropdownList[index],
                  );
                });
          },
          onSelected: (value) {
            setState(() {
              dropdownValue = value;
              // widget.callbackFromAttentionDataTab(userattentionvalue??"-");
            });
          },
        ),
      ),
    );
  }
}
