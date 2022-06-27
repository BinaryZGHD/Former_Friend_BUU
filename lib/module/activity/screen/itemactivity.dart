
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class ItemActivity extends StatelessWidget {
  final data;
  final title;
  final GestureTapCallback? onTap;
  ItemActivity({Key? key, required this.data, this.onTap, this.title, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(

            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: HexColor(data?.color)),
            // margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width ,
            margin:  EdgeInsets.only(left: 0,top: 3,right: 0 , bottom: 0),
            child: Table(
              border: TableBorder.symmetric(outside: BorderSide(width: 2, color: Colors.transparent)),
              columnWidths: {0: FractionColumnWidth(0.3), 1: FractionColumnWidth(0.03), 2: FractionColumnWidth(0.65)},
              // defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                _buildListActivity(
                    title: title?.textactivity, datadetail:data?.name),
                _buildListenpty(),
                _buildListActivity(title: title?.edtapprover, datadetail: data?.approver),
                _buildListenpty(),
                _buildListActivity(title: title?.texttime , datadetail: data?.startdate +" - "+ data?.finishdate + "\n"+ data?.time+ title?.texttimestatus ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

_buildListActivity({required String datadetail, required String title}) {
  return TableRow(children: [
    Text(
      title,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    Text(':', textAlign: TextAlign.start),
    Text(
      datadetail,
      style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,),
    ),
  ]);
}

_buildListenpty() {
  return TableRow(children: [
    SizedBox(),
    SizedBox(),
    SizedBox(height: 8,),
  ]);
}

