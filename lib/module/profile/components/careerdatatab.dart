import 'dart:convert';

import 'package:f2fbuu/module/profile/components/attentiondatatab.dart';
import 'package:f2fbuu/module/profile/components/workdatatab.dart';
import 'package:flutter/material.dart';

import '../model/response/api_profile.dart';

class ProfileCareerDataHead extends StatefulWidget {
  final ApiProfileResponse? dataFromAPI;
  ProfileCareerDataHead({Key? key, required this.dataFromAPI}) : super(key: key);

  @override
  State<ProfileCareerDataHead> createState() => _ProfileCareerDataHeadState();
}

////////////////////////////////////////////////////////////////////////////////
class _ProfileCareerDataHeadState extends State<ProfileCareerDataHead> {
  bool ispressed = true;
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    // print(json.encode(widget.dataFromAPI));
    // print('${json.encode(widget.dataFromAPI.body?.userattention)}');
    var dataFromAPI = widget.dataFromAPI;
    // var statusarray = [
    //   '${dataFromAPI.body?.profileCareerInfo?.status[0]?.statusname}',
    //   '${dataFromAPI.body?.profileCareerInfo?.status[1]?.statusname}',
    //   '${dataFromAPI.body?.profileCareerInfo?.status[2]?.statusname}',
    //   '${dataFromAPI.body?.profileCareerInfo?.status[3]?.statusname}',
    // ];
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
                  '${dataFromAPI?.body?.screeninfo?.textcareer}',
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
                      },
                      child: ispressed
                          ? Text('แก้ไข', style: TextStyle(color: Colors.red))
                          : Text('บันทึก',
                              style: TextStyle(color: Colors.green)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ProfileAttentionDropdownTab(
          testarray: dataFromAPI?.body?.screeninfo?.profileCareerScreeninfo?.attention??[],
          userattentionvalue: dataFromAPI?.body?.profileCareerInfo?.userattention??"",
          textleft: '${dataFromAPI?.body?.screeninfo?.textatt}',
        ),
        ProfileCareerDropdownTab(
          textleft: '${dataFromAPI?.body?.screeninfo?.textstatus}',
          statusarray: dataFromAPI?.body?.screeninfo?.profileCareerScreeninfo?.status??[],
          userstatusvalue: dataFromAPI?.body?.profileCareerInfo?.userstatus??"",
          jobtextleft: '${dataFromAPI?.body?.screeninfo?.textJobtype}',
          jobtypearray: dataFromAPI?.body?.screeninfo?.profileCareerScreeninfo?.jobtype??[],
          userjobvalue: dataFromAPI?.body?.profileCareerInfo?.userjobtype??"",
          subtitleworkplace: '${dataFromAPI?.body?.screeninfo?.subtitleworkplace}',
          userworkplace: dataFromAPI?.body?.profileCareerInfo?.userworkplace??"",
          usercareer: dataFromAPI?.body?.profileCareerInfo?.usercareer??"",
          usercompany: dataFromAPI?.body?.profileCareerInfo?.usercompany??"",
          textcomp: '${dataFromAPI?.body?.screeninfo?.textcomp}',
          textcareer: '${dataFromAPI?.body?.screeninfo?.textcareer}',
          ispressed: ispressed,
        ),
      ],
    );
  }
}
