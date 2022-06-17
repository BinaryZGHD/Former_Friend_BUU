import 'package:f2fbuu/module/profile/components/attentiondatatab.dart';
import 'package:f2fbuu/module/profile/components/workdatatab.dart';
import 'package:flutter/material.dart';
import 'package:f2fbuu/module/profile/bloc/profiledata.dart';

class ProfileCareerDataHead extends StatefulWidget {
  ProfileCareerDataHead({Key? key}) : super(key: key);

  @override
  State<ProfileCareerDataHead> createState() => _ProfileCareerDataHeadState();
}

////////////////////////////////////////////////////////////////////////////////
class _ProfileCareerDataHeadState extends State<ProfileCareerDataHead> {
  bool ispressed = true;
  bool isVisible = true;
  var apiScreenInfo = api['body']['screeninfo'];
  var apiProfileCareerInfo = api['body']['profile_career_info'];
  var apiAttentionItems = api['body']['profile_career_info']['attention'];
  var apiStatusItems = api['body']['profile_career_info']['status'];
  var apiJobTypeItems = api['body']['profile_career_info']['jobtype'];

  @override
  Widget build(BuildContext context) {
    // print(apiattenionitems);
    // List.generate(apiattenionitems.length, (index) => null);
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
                  apiScreenInfo['subtitleworkinfo'],
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
        ProfileAttentionDropdownTab(
          attention: apiAttentionItems,
          userattentionvalue: attentionvalue,
          textleft: apiScreenInfo['textatt'],
          itemvalue: attentionvalue,
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
