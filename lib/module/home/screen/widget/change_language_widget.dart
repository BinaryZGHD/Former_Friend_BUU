

import 'package:f2fbuu/customs/size/size.dart';
import 'package:flutter/material.dart';

ChangLanguage(
    BuildContext context,
    void Function() toggleLanguageView,
    bool isHidden, {
      required String textlefttitile,
      required String textrightdetail,
      required tb1,
      required tb2,
      required tb3,
    }) {
  return Table(
    border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
    columnWidths: {0: FractionColumnWidth(tb1), 1: FractionColumnWidth(tb2), 2: FractionColumnWidth(tb3)},
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      TableRow(children: [
        Text(
          textlefttitile,
          textAlign: TextAlign.start,
          style: const TextStyle(fontSize: sizeTextSmaller14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              textrightdetail,
              style: const TextStyle(fontSize: sizeTextSmaller14),
            ),
            //
            // _toggle(),
            IconButton(
                onPressed: toggleLanguageView,
                icon: isHidden
                    ? const Icon(Icons.toggle_on, color: Color(0xFF00A80A))
                    : const Icon(Icons.toggle_off, color: Color(0xFF4F4F4F)))
            // IconButton(
            //     onPressed: () {
            //       _isVisible = !_isVisible;
            //     },
            //     icon: _isVisible
            //         ? Icon(Icons.toggle_off, color: Color(0xFF4F4F4F))
            //         : Icon(Icons.toggle_on, color: Color(0xFF00A80A))),
          ],
        ),
      ])
    ],
  );
}
