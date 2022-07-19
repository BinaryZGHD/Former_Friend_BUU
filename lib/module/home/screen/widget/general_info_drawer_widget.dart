import 'package:f2fbuu/customs/size/size.dart';
import 'package:flutter/material.dart';

buildTableGeneralinfo(
    BuildContext context, {
      required textlefttitile,
      required String textrightdetail,
      required tb1,
      required tb2,
      required tb3,
    }) {
  return Table(
    border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
    columnWidths: {0: FractionColumnWidth(tb1), 1: FractionColumnWidth(tb2), 2: FractionColumnWidth(tb3)},
    defaultVerticalAlignment: TableCellVerticalAlignment.top,
    children: [
      TableRow(children: [
        Text(
          textlefttitile,
          textAlign: TextAlign.start,
          style: const TextStyle(fontSize: sizeTextSmaller14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(),
        Text(
          textrightdetail,
          textAlign: TextAlign.end,
          style: const TextStyle(fontSize: sizeTextSmaller14),
        ),
      ])
    ],
  );
}