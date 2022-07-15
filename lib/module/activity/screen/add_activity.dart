import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/datepicker/custom_date_picker.dart';
import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/dropdown/custom_dropdown.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/textfile/build_textformfiled_unlimit_custom.dart';
import 'package:f2fbuu/module/activity/bloc/activity_bloc.dart';
import 'package:f2fbuu/module/activity/model/response/add_activity_screen_api.dart';
import 'package:f2fbuu/module/home/screen/homescreen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../customs/size/size.dart';
import '../../../customs/textfile/buildtextfieldcustom.dart';

class addActivity extends StatefulWidget {
  const addActivity({Key? key}) : super(key: key);
  @override
  State<addActivity> createState() => _addActivityState();
}

class _addActivityState extends State<addActivity> with ProgressDialog {
  TextEditingController activityName = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController term = TextEditingController();
  TextEditingController sDate = TextEditingController();
  TextEditingController fDate = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController venue = TextEditingController();
  TextEditingController approver = TextEditingController();
  TextEditingController detail = TextEditingController();
  String activityNameValue = "";
  String yearValue = "";
  String termValue = "";
  String sDateValue = "";
  String fDateValue = "";
  String timeValue = "";
  String venueValue = "";
  String approverValue = "";
  String detailValue = "";
  AddActivityScreenApi? _addActivityScreenApi;

  @override
  Widget build(BuildContext context) {
    context.read<ActivityBloc>().add(AddActivityScreenInfoEvent());

    return BlocListener<ActivityBloc, ActivityState>(
      listener: (context, state) {
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
      child:
          BlocBuilder<ActivityBloc, ActivityState>(builder: (context, state) {
        if (state is ActivityScreenInfoSuccessState) {
          _addActivityScreenApi = state.response;
          print(_addActivityScreenApi?.head?.status);
          print(_addActivityScreenApi?.body?.screeninfo?.titleaddact);
          List<String>? yearList = _addActivityScreenApi?.body?.yearlist;
          List<String>? termList = _addActivityScreenApi?.body?.termlist;
          List<String>? approverList = _addActivityScreenApi?.body?.approverlist;
          ;

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
                "${_addActivityScreenApi?.body?.screeninfo?.titleaddact}",
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
                    BuildTextFieldCustom(
                      textEditingController: activityName,
                      onChanged: (value) {
                        activityNameValue = value;
                      },
                      hintLabel:
                          "${_addActivityScreenApi?.body?.screeninfo?.edtactname}",
                      textInputType: TextInputType.text,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customDropdown(
                            dropdownList: yearList??<String>[],
                            hint: 'Year',
                            width: MediaQuery.of(context).size.width * 0.4,
                            callbackFromCustomDropdown: (String result) {
                              setState(() {
                                yearValue = result;
                                print(yearValue);
                              });
                            },
                          ),
                          customDropdown(
                            dropdownList: termList??<String>[],
                            hint: 'Term',
                            width: MediaQuery.of(context).size.width * 0.4,
                            callbackFromCustomDropdown: (String result) {
                              setState(() {
                                termValue = result;
                                print(termValue);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    customDatePicker(
                      hintLabel: 'Start date',
                    ),
                    customDatePicker(hintLabel: 'Finish date'),
                    BuildTextFieldCustom(
                      textEditingController: time,
                      onChanged: (value) {
                        time.text = value;
                        print("time ====" + time.text);
                      },
                      hintLabel:
                          "${_addActivityScreenApi?.body?.screeninfo?.edttime}",
                      textInputType: TextInputType.number,
                    ),
                    BuildTextFieldCustom(
                      textEditingController: venue,
                      onChanged: (value) {
                        venue.text = value;
                      },
                      hintLabel:
                          "${_addActivityScreenApi?.body?.screeninfo?.edttvenue}",
                      textInputType: TextInputType.text,
                    ),
                    customDropdown(
                      width: MediaQuery.of(context).size.width,
                      dropdownList: approverList??<String>[],
                      hint: 'Approver',
                      callbackFromCustomDropdown: (String result) {
                        setState(() {
                          approverValue = result;
                          print(approverValue);
                        });
                      },
                    ),
                    BuildTextformfieldUnlimitCustom(
                      textEditingController: detail,
                      onChanged: (value) {
                        detail.text = value;
                      },
                      hintLabel:
                          "${_addActivityScreenApi?.body?.screeninfo?.edtdetail}",
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Center(
                      child: ButtonCustom(
                        label: "  " +
                            "${_addActivityScreenApi?.body?.screeninfo?.btnconfirm}" +
                            "  ",
                        colortext: tcButtonTextBlack,
                        colorbutton: tcButtonTextWhite,
                        sizetext: sizeTextBig20,
                        colorborder: tcButtonTextBoarder,
                        sizeborder: 10,
                        onPressed: () {
                          dialogOneLineOneBtn(
                              context, 'Do you want to continue?', "OK",
                              onClickBtn: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                // int index = int.parse(widget.id);
                                return HomeScreen();
                              }),
                            );
                          });
                        },
                      ),
                    ),
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
