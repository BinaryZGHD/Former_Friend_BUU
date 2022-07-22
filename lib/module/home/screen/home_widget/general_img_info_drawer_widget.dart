import 'package:f2fbuu/module/profile/model/response/api_profile.dart';
import 'package:flutter/material.dart';

buildTableGeneralImgeinfo(BuildContext context, ApiProfileResponse? screenprofileResponse,
    {required tb1, required tb2, required tb3}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: Table(
      border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
      columnWidths: {0: FractionColumnWidth(tb1), 1: FractionColumnWidth(tb2), 2: FractionColumnWidth(tb3)},
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                screenprofileResponse?.body?.profileGeneralInfo?.gen?? '-',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Table(children: [
                TableRow(children: [
                  Text(
                    screenprofileResponse?.body?.profileGeneralInfo?.genname?? '-',
                    textAlign: TextAlign.end,
                    style: const TextStyle(fontSize: 18),
                  ),
                ]),
              ]),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          screenprofileResponse?.body?.profileGeneralInfo?.img != null
              ? CircleAvatar(
            radius: 35.0,
            backgroundImage: NetworkImage("${screenprofileResponse?.body?.profileGeneralInfo?.img}"),
          )
              : const CircleAvatar(
            radius: 35.0,
            backgroundImage: AssetImage(
              'assets/logo/profile.png',
            ),
          ),
        ])
      ],
    ),
  );
}