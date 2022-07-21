
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class ItemActivity extends StatelessWidget {
  final dynamic data;
  final dynamic title;
  final GestureTapCallback? onTap;
  const ItemActivity({Key? key, required this.data, this.onTap, this.title }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(

            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: HexColor(data?.color)),
            // margin: EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width ,
            margin:  const EdgeInsets.only(left: 0,top: 3,right: 0 , bottom: 0),
            child: Table(
              border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
              columnWidths: const {0: FractionColumnWidth(0.3), 1: FractionColumnWidth(0.03), 2: FractionColumnWidth(0.65)},
              // defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                _buildListActivity(
                    title: title?.textactivity, dataDetail:data?.name),
                _buildListEmpty(),
                _buildListActivity(title: title?.edtapprover, dataDetail: data?.approver),
                _buildListEmpty(),
                _buildListActivity(title: title?.texttime , dataDetail: data?.startdate +" - "+ data?.finishdate + "\n"+ data?.time+ title?.texttimestatus ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

_buildListActivity({required String dataDetail, required String title}) {
  return TableRow(children: [
    Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    const Text(':', textAlign: TextAlign.start),
    Text(
      dataDetail,
      style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w500,),
    ),
  ]);
}

_buildListEmpty() {
  return const TableRow(children: [
    SizedBox(),
    SizedBox(),
    SizedBox(height: 8,),
  ]);
}

