import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class customDatePicker extends StatefulWidget {
  final String hintLabel;
  final Function(String result) callbackFromCustomDatePicker;
  const customDatePicker({Key? key, required this.hintLabel, required this.callbackFromCustomDatePicker}) : super(key: key);

  @override
  State<customDatePicker> createState() => _customDatePickerState();
}

class _customDatePickerState extends State<customDatePicker> {
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    String dateFormated = DateFormat('d-M-y').format(date);

    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        border: Border.all(color: tcBlack),
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dateFormated,
            style: TextStyle(fontSize: 18),
          ),
          IconButton(
              onPressed: () async {
                DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: date,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100));
                if (newDate == null) return;
                setState(() {
                  date = newDate;
                  widget.callbackFromCustomDatePicker(date.toString()??"-");
                });
              },
              icon: Icon(Icons.calendar_month))
        ],
      ),
    );
  }
}
