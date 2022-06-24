import 'dart:convert';

import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/model/homemodel/activitydetailscreenapi/activity_detail_api.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../customs/color/colorconts.dart';
import '../../../../customs/size/size.dart';
import 'package:http/http.dart' as http;

class ActivityDetailScreen extends StatefulWidget {
  final int id;
  final data;

  const ActivityDetailScreen({Key? key, required this.id, this.data})
      : super(key: key);

  @override
  State<ActivityDetailScreen> createState() => _ActivityDetailScreenState();
}

class _ActivityDetailScreenState extends State<ActivityDetailScreen> {
  var id;
  var data;
  bool showbutton = false;

  //---------------------------------API----------------------------------------//
  late ActivityDetailApi _dataFromAPI;

  @override
  void initState() {
    id = widget.id;
    data = widget.data;
    print('เรียก initState');
    getActivityDetailApi();
    super.initState();
  }

  Future<ActivityDetailApi> getActivityDetailApi() async {
    var url =
        Uri.parse('https://test-api-ceecf.web.app/v1/home/activityscreen');
    var response = await http.get(url);
    // print(response.body);
    _dataFromAPI = activityDetailApiFromJson(utf8.decode(response.bodyBytes));
    // print('${_dataFromAPI.body}');
    return _dataFromAPI;
  }

//---------------------------------API----------------------------------------//
//   @override
//   void initState() {
//     id = widget.id;
//     data = widget.data;
//     super.initState();
//   }
  @override
  Widget build(BuildContext context) {
    // print('${_dataFromAPI?.body?.activity?.status}');
    // var myicon = Icon(
    //   Icons.keyboard_arrow_down,
    //   color: Colors.black,
    // );
    // if({_dataFromAPI.body?.activity?.status} == "Unapproved!"){
    //   myicon = Icon(
    //     Icons.check_circle_outline,
    //     color: Colors.green,
    //   );
    // }else if({_dataFromAPI.body?.activity?.status} == "Approved!"){
    //   myicon = Icon(
    //     Icons.check_circle,
    //     color: Colors.green,
    //   );
    // }else if({_dataFromAPI.body?.activity?.status} == "Rejected!"){
    //   myicon = Icon(
    //     Icons.cancel,
    //     color: Colors.red,
    //   );
    // }
    return FutureBuilder(
        future: getActivityDetailApi(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          // print('${_dataFromAPI.body?.activity?.status}');
          if (snapshot.connectionState == ConnectionState.done) {
            print('${_dataFromAPI.body?.activity?.status}');
            var myicon = Icon(
              Icons.question_mark,
              color: Colors.black,
            );
            if (_dataFromAPI.body?.activity?.status == "Unapproved!") {
              print('เข้า Unapproved!');
              myicon = Icon(
                Icons.alarm,
                color: Colors.yellow,
              );
              showbutton = true;
            } else if (_dataFromAPI.body?.activity?.status == "Approved!") {
              print('เข้า Approved!');
              myicon = Icon(
                Icons.check_circle,
                color: Colors.green,
              );
              showbutton = false;
            } else if (_dataFromAPI.body?.activity?.status == "Rejected!") {
              print('เข้า Rejected');
              myicon = Icon(
                Icons.cancel,
                color: Colors.red,
              );
              showbutton = false;
            }
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    setState(() {
                      // print(id);
                      // print(data['venue']);
                    });
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: sizeTitle24,
                    color: Colors.black,
                  ),
                ),
                title: Center(
                  child: Text(
                    // 'ทดสอบ',
                    '${_dataFromAPI.body?.screeninfo?.titlestatus}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                ),
                actions: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                ],
              ),
              body: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 10,bottom: 10),
                  // height: MediaQuery.of(context).size.height * 0.9,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 10, right: 10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.65,
                        decoration: BoxDecoration(
                          color:
                              HexColor('${_dataFromAPI.body?.activity?.color}'),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SingleChildScrollView(
                          child: Table(
                            border: TableBorder.symmetric(
                                outside: BorderSide(
                                    width: 2, color: Colors.transparent)),
                            columnWidths: <int, TableColumnWidth>{
                              0: FractionColumnWidth(0.3),
                              1: FractionColumnWidth(0.05),
                              2: FractionColumnWidth(0.65),
                            },
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: [
                              BuildTableRow(context,
                                  textlefttable:
                                      '${_dataFromAPI.body?.screeninfo?.textactivity}',
                                  textrighttabledetail:
                                      '${_dataFromAPI.body?.activity?.name}'),
                              BuildTableRow(context,
                                  textlefttable:
                                      '${_dataFromAPI.body?.screeninfo?.textyear}',
                                  textrighttabledetail:
                                      '${_dataFromAPI.body?.activity?.year}'),
                              BuildTableRow(context,
                                  textlefttable:
                                      '${_dataFromAPI.body?.screeninfo?.textterm}',
                                  textrighttabledetail:
                                      '${_dataFromAPI.body?.activity?.term}'),
                              BuildTableRow(context,
                                  textlefttable:
                                      '${_dataFromAPI.body?.screeninfo?.textstartdate}',
                                  textrighttabledetail:
                                      '${_dataFromAPI.body?.activity?.startdate}'),
                              BuildTableRow(context,
                                  textlefttable:
                                      '${_dataFromAPI.body?.screeninfo?.textfinishdate}',
                                  textrighttabledetail:
                                      '${_dataFromAPI.body?.activity?.finishdate}'),
                              BuildTableRow(context,
                                  textlefttable:
                                      '${_dataFromAPI.body?.screeninfo?.texttime}',
                                  textrighttabledetail:
                                      '${_dataFromAPI.body?.activity?.time}' +
                                          " ( hh:mm ) "),
                              BuildTableRow(context,
                                  textlefttable:
                                      '${_dataFromAPI.body?.screeninfo?.edtapprover}',
                                  textrighttabledetail:
                                      '${_dataFromAPI.body?.activity?.approver}'),
                              BuildTableRow(context,
                                  textlefttable:
                                      '${_dataFromAPI.body?.screeninfo?.textvenue}',
                                  textrighttabledetail:
                                      '${_dataFromAPI.body?.activity?.venue}'),
                              BuildTableRow(context,
                                  textlefttable:
                                      '${_dataFromAPI.body?.screeninfo?.textdetail}',
                                  textrighttabledetail:
                                      '${_dataFromAPI.body?.activity?.detail}')
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            myicon,
                            SizedBox(width: 10,),
                            Text('${_dataFromAPI.body?.activity?.status}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                    showbutton ?

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(width: 100,child: ButtonCustom(colorborder: Colors.black, colortext: Colors.black, label: '${_dataFromAPI.body?.screeninfo?.buttonleft}', colorbutton: Colors.white, sizetext: 14,sizeborder: 10,)),
                            SizedBox(width: 50,),
                            Container(width: 100, child: ButtonCustom(colorborder: Colors.transparent, colortext: Colors.black, label: '${_dataFromAPI.body?.screeninfo?.buttonright}', colorbutton: Colors.grey, sizetext: 14,sizeborder: 10,)),
                          ],
                        ),
                      ),
                    )
                        : Text(''),
                    //ปุ่ม
                  ]),
                ),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(''),
              centerTitle: true,
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}

BuildTableRow(BuildContext context,
    {required String textlefttable, required String textrighttabledetail}) {
  return TableRow(children: [
    Text(
      '   ' + textlefttable,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
    ),
    Container(
      height: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ':',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
          ),
        ],
      ),
    ),
    Text(
      textrighttabledetail,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
    )
  ]);
}
////////////////////////////////////////////////////////////////////////////////
