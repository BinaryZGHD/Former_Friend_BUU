import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/datepicker/custom_date_picker_for_edit.dart';
import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/dropdown/custom_dropdown_for_edit.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/textfile/build_textformfiled_unlimit_custom.dart';
import 'package:f2fbuu/module/activity/bloc/activity_bloc.dart';
import 'package:f2fbuu/module/activity/model/response/add_activity_screen_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../customs/size/size.dart';
import '../../../customs/textfile/buildtextfieldcustom.dart';

class EditActivityScreen extends StatelessWidget {
  final data;
  const EditActivityScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ActivityBloc()..add(AddEditActivityScreenInfoEvent()),
      child: EditActivityPage(
        data: data,
      ),
    );
  }
}

class EditActivityPage extends StatefulWidget {
  final data;
  const EditActivityPage({Key? key, required this.data}) : super(key: key);

  @override
  State<EditActivityPage> createState() => _EditActivityPageState();
}

class _EditActivityPageState extends State<EditActivityPage>
    with ProgressDialog {
  TextEditingController activityName = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController term = TextEditingController();
  TextEditingController sDate = TextEditingController();
  TextEditingController fDate = TextEditingController();
  TextEditingController totalTime = TextEditingController();
  TextEditingController venue = TextEditingController();
  TextEditingController approver = TextEditingController();
  TextEditingController detail = TextEditingController();
  // String activityNameValue = " ";
  // String yearValue = " ";
  // String termValue = " ";
  // String sDateValue = " ";
  // String fDateValue = "";
  // String timeValue = "";
  // String venueValue = "";
  // String approverValue = "";
  // String detailValue = "";
  AddActivityScreenApi? _addActivityScreenApi;

  @override
  Widget build(BuildContext context) {
    context.read<ActivityBloc>().add(AddEditActivityScreenInfoEvent());

    return BlocConsumer<ActivityBloc, ActivityState>(
        listener: (context, state) {
      if (state is ActivityLoading) {
        showProgressDialog(context);
      }
      if (state is ActivityLoading) {
        hideProgressDialog(context);
      }
      if (state is ActivityError) {
        dialogOneLineOneBtn(context, '${state.message}\n ', "OK",
            onClickBtn: () {
          Navigator.of(context).pop();
        });
        print(state.message);
      }
      if (state is SubmitAddEditActivityState) {
        print("TEST SubmitAddEditActivityState");
        print(state.responseAddEdit.toJson());
        print("TEST SubmitAddEditActivityState");
        // context.read<ActivityBloc>().add(ActivityEvent());
        Navigator.pop(context);
      }
    }, builder: (context, state) {
      if (state is ActivityScreenInfoSuccessState) {
        _addActivityScreenApi = state.response;
        print(_addActivityScreenApi?.head?.status);
        print(_addActivityScreenApi?.body?.screeninfo?.titleeditact);
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

        return BuildEditActivityBody(
            context,
            _addActivityScreenApi,
            activityName,
            year,
            term,
            sDate,
            fDate,
            totalTime,
            venue,
            approver,
            detail,
            nameValue,
            yearValue,
            termValue,
            sDateValue,
            fDateValue,
            timeValue,
            venueValue,
            approverValue,
            detailValue,
            yearList,
            termList,
            approverList);
      } else {
        return Container();
      }
    });
  }
}

BuildEditActivityBody(
  BuildContext context,
  AddActivityScreenApi? _addActivityScreenApi,
  TextEditingController activityName,
  TextEditingController year,
  TextEditingController term,
  TextEditingController sDate,
  TextEditingController fDate,
  TextEditingController totalTime,
  TextEditingController venue,
  TextEditingController approver,
  TextEditingController detail,
  String nameValue,
  String yearValue,
  String termValue,
  String sDateValue,
  String fDateValue,
  String timeValue,
  String venueValue,
  String approverValue,
  String detailValue, List<String>? yearList, List<String>? termList, List<String>? approverList,
) {
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
                activityName.text = value;
                print(activityName.text);
              },
              hintLabel:
                  "${_addActivityScreenApi?.body?.screeninfo?.edtactname}",
              textInputType: TextInputType.text,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customDropdownForEdit(
                      dropdownList: yearList ?? <String>[],
                      hint: 'Year',
                      width: MediaQuery.of(context).size.width * 0.4,
                      dropdownValue: yearValue),
                  customDropdownForEdit(
                      dropdownList: termList ?? <String>[],
                      hint: 'Term',
                      width: MediaQuery.of(context).size.width * 0.4,
                      dropdownValue: termValue),
                ],
              ),
            ),
            customDatePickerForEdit(
              hintLabel: 'Start date',
              dateValue: sDateValue,
            ),
            customDatePickerForEdit(
              hintLabel: 'Finish date',
              dateValue: fDateValue,
            ),
            BuildTextFieldCustom(
              initialvalue: timeValue,
              textEditingController: totalTime,
              onChanged: (value) {
                totalTime.text = value;
                if (kDebugMode) {
                  print("time ====" + totalTime.text);
                }
              },
              hintLabel: "${_addActivityScreenApi?.body?.screeninfo?.edttime}",
              textInputType: TextInputType.number,
            ),
            BuildTextformfieldUnlimitCustom(
              initialvalue: venueValue,
              textEditingController: venue,
              onChanged: (value) {
                venue.text = value;
                if (kDebugMode) {
                  print(venue.text);
                }
              },
              hintLabel:
                  "${_addActivityScreenApi?.body?.screeninfo?.edttvenue}",
              textInputType: TextInputType.text,
            ),
            customDropdownForEdit(
                width: MediaQuery.of(context).size.width,
                dropdownList: approverList ?? <String>[],
                hint: 'Approver',
                dropdownValue: approverValue),
            BuildTextformfieldUnlimitCustom(
              initialvalue: detailValue,
              textEditingController: detail,
              onChanged: (value) {
                detail.text = value;
                if (kDebugMode) {
                  print(detail.text);
                }
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
                  context.read<ActivityBloc>().add(SubmitAddEditActivityEvent(
                      id: '',
                      year: year.text,
                      totalTime: totalTime.text,
                      approver: approver.text,
                      fDate: fDate.text,
                      venue: venue.text,
                      detail: detail.text,
                      sDate: sDate.text,
                      activityName: activityName.text,
                      term: term.text));
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
}
