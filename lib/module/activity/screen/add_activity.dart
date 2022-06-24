import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/datepicker/custom_date_picker.dart';
import 'package:f2fbuu/customs/dropdown/custom_dropdown.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/module/activity/bloc/activity_bloc.dart';
import 'package:f2fbuu/module/activity/model/response/add_activity_screen_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../customs/size/size.dart';
import '../../../customs/textfile/buildtextfieldcustom.dart';
class addActivity extends StatefulWidget {
  const addActivity({Key? key}) : super(key: key);
  @override
  State<addActivity> createState() => _addActivityState();
}
class _addActivityState extends State<addActivity> with ProgressDialog{
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
              List<String>? approverlist = _addActivityScreenApi?.body?.approverlist;;

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
                        buildTextFieldCustom(
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
                          hint_label: "${_addActivityScreenApi?.body?.screeninfo?.edttime}",
                          textInputType: TextInputType.number,
                        ),
                        buildTextFieldCustom(
                          textEditingController: venue,
                          onChanged: (value) {
                            venuevalue = value;
                          },
                          hint_label: "${_addActivityScreenApi?.body?.screeninfo?.edttvenue}",
                          textInputType: TextInputType.text,
                        ),
                        customDropdown(width: MediaQuery.of(context).size.width, dropdownlist: approverlist, hint: 'Approver',),
                        buildTextFieldCustom(
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
