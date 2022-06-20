import 'dart:convert';

import 'package:f2fbuu/module/profile/components/attentiondatatab.dart';
import 'package:f2fbuu/module/profile/components/workdatatab.dart';
import 'package:flutter/material.dart';
import 'package:f2fbuu/module/profile/bloc/profiledata.dart';

class ProfileCareerDataHead extends StatefulWidget {
  final dataFromAPI;
  ProfileCareerDataHead({Key? key, required this.dataFromAPI}) : super(key: key);

  @override
  State<ProfileCareerDataHead> createState() => _ProfileCareerDataHeadState();
}

////////////////////////////////////////////////////////////////////////////////
class _ProfileCareerDataHeadState extends State<ProfileCareerDataHead> {
  bool ispressed = true;
  bool isVisible = true;
  var apiScreenInfo = api['body']['screeninfo'];
  var apiProfileCareerInfo = api['body']['profile_career_info'];
  // var apiAttentionItems = api['body']['profile_career_info']['attention'];
  var apiStatusItems = api['body']['profile_career_info']['status'];
  var apiJobTypeItems = api['body']['profile_career_info']['jobtype'];

  @override
  Widget build(BuildContext context) {
    // print(json.encode(widget.dataFromAPI));
    // print('${json.encode(widget.dataFromAPI.body?.userattention)}');
    var dataFromAPI = widget.dataFromAPI;
    var apiattentionvalue = dataFromAPI.body?.profileCareerInfo?.userattention;
    // var attentionarray = [
    //   '${dataFromAPI.body?.profileCareerInfo?.attention[0]?.attenname}',
    //   '${dataFromAPI.body?.profileCareerInfo?.attention[1]?.attenname}',
    //   '${dataFromAPI.body?.profileCareerInfo?.attention[2]?.attenname}',
    //   '${dataFromAPI.body?.profileCareerInfo?.attention[3]?.attenname}',
    //   '${dataFromAPI.body?.profileCareerInfo?.attention[4]?.attenname}',
    // ];
    // print("attentionarray =" + '${attentionarray}');
    var statusarray = [
      '${dataFromAPI.body?.profileCareerInfo?.status[0]?.statusname}',
      '${dataFromAPI.body?.profileCareerInfo?.status[1]?.statusname}',
      '${dataFromAPI.body?.profileCareerInfo?.status[2]?.statusname}',
      '${dataFromAPI.body?.profileCareerInfo?.status[3]?.statusname}',
    ];
    var jobtypearray = [
      '${dataFromAPI.body?.profileCareerInfo?.jobtype[0]?.jobname}',
      '${dataFromAPI.body?.profileCareerInfo?.jobtype[1]?.jobname}',
      '${dataFromAPI.body?.profileCareerInfo?.jobtype[2]?.jobname}',
      '${dataFromAPI.body?.profileCareerInfo?.jobtype[3]?.jobname}',
    ];
    // print('${dataFromAPI.body?.profileCareerInfo?.status[0]?.statusname}');
    // print(dataFromAPI.body?.profileCareerInfo?.attention);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(width: 1, color: Colors.black12),
                bottom: BorderSide(width: 1, color: Colors.transparent)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  '${dataFromAPI.body?.screeninfo?.textcareer}',
                  style: TextStyle(fontSize: 20),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          ispressed = !ispressed;
                        });
                        // setState((){
                        //   if (ispressed == true) {
                        //     editorsave = 'บันทึก';
                        //   } else {
                        //     editorsave = 'แก้ไข';
                        //   }
                        //   print(ispressed);
                        // });
                        // }, child: Text(editorsave,
                      },
                      child: ispressed
                          ? Text('แก้ไข', style: TextStyle(color: Colors.red))
                          : Text('บันทึก',
                              style: TextStyle(color: Colors.green)),
                    ),
                  ),

                  // Text(editorsave,
                  //       style:
                  //       TextStyle(fontSize: 18, color: Colors.red),
                  //       textAlign: TextAlign.right),
                ),
              ],
            ),
          ),
        ),
        // Text('${json.encode(dataFromAPI.body?.profileCareerInfo?.attention)}'),
        ProfileAttentionDropdownTab(
          testarray: dataFromAPI.body?.profileCareerInfo?.attention,
          // attention: attentionarray,
          userattentionvalue: apiattentionvalue,
          textleft: '${dataFromAPI.body?.screeninfo?.textatt}',
          // '${dataFromAPI?.body?.screeninfo?.textatt}',
        ),
        ProfileCareerDropdownTab(
          status: apiStatusItems,
          textleft: apiScreenInfo['textstatus'],
          statusitemvalue: statusvalue,
          jobitem: apiJobTypeItems,
          jobtextleft: apiScreenInfo['textJobtype'],
          ispressed: ispressed,
          jobitemvalue: jobtypevalue,
          subtitleworkplace: apiScreenInfo['subtitleworkplace'],
          userworkplace: apiProfileCareerInfo['userworkplace'],
          usercareer: apiProfileCareerInfo['usercareer'],
          usercompany: apiProfileCareerInfo['usercompany'],
          textcomp: apiScreenInfo['textcomp'],
          textcareer: apiScreenInfo['textcareer'],

        ),
      ],
    );
  }
}
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
