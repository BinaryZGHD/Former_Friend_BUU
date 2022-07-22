import 'package:f2fbuu/customs/button/buttoncustom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/datepicker/custom_date_picker.dart';
import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/dropdown/custom_dropdown.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/customs/textfile/build_textformfiled_unlimit_custom.dart';
import 'package:f2fbuu/customs/textfile/textfield_custom.dart';
import 'package:f2fbuu/module/activity/bloc/activity_bloc.dart';
import 'package:f2fbuu/module/activity/model/response/add_activity_screen_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AddActivityScreen extends StatelessWidget {
  const AddActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ActivityBloc()..add(AddEditActivityScreenInfoEvent()),
      child: const AddActivityPage(),
    );
  }
}

class AddActivityPage extends StatefulWidget {
  const AddActivityPage({Key? key}) : super(key: key);

  @override
  State<AddActivityPage> createState() => _AddActivityPageState();
}

class _AddActivityPageState extends State<AddActivityPage> with ProgressDialog {
  TextEditingController activityName = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController term = TextEditingController();
  TextEditingController sDate = TextEditingController();
  TextEditingController fDate = TextEditingController();
  TextEditingController totalTime = TextEditingController();
  TextEditingController venue = TextEditingController();
  TextEditingController approver = TextEditingController();
  TextEditingController detail = TextEditingController();
  AddActivityScreenApi? _addActivityScreenApi;

  @override
  Widget build(BuildContext context) {
    // context.read<ActivityBloc>().add(AddActivityScreenInfoEvent());

    return BlocConsumer<ActivityBloc, ActivityState>(
      listener: (context, state) {
        if (state is ActivityLoading) {
          showProgressDialog(context);
        }
        if (state is ActivityEndLoading) {
          hideProgressDialog(context);
        }
        if (state is ActivityError) {
          dialogOneLineOneBtn(context, '${state.message}\n ', "OK",
              onClickBtn: () {
            Navigator.of(context).pop();
          });
          if (kDebugMode) {
            print(state.message);
          }
        }
        if (state is SubmitAddEditActivityState) {
          // print("TEST SubmitAddEditActivityState");
          // print(state.responseAddEdit.toJson());
          // print("TEST SubmitAddEditActivityState");
          // context.read<ActivityBloc>().add(ActivityEvent());
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is ActivityScreenInfoSuccessState) {
          _addActivityScreenApi = state.response;

          return buildAddActivityBody(
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
          );
        } else {
          return Container();
        }
      },
      buildWhen: (context, state) {
        return state is ActivityScreenInfoSuccessState;
      },
    );
  }
}

buildAddActivityBody(
  BuildContext context,
  AddActivityScreenApi? addActivityScreenApi,
  TextEditingController activityName,
  TextEditingController year,
  TextEditingController term,
  TextEditingController sDate,
  TextEditingController fDate,
  TextEditingController totalTime,
  TextEditingController venue,
  TextEditingController approver,
  TextEditingController detail,
) {
  // print(addActivityScreenApi?.head?.status);
  // print(addActivityScreenApi?.body?.screeninfo?.titleaddact);
  List<String>? yearList = addActivityScreenApi?.body?.yearlist;
  List<String>? termList = addActivityScreenApi?.body?.termlist;
  List<String>? approverList = addActivityScreenApi?.body?.approverlist;
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          size: sizeTitle24,
          color: Colors.black,
        ),
      ),
      title: Text(
        "${addActivityScreenApi?.body?.screeninfo?.titleaddact}",
        style: const TextStyle(
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
            TextFieldCustom(
              textEditingController: activityName,
              onChanged: (value) {
                activityName.text = value;
                if (kDebugMode) {
                  print(activityName.text);
                }
              },
              hintLabel:
                  "${addActivityScreenApi?.body?.screeninfo?.edtactname}",
              textInputType: TextInputType.text,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customDropdown(
                  dropdownList: yearList ?? <String>[],
                  hint: 'Year',
                  width: MediaQuery.of(context).size.width * 0.4,
                  callbackFromCustomDropdown: (String result) {
                    year.text = result;
                    if (kDebugMode) {
                      print(year.text);
                    }
                  },
                ),
                customDropdown(
                  dropdownList: termList ?? <String>[],
                  hint: 'Term',
                  width: MediaQuery.of(context).size.width * 0.4,
                  callbackFromCustomDropdown: (String result) {
                    term.text = result;
                    if (kDebugMode) {
                      print(term.text);
                    }
                  },
                ),
              ],
            ),
            CustomDatePicker(
              hintLabel: 'Start date',
              callbackFromCustomDatePicker: (String result) {
                sDate.text = result;
                if (kDebugMode) {
                  print(sDate.text);
                }
              },
            ),
            CustomDatePicker(
              hintLabel: 'Finish date',
              callbackFromCustomDatePicker: (String result) {
                fDate.text = result;
                if (kDebugMode) {
                  print(fDate.text);
                }
              },
            ),
            TextFieldCustom(
              textEditingController: totalTime,
              onChanged: (value) {
                totalTime.text = value;
                if (kDebugMode) {
                  print("time ====${totalTime.text}");
                }
              },
              hintLabel: "${addActivityScreenApi?.body?.screeninfo?.edttime}",
              textInputType: TextInputType.number,
            ),
            TextFieldCustom(
              textEditingController: venue,
              onChanged: (value) {
                venue.text = value;
                if (kDebugMode) {
                  print(venue.text);
                }
              },
              hintLabel:
                  "${addActivityScreenApi?.body?.screeninfo?.edttvenue}",
              textInputType: TextInputType.text,
            ),
            customDropdown(
              width: MediaQuery.of(context).size.width,
              dropdownList: approverList ?? <String>[],
              hint: 'Approver',
              callbackFromCustomDropdown: (String result) {
                approver.text = result;
                if (kDebugMode) {
                  print(approver.text);
                }
              },
            ),
            BuildTextformfieldUnlimitCustom(
              textEditingController: detail,
              onChanged: (value) {
                detail.text = value;
                if (kDebugMode) {
                  print(detail.text);
                }
              },
              hintLabel:
                  "${addActivityScreenApi?.body?.screeninfo?.edtdetail}",
              textInputType: TextInputType.text,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Center(
              child: ButtonCustom(
                label: "  ${addActivityScreenApi?.body?.screeninfo?.btnconfirm}  ",
                colortext: tcButtonTextBlack,
                colorbutton: tcButtonTextWhite,
                sizetext: sizeTextBig20,
                colorborder: tcButtonTextBoarder,
                sizeborder: 10,
                onPressed: () {
                  if (year.text.isNotEmpty &&
                      totalTime.text.isNotEmpty &&
                      approver.text.isNotEmpty &&
                      // fDate.text.isNotEmpty &&
                      venue.text.isNotEmpty &&
                      detail.text.isNotEmpty &&
                      // sDate.text.isNotEmpty &&
                      activityName.text.isNotEmpty &&
                      term.text.isNotEmpty) {
                    context.read<ActivityBloc>().add(SubmitAddEditActivityEvent(
                        id: "",
                        year: year.text,
                        totalTime: totalTime.text,
                        approver: approver.text,
                        fDate: fDate.text,
                        venue: venue.text,
                        detail: detail.text,
                        sDate: sDate.text,
                        activityName: activityName.text,
                        term: term.text));
                  } else {
                    dialogOneLineOneBtn(
                        context, 'Please fill in all information', "OK",
                        onClickBtn: () {
                      Navigator.of(context).pop();
                    });
                  }
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
