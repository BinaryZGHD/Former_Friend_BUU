
import 'dart:convert';

import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/datepicker/custom_date_picker.dart';
import 'package:f2fbuu/customs/datepicker/custom_date_picker_for_edit.dart';
import 'package:f2fbuu/customs/dropdown/custom_dropdown.dart';
import 'package:f2fbuu/customs/dropdown/custom_dropdown_for_edit.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/textfile/build_textformfiled_unlimit_custom.dart';
import 'package:f2fbuu/module/activity/bloc/activity_bloc.dart';
import 'package:f2fbuu/module/activity/model/response/add_activity_screen_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../../customs/size/size.dart';
import '../../../customs/textfile/buildtextfieldcustom.dart';

class editActivity extends StatefulWidget {
  final data;
  const editActivity({Key? key, required this.data}) : super(key: key);

  @override
  State<editActivity> createState() => _editActivityState();
}

class _editActivityState extends State<editActivity> with ProgressDialog{
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
  AddActivityScreenApi? _addActivityScreenApi;

  @override
  Widget build(BuildContext context) {
    context.read<ActivityBloc>().add(AddActivityScreenInfoEvent());

    return BlocListener<ActivityBloc,ActivityState>(
      listener: (context,state){
        if (state is ActivityLoading) {
          showProgressDialog(context);
        }
        if (state is ActivityLoading) {
          hideProgressDialog(context);
        }
        if (state is ActivityError) {
          // show dialog error
          print(state.message);
        }
      },
      child: BlocBuilder<ActivityBloc,ActivityState>(
          builder: (context,state){
            if (state is ActivityScreenInfoSuccessState){
              _addActivityScreenApi = state.response;
              print(_addActivityScreenApi?.head?.status);
              print(_addActivityScreenApi?.body?.screeninfo?.titleaddact);
              List<String>? yearlist = _addActivityScreenApi?.body?.yearlist;
              List<String>? termlist = _addActivityScreenApi?.body?.termlist;
              List<String>? approverlist = _addActivityScreenApi?.body?.approverlist;
              String namevalue = "${widget.data.name}";
              String yearvalue = "${widget.data.year}";
              String termvalue = "${widget.data.term}";
              String sdatevalue = "${widget.data.startdate}";
              String fdatevalue = "${widget.data.finishdate}";
              String timevalue = "${widget.data.time}";
              String venuevalue = "${widget.data.venue}";
              String approvervalue = "${widget.data.approver}";
              String detailvalue = "${widget.data.detail}";

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
                    "${_addActivityScreenApi?.body?.screeninfo?.titleeditact}",
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
                        buildTextformfieldUnlimitCustom(
                          initialvalue: namevalue,
                          textEditingController: activityname,
                          onChanged: (value) {
                            activitynamevalue = value;
                          },
                          hint_label: "${_addActivityScreenApi?.body?.screeninfo?.edtactname}",
                          textInputType: TextInputType.text,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              customDropdownForEdit(dropdownlist: yearlist, hint: 'Year',width: MediaQuery.of(context).size.width*0.4,
                                  dropdownvalue: yearvalue
                              ),
                              customDropdownForEdit(dropdownlist: termlist, hint: 'Term',width: MediaQuery.of(context).size.width*0.4,dropdownvalue: termvalue),
                            ],
                          ),
                        ),
                        customDatePickerForEdit(hint_label: 'Start date',datevalue: sdatevalue,),
                        customDatePickerForEdit(hint_label: 'Finish date',datevalue: fdatevalue,),
                        buildTextFieldCustom(
                          initialvalue: timevalue,
                          textEditingController: time,
                          onChanged: (value) {
                            timevalue = value;
                          },
                          hint_label: "${_addActivityScreenApi?.body?.screeninfo?.edttime}",
                          textInputType: TextInputType.number,
                        ),
                        buildTextformfieldUnlimitCustom(
                          initialvalue: venuevalue,
                          textEditingController: venue,
                          onChanged: (value) {
                            venuevalue = value;
                          },
                          hint_label: "${_addActivityScreenApi?.body?.screeninfo?.edttvenue}",
                          textInputType: TextInputType.text,
                        ),
                        customDropdownForEdit(width: MediaQuery.of(context).size.width, dropdownlist: approverlist, hint: 'Approver',dropdownvalue: approvervalue),
                        buildTextformfieldUnlimitCustom(
                          initialvalue: detailvalue,
                          textEditingController: detail,
                          onChanged: (value) {
                            detailvalue = value;
                          },
                          hint_label: "${_addActivityScreenApi?.body?.screeninfo?.edtdetail}",
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Center(child: ButtonCustom(
                          label: "  "+"${_addActivityScreenApi?.body?.screeninfo?.btnconfirm}"+"  ",
                          colortext: TC_Black,
                          colorbutton: Colors.white,
                          sizetext: sizeTextBig20,
                          colorborder: Colors.black,
                          sizeborder: 1,),),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
