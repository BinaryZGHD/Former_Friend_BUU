
import 'package:f2fbuu/module/profile/components/careerdatatab.dart';
import 'package:f2fbuu/module/profile/components/hiddencareerdatatab.dart';
import 'package:f2fbuu/module/profile/model/response/api_profile.dart';
import 'package:flutter/material.dart';

class ProfileCareerDropdownTab extends StatefulWidget {
  final List<Status> statusArray;
  final String textLeft;
  final String userStatusValue;
  final String jobTextLeft;
  final String userJobValue;
  final List<Jobtype> jobTypeArray;
  final bool isUnpressed;
  final String subtitleWorkplace;
  final String userWorkplace;
  final String userCareer;
  final String userCompany;
  final String textCareer;
  final String textComp;
  final Function(String jobtype, String workplace, String career, String company) callbackFromWorkDataTab;
  final Function(String status) callbackFromWorkDataTabStatus;
  const ProfileCareerDropdownTab(
      {Key? key,
        required this.textLeft,
        required this.userStatusValue,
        required this.jobTextLeft,
        required this.jobTypeArray,
        required this.userJobValue,
        required this.isUnpressed,
        required this.subtitleWorkplace,
        required this.userWorkplace,
        required this.userCareer,
        required this.userCompany,
        required this.textCareer,
        required this.textComp,
        required this.statusArray,
        required this.callbackFromWorkDataTab,
        required this.callbackFromWorkDataTabStatus})
      : super(key: key);

  @override
  State<ProfileCareerDropdownTab> createState() =>
      _ProfileCareerDropdownTabState();
}

class _ProfileCareerDropdownTabState extends State<ProfileCareerDropdownTab> {
  late String textleft;
  late String? itemvalue;
  bool isJobInStatusVisible = false;


  @override
  void initState() {
    textleft = widget.textLeft;
    itemvalue = widget.userStatusValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isunpressed = widget.isUnpressed;
    String subtitleworkplace = widget.subtitleWorkplace;
    String userworkplace = widget.userWorkplace;
    String usercareer = widget.userCareer;
    String usercompany = widget.userCompany;
    String textcareer = widget.textCareer;
    String textcomp = widget.textComp;


    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(width: 1, color: Colors.black12),
                bottom: BorderSide(width: 1, color: Colors.black12)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    textleft,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: IgnorePointer(
                      ignoring: isunpressed,
                      child:
                      PopupMenuButton<String>(
                        // initialValue:
                        // itemvalue,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Text(
                                    itemvalue??'',
                                    style: const TextStyle(color: Colors.black),
                                    textAlign: TextAlign.end,
                                    overflow: TextOverflow.fade,
                                    softWrap: false,
                                  )),
                              const Icon(Icons.keyboard_arrow_down)
                            ]),
                        itemBuilder: (context) {
                          return List.generate(widget.statusArray.length,
                                  (index) {
                                return PopupMenuItem(
                                  child:
                                  Text(widget.statusArray[index].statusname ?? ''),
                                  value: widget.statusArray[index].statusname,
                                );
                              });
                        },
                        onSelected: (value) {
                          itemvalue = value;
                          if (itemvalue == 'มีงานทำ') {
                            isJobInStatusVisible = true;
                          } else {
                            isJobInStatusVisible = false;
                          }
                          setState(() {
                            // print(value);
                            widget.callbackFromWorkDataTabStatus(value);
                          });
                        },
                      ),

                      // DropdownButtonFormField<String>(
                      //   // alignment: Alignment.centerRight,
                      //   decoration: InputDecoration(
                      //     border: InputBorder.none,
                      //   ),
                      //   value: userattentionvalue,
                      //   items: widget.testarray
                      //       .map((item) => DropdownMenuItem<String>(
                      //       value: item.attenname, child: Text(item.attenname??'', overflow: TextOverflow.fade,
                      //       softWrap: false)))
                      //       .toList(),
                      //   onChanged: (item) => setState(() => userattentionvalue = item),
                      // ),
                    ),
                  ),
                ),
                // Expanded(
                //   child: SizedBox(
                //     child: IgnorePointer(
                //       ignoring: isunpressed,
                //       child: DropdownButtonFormField<String>(
                //         // alignment: Alignment.centerRight,
                //         decoration: InputDecoration(
                //           border: InputBorder.none,
                //         ),
                //         value: itemvalue,
                //         items: widget.statusarray
                //             .map((item) => DropdownMenuItem<String>(
                //             value: item.statusname, child: Text(item.statusname??'')))
                //             .toList(),
                //         onChanged: (item) {
                //           itemvalue = item;
                //           if (itemvalue == 'มีงานทำ') {
                //             isJobInStatusVisible = true;
                //           } else {
                //             isJobInStatusVisible = false;
                //           }
                //           setState(() {});
                //           print(item);
                //         },
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: isJobInStatusVisible,
          child: Column(
            children: [
              ProfileDropdownCareerDataTab(
                isunpressed: isunpressed,
                userjobtypevalue: widget.userJobValue,
                jobtextleft: widget.jobTextLeft,
                jobtypearray: widget.jobTypeArray, callbackHiddenCareerDataTab: (String? jobtype) {
                  print(jobtype);
              },
              ),
              ProfileCareerDataTab(
                  isunpressed: isunpressed,
                  textleft: subtitleworkplace,
                  textright: userworkplace, callbackFromHiddenCareerDataTab: (String workplace) {
                    print(workplace);
              },),
              ProfileCareerDataTab(
                  isunpressed: isunpressed,
                  textleft: textcareer,
                  textright: usercareer, callbackFromHiddenCareerDataTab: (String career) {
                print(career);
              },),
              ProfileCareerDataTab(
                  isunpressed: isunpressed,
                  textleft: textcomp,
                  textright: usercompany, callbackFromHiddenCareerDataTab: (String company) {
                print(company);
              },)
            ],
          ),
        )
      ],
    );
  }
}
////////////////////////////////////////////////////////////////////////////////
