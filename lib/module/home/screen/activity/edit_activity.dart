
import 'dart:convert';

import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/datepicker/custom_date_picker.dart';
import 'package:f2fbuu/customs/dropdown/custom_dropdown.dart';
import 'package:http/http.dart' as http;
import 'package:f2fbuu/module/home/model/activity/add_activity_screen_api.dart';
import 'package:flutter/material.dart';

import '../../../../customs/size/size.dart';
import '../../../../customs/textfile/buildtextfieldcustom.dart';

class editActivity extends StatefulWidget {
  final data;
  const editActivity({Key? key, required this.data}) : super(key: key);

  @override
  State<editActivity> createState() => _editActivityState();
}

class _editActivityState extends State<editActivity> {
  TextEditingController activityname = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController term = TextEditingController();
  TextEditingController sdate = TextEditingController();
  TextEditingController fdate = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController venue = TextEditingController();
  TextEditingController approver = TextEditingController();
  TextEditingController detail = TextEditingController();

  String activitynamevalue = " ";
  String yearvalue = " ";
  String termvalue = " ";
  String sdatevalue = " ";
  String fdatevalue = "";
  String timevalue = "";
  String venuevalue = "";
  String approvervalue = "";
  String detailvalue = "";
  late AddActivityScreenApi _dataFromAPI;

  @override
  void initState() {
    // data = widget.data;
    super.initState();
    getAPIScreenAddActivity();
  }

  Future<AddActivityScreenApi?> getAPIScreenAddActivity() async {
    // print("เรียกใช้ Get_Coin_price");
    var url = Uri.parse("https://test-api-ceecf.web.app/v1/home/addactivity");
    var response = await http.get(url, headers: <String, String>{});

    _dataFromAPI = addActivityScreenApiFromJson(utf8.decode(response.bodyBytes));
    // print(response.body);
    // // print(_dataFromAPI?.head?.message);// get the data from the api
    // print(_dataFromAPIRegisterWording?.body?.screeninfo?.textreghead);// get the data from the api
    return _dataFromAPI;
    // log(response.body);
  }

  @override
  Widget build(BuildContext context) {
    List<String> yearlist = ['2022','2021','2020'];
    List<String> termlist = ['1','2','summer'];
    List<String> teacherlist = ['a','b','c','d','e','f'];
    String activitynamevalue = "${widget.data.name}";
    String yearvalue = "${widget.data.year}";
    String termvalue = "${widget.data.term}";
    String sdatevalue = "${widget.data.startdate}";
    String fdatevalue = "${widget.data.finishdate}";
    String timevalue = "${widget.data.time}";
    String venuevalue = "${widget.data.venue}";
    String approvervalue = "${widget.data.approver}";
    String detailvalue = "${widget.data.detail}";
    return FutureBuilder(
      future: getAPIScreenAddActivity(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: sizeTitle24,
                  color: Colors.black,
                ),
              ),
              title: Text(
                "${_dataFromAPI.body?.screeninfo?.titleeditact}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: sizeTitle24,
                ),
              ),
            ),
            body: SafeArea(
              // height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    buildTextFieldCustom(
                      textEditingController: activityname,
                      onChanged: (value) {
                        activitynamevalue = value;
                      },
                      hint_label: "${_dataFromAPI.body?.screeninfo?.edtactname}",
                      textInputType: TextInputType.text,
                    ),
                    Container(
                      // child: Row(
                      //   children: [
                      //   Card(child: Text('data')),
                      //     customDropdown(dropdownlist: yearlist, hint: 'Year',),
                      //     Card(child: Text('data')),
                      // ],)
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customDropdown(dropdownlist: yearlist, hint: 'Year',width: MediaQuery.of(context).size.width*0.4),
                          customDropdown(dropdownlist: termlist, hint: 'Term',width: MediaQuery.of(context).size.width*0.4),
                        ],
                      ),
                    ),
                    customDatePicker(hint_label: 'Start date',),
                    customDatePicker(hint_label: 'Finish date'),
                    buildTextFieldCustom(
                      textEditingController: time,
                      onChanged: (value) {
                        timevalue = value;
                      },
                      hint_label: "${_dataFromAPI.body?.screeninfo?.edttime}",
                      textInputType: TextInputType.number,
                    ),
                    buildTextFieldCustom(
                      textEditingController: venue,
                      onChanged: (value) {
                        venuevalue = value;
                      },
                      hint_label: "${_dataFromAPI.body?.screeninfo?.edttvenue}",
                      textInputType: TextInputType.text,
                    ),
                    customDropdown(width: MediaQuery.of(context).size.width, dropdownlist: teacherlist, hint: 'approver',),
                    buildTextFieldCustom(
                      textEditingController: detail,
                      onChanged: (value) {
                        detailvalue = value;
                      },
                      hint_label: "${_dataFromAPI.body?.screeninfo?.edtdetail}",
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    // Center(
                    //   child: ButtonCustom(
                    //     label: "  "+"${_dataFromAPIRegisterWording?.body?.screeninfo?.btnsignup}"+"  ",
                    //     colortext: TC_Black,
                    //     colorbutton: BC_ButtonGreen,
                    //     sizetext: sizeTextBig20,
                    //     colorborder: BSC_transparent,
                    //     onPressed: () {
                    //       showDialog(
                    //           context: context,
                    //           builder: (context) => CustomDialogBox(
                    //             id: '',
                    //             textfieldvalue: "Register  :  $uservalue" +
                    //                 "\nTelrphone number  :  $phonevalue" +
                    //                 "\nEmail  :  $emailvalue" +
                    //                 "\nName  :  $namevalue" +
                    //                 "\nLast name  :  $lastnamevalue" +
                    //                 "\nPassword  :  $passwordvalue" +
                    //                 "\nConfirm password  :  $confirmpasswordvalue",
                    //             description: errregidter1 + '\n \n ' + 'Do you want to continue?',
                    //             mapscreen: registerConfirmScreen(
                    //                 titleconregis: "${_dataFromAPIRegisterWording?.body?.screeninfo?.titleconregis}" ,
                    //                 textotpwillsent: "${_dataFromAPIRegisterWording?.body?.screeninfo?.textotpwillsent}" ,
                    //                 textpleaseconfirm: "${_dataFromAPIRegisterWording?.body?.screeninfo?.textpleaseconfirm}" ,
                    //                 textsentotpagain:"${_dataFromAPIRegisterWording?.body?.screeninfo?.textsentotpagain}"  ,
                    //                 textotp: "${_dataFromAPIRegisterWording?.body?.screeninfo?.textotp}" ,
                    //                 btnconfirm: "${_dataFromAPIRegisterWording?.body?.screeninfo?.btnconfirm}" ,
                    //                 edtemailreg:"${_dataFromAPIRegisterWording?.body?.screeninfo?.edtemailreg}"
                    //             ),
                    //           ));
                    //     },
                    //   ),
                    // ),
                    Center(child: ButtonCustom(
                      label: "  "+"${_dataFromAPI.body?.screeninfo?.btnconfirm}"+"  ",
                      colortext: TC_Black,
                      colorbutton: Colors.white,
                      sizetext: sizeTextBig20,
                      colorborder: Colors.black,),),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
