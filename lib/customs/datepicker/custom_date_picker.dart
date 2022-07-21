import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  final String hintLabel;
  final Function(String result) callbackFromCustomDatePicker;

  const CustomDatePicker(
      {Key? key, required this.hintLabel, required this.callbackFromCustomDatePicker})
      : super(key: key);

  @override
  State<CustomDatePicker> createState() => CustomDatePickerState();
}

class CustomDatePickerState extends State<CustomDatePicker> {
  // DateTime date = DateTime(2020,10,20);
  // DateTime date = DateTime.now();
  DateTime date = DateTime.now();
  // DateTime date = DateTime(2022, 12, 24);

  @override
  Widget build(BuildContext context) {
    String dateFormated = DateFormat('d-M-y').format(date);

    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        border: Border.all(color: tcHint),
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dateFormated,
            style: const TextStyle(fontSize: 18),
          ),
          IconButton(
              onPressed: () async {
                DateTime? newDate = await showDatePicker(

                    builder: (context, child) {
                      return Theme(data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.light(
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
              icon: const Icon(Icons.calendar_month))
        ],
      ),
    );
  }
}
