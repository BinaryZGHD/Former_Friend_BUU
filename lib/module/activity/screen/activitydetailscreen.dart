import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/dialog/texterror.dart';
import 'package:f2fbuu/module/activity/bloc/activity_bloc.dart';
import 'package:f2fbuu/module/activity/screen/edit_activity.dart';
import 'package:f2fbuu/module/home/screen/homescreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../customs/color/colorconts.dart';
import '../../../../customs/size/size.dart';

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
  bool showButton = false;

  //---------------------------------API----------------------------------------//
  @override
  void initState() {
    title = widget.title;
    data = widget.data;
    print('เรียก initState');
    // getActivityDetailApi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print('${data.status}');
    var myIcon = Icon(
      Icons.question_mark,
      color: Colors.black,
    );
    if (data.status == "Unapproved!") {
      print('เข้า Unapproved!');
      myIcon = Icon(
        Icons.alarm,
        color: Colors.black,
      );
      showButton = true;
    } else if (data.status == "Approved!") {
      print('เข้า Approved!');
      myIcon = Icon(
        Icons.check_circle,
        color: Colors.black,
      );
      showButton = false;
    } else if (data.status == "Rejected!") {
      print('เข้า Rejected');
      myIcon = Icon(
        Icons.cancel,
        color: Colors.black,
      );
      showButton = false;
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
        child: Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.65,
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
                          BuildTableRow(context, textLeftTable: title.textactivity, textRightTableDetail: '${data.name}'),
                          _buildListenpty(),
                          BuildTableRow(context,
                              textLeftTable: '${title.textyear}', textRightTableDetail: '${data.year}'),
                          _buildListenpty(),
                          BuildTableRow(context,
                              textLeftTable: '${title.textterm}', textRightTableDetail: '${data.term}'),
                          _buildListenpty(),
                          BuildTableRow(context,
                              textLeftTable: '${title.textstartdate}', textRightTableDetail: '${data.startdate}'),
                          _buildListenpty(),
                          BuildTableRow(context,
                              textLeftTable: '${title.textfinishdate}', textRightTableDetail: '${data.finishdate}'),
                          _buildListenpty(),
                          BuildTableRow(context,
                              textLeftTable: '${title.texttime}', textRightTableDetail: '${data.time}' + " ( hh:mm ) "),
                          _buildListenpty(),
                          BuildTableRow(context,
                              textLeftTable: '${title.edtapprover}', textRightTableDetail: '${data.approver}'),
                          _buildListenpty(),
                          BuildTableRow(context,
                              textLeftTable: '${title.textvenue}', textRightTableDetail: '${data.venue}'),
                          _buildListenpty(),
                          BuildTableRow(context,
                              textLeftTable: '${title.textdetail}', textRightTableDetail: '${data.detail}')
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
                    myIcon,
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
            showButton
                ? Padding(
                    padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
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
                                colortext: tcButtonTextBlack,
                                colorbutton: tcButtonTextWhite,
                                sizetext: sizeTextSmaller14,
                                colorborder: tcButtonTextBoarder,
                                sizeborder: 1.0,
                              )),
                          SizedBox(
                            width: 50,
                          ),
                          Container(
                              width: 100,
                              child: ButtonCustom(
                                colortext: tcButtonTextWhite,
                                colorbutton: tcButtonTextRed,
                                sizetext: sizeTextSmaller14,
                                colorborder: tcButtonTextRedBoarder,
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
                                              context.read<ActivityBloc>().add(SubmitDeleteActivityEvent(id:'${data.id}'));
                                              print('${data.id}');
                                              // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                              //   // int index = int.parse(widget.id);
                                              //   return HomeScreen(
                                              //   );
                                              //   // DisplayBeerScreen();
                                              // }));
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
          ]),
        ),
      ),
    );
  }
}
BuildTableRow(BuildContext context, {required String textLeftTable, required String textRightTableDetail}) {
  return TableRow(children: [
    Text(
      '   ' + textLeftTable,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
    ),
    Text(
      ':',
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
    ),
    Text(
      textRightTableDetail,
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
