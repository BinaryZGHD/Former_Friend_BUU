import 'dart:convert';

import 'package:f2fbuu/model/homemodel/activitydetailscreenapi/activityDetailApi.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../customs/color/colorconts.dart';
import '../../../customs/size/size.dart';
import 'package:http/http.dart' as http;

class ActivityDetailScreen extends StatefulWidget {
  final title;
  final data;
  const ActivityDetailScreen({Key? key, required this.title, this.data}) : super(key: key);

  @override
  State<ActivityDetailScreen> createState() => _ActivityDetailScreenState();
}

class _ActivityDetailScreenState extends State<ActivityDetailScreen> {
  var id;
  var data;
  //---------------------------------API----------------------------------------//
  late ActivityDetailApi _dataFromAPI;

  @override
  void initState() {
    id = widget.title;
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
    return
      FutureBuilder(
        future: getActivityDetailApi(),
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      // print('${_dataFromAPI.body?.activity?.status}');
    if (snapshot.connectionState == ConnectionState.done) {
      print('${_dataFromAPI.body?.activity?.status}');
      var myicon = Icon(
        Icons.question_mark,
        color: Colors.black,
      );
      bool showbutton;
      if(_dataFromAPI.body?.activity?.status == "Unapproved!"){
        print('เข้า Unapproved!');
        myicon = Icon(
          Icons.alarm,
          color: Colors.yellow,
        );
        showbutton = true;
      }else if(_dataFromAPI.body?.activity?.status == "Approved!"){
        print('เข้า Approved!');
        myicon = Icon(
          Icons.check_circle,
          color: Colors.green,
        );
        showbutton = false;
      }else if(_dataFromAPI.body?.activity?.status == "Rejected!"){
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
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.1,
            ),
          ],
        ),
        body: Center(
          child: Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.8,
            width: MediaQuery
                .of(context)
                .size
                .width * 0.9,
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
                padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.65,
                  decoration: BoxDecoration(
                    color: HexColor('${_dataFromAPI.body?.activity?.color}'),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.65,
                          width: 90,
                          margin: EdgeInsets.only(
                              left: 10, top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Expanded(
                                  child: Text(
                                    '${_dataFromAPI.body?.screeninfo?.textactivity}',
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xFF333333)),
                                  )),
                              Expanded(
                                  child: Text(
                                    '${_dataFromAPI.body?.screeninfo?.textyear}',
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xFF333333)),
                                  )),
                              Expanded(
                                  child: Text(
                                    '${_dataFromAPI.body?.screeninfo?.textterm}',

                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xFF333333)),
                                  )),
                              Expanded(
                                  child: Text(
                                    '${_dataFromAPI.body?.screeninfo?.textstartdate}',
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xFF333333)),
                                  )),
                              Expanded(
                                  child: Text(
                                    '${_dataFromAPI.body?.screeninfo?.textfinishdate}',
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xFF333333)),
                                  )),
                              Expanded(
                                  child: Text(
                                    '${_dataFromAPI.body?.screeninfo?.texttime}',
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xFF333333)),
                                  )),
                              Expanded(
                                  child: Text(
                                    '${_dataFromAPI.body?.screeninfo?.edtapprover}',
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xFF333333)),
                                  )),
                              Expanded(
                                  child: Text(
                                    '${_dataFromAPI.body?.screeninfo?.textvenue}',
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xFF333333)),
                                  )),
                              Expanded(
                                  child: Text(
                                    '${_dataFromAPI.body?.screeninfo?.textdetail}',
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xFF333333)),
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          )),
                      // Container( height: 80, child: Image.asset("assets/images/Tom_Yum_Goong_C.jpg"),),
                      // CustomImage(data["image"],
                      //
                      //   radius: 15,
                      //   height: 80,
                      // ),
                      // SizedBox(width: 20,),
                      Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.65,
                          width: 5,
                          margin: EdgeInsets.only(
                              right: 10, top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Expanded(
                                  child: Text(
                                    ":",
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xFF333333)),
                                  )),
                              Expanded(
                                  child: Text(
                                    ":",
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xFF333333)),
                                  )),
                              Expanded(
                                  child: Text(
                                    ":",
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xFF333333)),
                                  )),
                              Expanded(
                                  child: Text(
                                    ":",
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xFF333333)),
                                  )),
                              Expanded(
                                  child: Text(
                                    ":",
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xFF333333)),
                                  )),
                              Expanded(
                                  child: Text(
                                    ":",
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xFF333333)),
                                  )),
                              Expanded(
                                  child: Text(
                                    ":",
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xFF333333)),
                                  )),
                              Expanded(
                                  child: Text(
                                    ":",
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xFF333333)),
                                  )),
                              Expanded(
                                  child: Text(
                                    ":",
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xFF333333)),
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          )),
                      Expanded(
                        child: Container(
                            color: transparent,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.65,
                            // width: MediaQuery.of(context).size.width - 170,
                            margin: EdgeInsets.only(
                                right: 5, top: 10, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                    child: Container(
                                        width: double.infinity,
                                        child: Text(
                                          '${_dataFromAPI.body?.activity?.name}',
                                          style: TextStyle(fontSize: 14,
                                              color: Color(0xFF333333)),
                                        ))),
                                Expanded(
                                    child: Container(
                                        width: double.infinity,
                                        child: Text(
                                          '${_dataFromAPI.body?.activity?.year}',
                                          maxLines: 1000,
                                          style: TextStyle(fontSize: 14,
                                              color: Color(0xFF333333)),
                                        ))),
                                Expanded(
                                    child: Container(
                                        width: double.infinity,
                                        child: Text(
                                          '${_dataFromAPI.body?.activity?.term}',
                                          style: TextStyle(fontSize: 14,
                                              color: Color(0xFF333333)),
                                        ))),
                                Expanded(
                                    child: Container(
                                        width: double.infinity,
                                        child: Text(
                                          '${_dataFromAPI.body?.activity?.startdate}',
                                          style: TextStyle(fontSize: 14,
                                              color: Color(0xFF333333)),
                                        ))),
                                Expanded(
                                    child: Container(
                                        width: double.infinity,
                                        child: Text(
                                          '${_dataFromAPI.body?.activity?.finishdate}',
                                          maxLines: 1000,
                                          style: TextStyle(fontSize: 14,
                                              color: Color(0xFF333333)),
                                        ))),
                                Expanded(
                                    child: Container(
                                        width: double.infinity,
                                        child: Text(
                                          '${_dataFromAPI.body?.activity?.time}' + " ( hh:mm ) ",
                                          style: TextStyle(fontSize: 14,
                                              color: Color(0xFF333333)),
                                        ))),
                                Expanded(
                                    child: Container(
                                        width: double.infinity,
                                        child: Text(
                                          '${_dataFromAPI.body?.activity?.approver}',
                                          style: TextStyle(fontSize: 14,
                                              color: Color(0xFF333333)),
                                        ))),
                                Expanded(
                                    child: Container(
                                        width: double.infinity,
                                        child: Text(
                                          '${_dataFromAPI.body?.activity?.venue}',
                                          maxLines: 10,
                                          style: TextStyle(fontSize: 14,
                                              color: Color(0xFF333333)),
                                        ))),
                                Expanded(
                                    child: Container(
                                        width: double.infinity,
                                        child: Text(
                                          '${_dataFromAPI.body?.activity?.detail}',
                                          style: TextStyle(fontSize: 14,
                                              color: Color(0xFF333333)),
                                        ))),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            )),
                      ),
                    ],
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
                      Text(
                        '${_dataFromAPI.body?.activity?.status}'),
                    ],
                  ),
                ),
              ),
            ]
            ),
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
        }
      );
  }
}
////////////////////////////////////////////////////////////////////////////////

