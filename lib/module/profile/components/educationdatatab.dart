import 'package:f2fbuu/module/profile/bloc/profiledata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class ProfileEducationDataHead extends StatefulWidget {
  ProfileEducationDataHead({Key? key}) : super(key: key);

  @override
  State<ProfileEducationDataHead> createState() => _ProfileEducationDataHeadState();
}
class _ProfileEducationDataHeadState extends State<ProfileEducationDataHead> {
  bool ispressed = true;
  var apiscreeninfo = api['body']['screeninfo'];
  var apiprofile_education_info = api['body']['profile_edu_info'];
  @override
  Widget build(BuildContext context) {
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
                  apiscreeninfo['subtitlegeninfor'],
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
                          : Text('บันทึก', style: TextStyle(color: Colors.green)),
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
        ProfileEducationDataTab(
            ispressed: ispressed,
            textleft: apiscreeninfo['textfac'],
            textright: apiprofile_education_info['faculty']),
        ProfileEducationDataTab(
            ispressed: ispressed,
            textleft: apiscreeninfo['textdepart'],
            textright: apiprofile_education_info['department']),
        ProfileEducationDataTab(
            ispressed: ispressed,
            textleft: apiscreeninfo['textmajor'],
            textright: apiprofile_education_info['major']),
        ProfileEducationDataTab(
            ispressed: ispressed,
            textleft: apiscreeninfo['textgpaju'],
            textright: apiprofile_education_info['gpa_jhs']),
        ProfileEducationDataTab(
            ispressed: ispressed,
            textleft: apiscreeninfo['textgpase'],
            textright: apiprofile_education_info['gpa_shs']),
        ProfileEducationDataTab(
            ispressed: ispressed,
            textleft: apiscreeninfo['textgpaba'],
            textright: apiprofile_education_info['gpa_bd']),
      ],
    );
  }
}
////////////////////////////////////////////////////////////////////////////////
class ProfileEducationDataTab extends StatefulWidget {
  final String textleft;
  final String textright;
  final bool ispressed;

  ProfileEducationDataTab(
      {Key? key,
        required this.textleft,
        required this.textright,
        required this.ispressed})
      : super(key: key);

  @override
  State<ProfileEducationDataTab> createState() => _ProfileEducationDataTabState();
}

class _ProfileEducationDataTabState extends State<ProfileEducationDataTab> {
  @override
  Widget build(BuildContext context) {
    String textleft = widget.textleft;
    String textright = widget.textright;
    bool ispressed = widget.ispressed;
    String texttest = 'testtesttest';
    return Container(
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(width: 1, color: Colors.black12),
            bottom: BorderSide(width: 1, color: Colors.black12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Text(
              textleft + ' ',
              style: TextStyle(fontSize: 18),
            ),
            Expanded(
              child: Container(
                child: TextFormField(
                  autofocus: false,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  readOnly: ispressed,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      texttest = value;
                      print(texttest);
                    });
                  },
                  initialValue: textright,
                ),

                // Text(
                //   textright,
                //   style: TextStyle(fontSize: 18),
                //   textAlign: TextAlign.right,
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}