import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class customDatePicker extends StatefulWidget {
  final String hint_label;
  const customDatePicker({Key? key, required this.hint_label}) : super(key: key);


  @override
  State<customDatePicker> createState() => _customDatePickerState();


}

class _customDatePickerState extends State<customDatePicker> {
  DateTime date = DateTime.now() ;
  @override
  Widget build(BuildContext context) {
    String dateformated = DateFormat('EEEE, d/M/y').format(date);
    String hint_label = widget.hint_label;
    // return InkWell(
    //   onTap: () async {
    //     DateTime? newDate = await showDatePicker(
    //         context: context,
    //         initialDate: date,
    //         firstDate: DateTime(2000),
    //         lastDate: DateTime(2100));
    //
    //
    //     if (newDate == null) return;
    //
    //     setState(() => date = newDate);
    //   },
    //   child: Container(
    //     child: Text(
    //       '${date.year}/${date.month}/${date.day}',style: TextStyle(fontSize: 18),
    //     ),
    //   ),
    // );
    /////////////////////////////////
    
    // var hint_label = widget.hint_label;
    // return TextFormField(
    //   style: TextStyle(fontSize: sizeText18, color: Colors.black // height: 2.0,
    //   ),
    //   decoration: InputDecoration(
    //       filled: true,
    //       fillColor: TC_Textfile,
    //       hintText: "" + hint_label,
    //       enabledBorder: OutlineInputBorder(
    //         borderSide: BorderSide(color: TC_Hint),
    //         borderRadius: BorderRadius.all(Radius.circular(30)),
    //       ),
    //       contentPadding: EdgeInsets.all(10),
    //       focusedBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.all(Radius.circular(30)),
    //         borderSide: BorderSide(color: FC_Blue, width: 2.0),
    //       )),
    // );
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.only(left:10, right: 10),
      decoration: BoxDecoration(
        border: Border.all(color: TC_Hint),
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Container(
          //   // color: Colors.red,
          //   width: MediaQuery.of(context).size.width*0.6,
          //   child: TextField(
          //     decoration: InputDecoration(
          //       border: InputBorder.none,
          //       // labelText: hint_label,
          //       hintText: hint_label,
          //     ),
          //   ),
          // ),
          Text(dateformated,style: TextStyle(fontSize: 18),),
          IconButton(onPressed: ()async {
          DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: date,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100));
          if (newDate == null) return;
          setState(() => date = newDate);
        }, icon: Icon(Icons.calendar_month))
        ],
      ),
    );
  }
}
