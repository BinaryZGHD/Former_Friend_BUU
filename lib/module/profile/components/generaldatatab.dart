import 'dart:developer';

import 'package:f2fbuu/model/profilemodel/profilescreeninfoapi/profilescreeninfoapi.dart';
import 'package:flutter/material.dart';
class ProfileGeneralDataHead extends StatefulWidget {
  final dataFromAPI;
  ProfileGeneralDataHead({Key? key, required this.dataFromAPI}) : super(key: key);

  @override
  State<ProfileGeneralDataHead> createState() => _ProfileGeneralDataHeadState();
}

class _ProfileGeneralDataHeadState extends State<ProfileGeneralDataHead> {
  bool ispressed = true;
  // var apiscreeninfo = api['body']['screeninfo'];
  // var apiprofile_general_info = api['body']['profile_general_info'];

  @override
  Widget build(BuildContext context) {
    var dataFromAPI = widget.dataFromAPI;
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
                  '${dataFromAPI.body?.screeninfo?.subtitlegeninfor}',
                  style: TextStyle(fontSize: 20),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          ispressed = !ispressed;
                        }
                        );
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
          textleft: '${dataFromAPI?.body?.screeninfo?.textname}',
          textright: '${dataFromAPI?.body?.profileGeneralInfo?.name}'
        ),
        ProfileGeneralDataTab(
            ispressed: ispressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textlname}',
            textright: '${dataFromAPI?.body?.profileGeneralInfo?.surname}'
        ),
        ProfileGeneralDataTab(
            ispressed: ispressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textnickname}',
            textright: '${dataFromAPI?.body?.profileGeneralInfo?.nickname}'
        ),
        ProfileGeneralDataTab(
            ispressed: ispressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textstdcode}',
            textright: '${dataFromAPI?.body?.profileGeneralInfo?.stuCode}'
        ),
        ProfileGeneralDataTab(
            ispressed: ispressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textgen}',
            textright: '${dataFromAPI?.body?.profileGeneralInfo?.gen}'
        ),
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
                  // onChanged: (value) {
                  //   setState(() {
                  //     texttest = value;
                  //     print(texttest);
                  //   });
                  // },
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
