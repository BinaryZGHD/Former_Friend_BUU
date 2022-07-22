import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/dialog/texterror.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/module/activity/bloc/activity_bloc.dart';
import 'package:f2fbuu/module/activity/screen/edit_activity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../customs/color/colorconts.dart';
import '../../../../customs/size/size.dart';

class ActivityDetailScreen extends StatelessWidget {
  final dynamic title;
  final dynamic data;
  const ActivityDetailScreen({Key? key, this.title, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ActivityBloc()..add(AddEditActivityScreenInfoEvent()),
      child: ActivityDetailPage(title: title,data: data),
    );
  }
}

class ActivityDetailPage extends StatefulWidget {
  final dynamic title;
  final dynamic data;

  const ActivityDetailPage({Key? key, required this.title, this.data})
      : super(key: key);

  @override
  State<ActivityDetailPage> createState() => _ActivityDetailPageState();
}

class _ActivityDetailPageState extends State<ActivityDetailPage>
    with ProgressDialog {
  dynamic title;
  dynamic data;
  bool showButton = false;

  //---------------------------------API----------------------------------------//
  @override
  void initState() {
    title = widget.title;
    data = widget.data;
    if (kDebugMode) {
      print('เรียก initState');
    }
    // getActivityDetailApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return BlocConsumer<ActivityBloc,ActivityState>(
       listener: (context, state){
         if (state is ActivityDetailLoading) {
           showProgressDialog(context);
         }
         if (state is ActivityDetailEndLoading) {
           hideProgressDialog(context);
         }
         if (state is ActivityError) {
           // show dialog error
           if (kDebugMode) {
             print(state.message);
           }
         }
         if (state is SubmitDeleteActivityState) {
           // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
           Navigator.pop(context);
         }
       },
     builder: (context, state){

         if(state is ActivityInitial) {
           return buildContextActivity(context, data, showButton, title);
         }
         return Scaffold(
             body: Container(
               color: Colors.white,
             ));
     },
     buildWhen: (context, state){
         return state is ActivityInitial || state is DefaultState;
   },

   );
  }
}

buildTableRow(BuildContext context,
    {required String textLeftTable, required String textRightTableDetail}) {
  return TableRow(children: [
    Text(
      '   $textLeftTable',
      style: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
    ),
    const Text(
      ':',
      style: TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
    ),
    Text(
      textRightTableDetail,
      style: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w300, color: Color(0xFF333333)),
    )
  ]);
}

////////////////////////////////////////////////////////////////////////////////
_buildListenpty() {
  return const TableRow(children: [
    SizedBox(),
    SizedBox(),
    SizedBox(
      height: 30,
    ),
  ]);
}

buildContextActivity(
  BuildContext context,
  data,
  bool showButton,
  title,
) {
  // print('${data.status}');
  var myIcon = const Icon(
    Icons.question_mark,
    color: Colors.black,
  );
  if (data.status == "Unapproved!") {
    if (kDebugMode) {
      print('เข้า Unapproved!');
    }
    myIcon = const Icon(
      Icons.alarm,
      color: Colors.black,
    );
    showButton = true;
  } else if (data.status == "Approved!") {
    if (kDebugMode) {
      print('เข้า Approved!');
    }
    myIcon = const Icon(
      Icons.check_circle,
      color: Colors.black,
    );
    showButton = false;
  } else if (data.status == "Rejected!") {
    if (kDebugMode) {
      print('เข้า Rejected');
    }
    myIcon = const Icon(
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
          // setState(() {
          //   // print(id);
          //   // print(data['venue']);
          // });
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          size: sizeTitle24,
          color: Colors.black,
        ),
      ),
      title: Center(
        child: Text(
          // 'ทดสอบ',
          '${data.status}',
          style: const TextStyle(
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
    body: SafeArea(
      child:Center(
        child: Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
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
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 5, right: 5, bottom: 20),
                      child: Table(
                        border: TableBorder.symmetric(
                            outside:
                            const BorderSide(width: 2, color: Colors.transparent)),
                        columnWidths: const <int, TableColumnWidth>{
                          0: FractionColumnWidth(0.35),
                          1: FractionColumnWidth(0.05),
                          2: FractionColumnWidth(0.60),
                        },
                        // defaultVerticalAlignment:
                        // TableCellVerticalAlignment.middle,
                        children: [
                          buildTableRow(context,
                              textLeftTable: title.textactivity,
                              textRightTableDetail: '${data.name}'),
                          _buildListenpty(),
                          buildTableRow(context,
                              textLeftTable: '${title.textyear}',
                              textRightTableDetail: '${data.year}'),
                          _buildListenpty(),
                          buildTableRow(context,
                              textLeftTable: '${title.textterm}',
                              textRightTableDetail: '${data.term}'),
                          _buildListenpty(),
                          buildTableRow(context,
                              textLeftTable: '${title.textstartdate}',
                              textRightTableDetail: '${data.startdate}'),
                          _buildListenpty(),
                          buildTableRow(context,
                              textLeftTable: '${title.textfinishdate}',
                              textRightTableDetail: '${data.finishdate}'),
                          _buildListenpty(),
                          buildTableRow(context,
                              textLeftTable: '${title.texttime}',
                              textRightTableDetail:
                              '${data.time}' " ( hh:mm ) "),
                          _buildListenpty(),
                          buildTableRow(context,
                              textLeftTable: '${title.edtapprover}',
                              textRightTableDetail: '${data.approver}'),
                          _buildListenpty(),
                          buildTableRow(context,
                              textLeftTable: '${title.textvenue}',
                              textRightTableDetail: '${data.venue}'),
                          _buildListenpty(),
                          buildTableRow(context,
                              textLeftTable: '${title.textdetail}',
                              textRightTableDetail: '${data.detail}')
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
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${data.status}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            showButton
                ? Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 100,
                        child: ButtonCustom(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return EditActivityPage(data: data);
                                }));
                          },
                          label: '${title.buttonleft}',
                          colortext: tcButtonTextBlack,
                          colorbutton: tcButtonTextWhite,
                          sizetext: sizeTextSmaller14,
                          colorborder: tcButtonTextBoarder,
                          sizeborder: 1.0,
                        )),
                    const SizedBox(
                      width: 50,
                    ),
                    SizedBox(
                        width: 100,
                        child: ButtonCustom(
                          colortext: tcButtonTextWhite,
                          colorbutton: tcButtonTextRed,
                          sizetext: sizeTextSmaller14,
                          colorborder: tcButtonTextRedBoarder,
                          sizeborder: 10,
                          label: '${title.buttonright}',
                          onPressed: () {
                            dialogOneLineTwoBtn(context, '$errlogout\n \n Please make sure you want to delete', 'Confirm', 'Cancel',
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
                                        if (kDebugMode) {
                                          print('id คือ ${data.id}');
                                        }

                                      }
                                  }
                                });
                          },
                        )),
                  ],
                ),
              ),
            )
                : const Text(''),
          ]),
        ),
      ),
    )
  );
}
