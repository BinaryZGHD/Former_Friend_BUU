import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/datepicker/custom_date_picker_for_edit.dart';
import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/dropdown/custom_dropdown_for_edit.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/textfile/build_textformfiled_unlimit_custom.dart';
import 'package:f2fbuu/module/activity/bloc/activity_bloc.dart';
import 'package:f2fbuu/module/activity/model/response/add_activity_screen_api.dart';
import 'package:f2fbuu/module/home/screen/homescreen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  TextEditingController activityName = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController term = TextEditingController();
  TextEditingController sDate = TextEditingController();
  TextEditingController fDate = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController venue = TextEditingController();
  TextEditingController approver = TextEditingController();
  TextEditingController detail = TextEditingController();
  String activityNameValue = " ";
  String yearValue = " ";
  String termValue = " ";
  String sDateValue = " ";
  String fDateValue = "";
  String timeValue = "";
  String venueValue = "";
  String approverValue = "";
  String detailValue = "";
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
              List<String>? yearList = _addActivityScreenApi?.body?.yearlist;
              List<String>? termList = _addActivityScreenApi?.body?.termlist;
              List<String>? approverList = _addActivityScreenApi?.body?.approverlist;
              String nameValue = "${widget.data.name}";
              String yearValue = "${widget.data.year}";
              String termValue = "${widget.data.term}";
              String sDateValue = "${widget.data.startdate}";
              String fDateValue = "${widget.data.finishdate}";
              String timeValue = "${widget.data.time}";
              String venueValue = "${widget.data.venue}";
              String approverValue = "${widget.data.approver}";
              String detailValue = "${widget.data.detail}";

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
                        BuildTextformfieldUnlimitCustom(
                          initialvalue: nameValue,
                          textEditingController: activityName,
                          onChanged: (value) {
                            activityNameValue = value;
                          },
                          hintLabel: "${_addActivityScreenApi?.body?.screeninfo?.edtactname}",
                          textInputType: TextInputType.text,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              customDropdownForEdit(dropdownList: yearList??<String>[], hint: 'Year',width: MediaQuery.of(context).size.width*0.4,
                                  dropdownValue: yearValue
                              ),
                              customDropdownForEdit(dropdownList: termList??<String>[], hint: 'Term',width: MediaQuery.of(context).size.width*0.4,dropdownValue: termValue),
                            ],
                          ),
                        ),
                        customDatePickerForEdit(hintLabel: 'Start date',dateValue: sDateValue,),
                        customDatePickerForEdit(hintLabel: 'Finish date',dateValue: fDateValue,),
                        BuildTextFieldCustom(
                          initialvalue: timeValue,
                          textEditingController: time,
                          onChanged: (value) {
                            timeValue = value;
                          },
                          hintLabel: "${_addActivityScreenApi?.body?.screeninfo?.edttime}",
                          textInputType: TextInputType.number,
                        ),
                        BuildTextformfieldUnlimitCustom(
                          initialvalue: venueValue,
                          textEditingController: venue,
                          onChanged: (value) {
                            venueValue = value;
                          },
                          hintLabel: "${_addActivityScreenApi?.body?.screeninfo?.edttvenue}",
                          textInputType: TextInputType.text,
                        ),
                        customDropdownForEdit(width: MediaQuery.of(context).size.width, dropdownList: approverList??<String>[], hint: 'Approver',dropdownValue: approverValue),
                        BuildTextformfieldUnlimitCustom(
                          initialvalue: detailValue,
                          textEditingController: detail,
                          onChanged: (value) {
                            detailValue = value;
                          },
                          hintLabel: "${_addActivityScreenApi?.body?.screeninfo?.edtdetail}",
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Center(child: ButtonCustom(
                          label: "  "+"${_addActivityScreenApi?.body?.screeninfo?.btnconfirm}"+"  ",
                          colortext: tcButtonTextBlack,
                          colorbutton: tcButtonTextWhite,
                          sizetext: sizeTextBig20,
                          colorborder: tcButtonTextBoarder,
                          sizeborder: 10,
                          onPressed: () {
                            dialogOneLineOneBtn(
                                context,  'Do you want to continue?',
                                "OK", onClickBtn: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  // int index = int.parse(widget.id);
                                  return HomeScreen();
                                }),
                              );
                            });
                          },
                        ),),
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
