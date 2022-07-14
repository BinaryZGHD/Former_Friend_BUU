import 'dart:convert';

import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/dialog/texterror.dart';
import 'package:f2fbuu/module/activity/screen/edit_activity.dart';
import 'package:f2fbuu/module/home/screen/homescreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../customs/color/colorconts.dart';
import '../../../../customs/size/size.dart';
import 'package:http/http.dart' as http;

class ActivityDetailScreen extends StatefulWidget {
  final title;
  final data;

  const ActivityDetailScreen({Key? key, required this.title, this.data}) : super(key: key);

  @override
  State<ActivityDetailScreen> createState() => _ActivityDetailScreenState();
}

class _ActivityDetailScreenState extends State<ActivityDetailScreen> {
  var title;
  var data;
  bool showbutton = false;

  //---------------------------------API----------------------------------------//
  @override
  void initState() {
    title = widget.title;
    data = widget.data;
    print('เรียก initState');
    // getActivityDetailApi();
    super.initState();
  }

  // Future<ActivityDetailApi> getActivityDetailApi() async {
  //   var url =
  //   Uri.parse('https://test-api-ceecf.web.app/v1/home/activityscreen');
  //   var response = await http.get(url);
  //   // print(response.body);
  //   _dataFromAPI = activityDetailApiFromJson(utf8.decode(response.bodyBytes));
  //   // print('${_dataFromAPI.body}');
  //   return _dataFromAPI;
  // }

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
    // return FutureBuilder(
    //     future: getActivityDetailApi(),
    //     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    //       // print('${_dataFromAPI.body?.activity?.status}');
    //       if (snapshot.connectionState == ConnectionState.done) {

    print('${data.status}');
    var myicon = Icon(
      Icons.question_mark,
      color: Colors.black,
    );
    if (data.status == "Unapproved!") {
      print('เข้า Unapproved!');
      myicon = Icon(
        Icons.alarm,
        color: Colors.black,
      );
      showbutton = true;
    } else if (data.status == "Approved!") {
      print('เข้า Approved!');
      myicon = Icon(
        Icons.check_circle,
        color: Colors.black,
      );
      showbutton = false;
    } else if (data.status == "Rejected!") {
      print('เข้า Rejected');
      myicon = Icon(
        Icons.cancel,
        color: Colors.black,
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
            '${data.status}',
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
        child: Padding(
          padding: EdgeInsets.only(
            top: 5,
            left: 10,
            right: 10,
            bottom: 5,
          ),
          child: Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            // height: MediaQuery.of(context).size.height * 0.9,
            // width: MediaQuery.of(context).size.width ,
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                  child: Container(
                    // height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                      color: HexColor('${data.color}'),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 5, right: 5, bottom: 20),
                        child: Table(
                          border: TableBorder.symmetric(outside: BorderSide(width: 2, color: Colors.transparent)),
                          columnWidths: <int, TableColumnWidth>{
                            0: FractionColumnWidth(0.35),
                            1: FractionColumnWidth(0.05),
                            2: FractionColumnWidth(0.60),
                          },
                          // defaultVerticalAlignment:
                          // TableCellVerticalAlignment.middle,
                          children: [
                            BuildTableRow(context, textlefttable: title.textactivity, textrighttabledetail: '${data.name}'),
                            _buildListenpty(),
                            BuildTableRow(context,
                                textlefttable: '${title.textyear}', textrighttabledetail: '${data.year}'),
                            _buildListenpty(),
                            BuildTableRow(context,
                                textlefttable: '${title.textterm}', textrighttabledetail: '${data.term}'),
                            _buildListenpty(),
                            BuildTableRow(context,
                                textlefttable: '${title.textstartdate}', textrighttabledetail: '${data.startdate}'),
                            _buildListenpty(),
                            BuildTableRow(context,
                                textlefttable: '${title.textfinishdate}', textrighttabledetail: '${data.finishdate}'),
                            _buildListenpty(),
                            BuildTableRow(context,
                                textlefttable: '${title.texttime}', textrighttabledetail: '${data.time}' + " ( hh:mm ) "),
                            _buildListenpty(),
                            BuildTableRow(context,
                                textlefttable: '${title.edtapprover}', textrighttabledetail: '${data.approver}'),
                            _buildListenpty(),
                            BuildTableRow(context,
                                textlefttable: '${title.textvenue}', textrighttabledetail: '${data.venue}'),
                            _buildListenpty(),
                            BuildTableRow(context,
                                textlefttable: '${title.textdetail}', textrighttabledetail: '${data.detail}')
                          ],
                        ),
                      ),
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
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${data.status}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              showbutton
                  ? Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Container(

                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 100,
                          child: ButtonCustom(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return editActivity(data: data);
                              }));
                            },
                            label: '${title.buttonleft}',
                            colortext: BC_ButtonText_style_Black,
                            colorbutton: BC_ButtonText_style_White,
                            sizetext: sizeTextSmaller14,
                            colorborder: BC_ButtonText_style_Black_Boarder,
                            sizeborder: 1.0,
                          )),
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                          width: 100,
                          child: ButtonCustom(
                            colortext: BC_ButtonText_style_White,
                            colorbutton: BC_ButtonText_style_Red,
                            sizetext: sizeTextSmaller14,
                            colorborder: BC_ButtonText_style_Red_Boarder,
                            sizeborder: 10,
                            label: '${title.buttonright}',
                            onPressed: () {
                              dialogOneLineTwoBtn(context, errlogout + '\n \n ' + 'Do you want to continue?', 'Confirm', 'Cancel',
                                  onClickBtn: (String result) {
                                    Navigator.of(context).pop();
                                    switch (result) {
                                      case 'Cancel':
                                        {
                                          break;
                                        }
                                      case 'OK':
                                        {
                                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                            // int index = int.parse(widget.id);
                                            return HomeScreen(
                                            );
                                            // DisplayBeerScreen();
                                          }));
                                        }
                                    }
                                  });
                            },

                          )),
                    ],
                  ),
                ),
              )
                  : Text(''),
              //ปุ่ม
            ]),
          ),
        ),
      ),
    );
  }
// return Scaffold(
//   appBar: AppBar(
//     backgroundColor: Colors.white,
//     title: Text(''),
//     centerTitle: true,
//   ),
//   body: Center(
//     child: CircularProgressIndicator(),
//   ),
// );
// }
// );
}

BuildTableRow(BuildContext context, {required String textlefttable, required String textrighttabledetail}) {
  return TableRow(children: [
    Text(
      '   ' + textlefttable,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
    ),
    Text(
      ':',
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
    ),
    Text(
      textrighttabledetail,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Color(0xFF333333)),
    )
  ]);
}

////////////////////////////////////////////////////////////////////////////////
_buildListenpty() {
  return TableRow(children: [
    SizedBox(),
    SizedBox(),
    SizedBox(
      height: 30,
    ),
  ]);
}
