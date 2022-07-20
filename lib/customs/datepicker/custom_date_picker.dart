import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class customDatePicker extends StatefulWidget {
  final String hintLabel;
  final Function(String result) callbackFromCustomDatePicker;

  const customDatePicker(
      {Key? key, required this.hintLabel, required this.callbackFromCustomDatePicker})
      : super(key: key);

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

                    builder: (context, child) {
                      return Theme(data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          primary: Color(0xfff9ccff),
                          onPrimary: Colors.black,
                          onSurface: Colors.black,
                        ), textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(primary: Colors.black,
                        ),
                      ),
                      ), child: child!,);},

                    context: context,
                    initialDate: date,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100));
                if (newDate == null) return;
                setState(() {
                  date = newDate;
                  String dateFormated = DateFormat('d-M-y').format(date);
                  widget.callbackFromCustomDatePicker(dateFormated);
                });
              },
              icon: Icon(Icons.calendar_month))
        ],
      ),
    );
  }
}
