import 'package:flutter/material.dart';
import 'package:f2fbuu/module/profile/bloc/profiledata.dart';
class ProfileGeneralDataHead extends StatefulWidget {
  final String title;

  ProfileGeneralDataHead({Key? key, required this.title}) : super(key: key);

  @override
  State<ProfileGeneralDataHead> createState() => _ProfileGeneralDataHeadState();
}

class _ProfileGeneralDataHeadState extends State<ProfileGeneralDataHead> {
  bool ispressed = true;
  var apiscreeninfo = api['body']['screeninfo'];
  var apiprofile_general_info = api['body']['profile_general_info'];
  @override
  Widget build(BuildContext context) {
    String textleft = widget.title;
    // print(api['body']['screeninfo']['titleprofile']);
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
                Text(apiscreeninfo['subtitlegeninfor'],
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
        ProfileGeneralDataTab(
          ispressed: ispressed,
          textleft: apiscreeninfo['textname'],
          textright: apiprofile_general_info['name'],
        ),
        ProfileGeneralDataTab(
            ispressed: ispressed,
            textleft: apiscreeninfo['textlname'],
            textright: apiprofile_general_info['surname']),
        ProfileGeneralDataTab(
            ispressed: ispressed, textleft: 'ชื่อเล่น', textright: 'แมท'),
        ProfileGeneralDataTab(
            ispressed: ispressed, textleft: 'รหัสนิสิต', textright: '62030xxx'),
        ProfileGeneralDataTab(
            ispressed: ispressed, textleft: 'รุ่น', textright: '65'),
      ],
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
class ProfileGeneralDataTab extends StatefulWidget {
  final String textleft;
  final String textright;
  final bool ispressed;

  ProfileGeneralDataTab(
      {Key? key,
      required this.textleft,
      required this.textright,
      required this.ispressed})
      : super(key: key);

  @override
  State<ProfileGeneralDataTab> createState() => _ProfileGeneralDataTabState();
}

class _ProfileGeneralDataTabState extends State<ProfileGeneralDataTab> {
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
