import 'package:f2fbuu/module/profile/bloc/profiledata.dart';
import 'package:flutter/material.dart';


class ProfileAddressDataHead extends StatefulWidget {

  ProfileAddressDataHead({Key? key}) : super(key: key);

  @override
  State<ProfileAddressDataHead> createState() => _ProfileAddressDataHeadState();
}

class _ProfileAddressDataHeadState extends State<ProfileAddressDataHead> {
  bool ispressed = true;

  @override
  Widget build(BuildContext context) {
    var apiscreeninfo = api['body']['screeninfo'];
    var apiprofile_address_info = api['body']['profile_address_info'];
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
        ProfileAddressDataTab(
           ispressed: ispressed,
            textleft: apiscreeninfo['texthousenumber'],
            textright: apiprofile_address_info['number'],),
        ProfileAddressDataTab(
            ispressed: ispressed,
            textleft: apiscreeninfo['textmoo'],
            textright: apiprofile_address_info['moo']),
        ProfileAddressDataTab(
            ispressed: ispressed,
            textleft: apiscreeninfo['textsoi'],
            textright: apiprofile_address_info['soi']),
        ProfileAddressDataTab(
            ispressed: ispressed,
            textleft: apiscreeninfo['textroad'],
            textright: apiprofile_address_info['road']),
        ProfileAddressDataTab(
            ispressed: ispressed,
            textleft: apiscreeninfo['textsubdistrict'],
            textright: apiprofile_address_info['subdistrict']),
        ProfileAddressDataTab(
            ispressed: ispressed,
            textleft: apiscreeninfo['textdistrict'],
            textright: apiprofile_address_info['district']),
        ProfileAddressDataTab(
            ispressed: ispressed,
            textleft: apiscreeninfo['textprovince'],
            textright: apiprofile_address_info['province']),
        ProfileAddressDataTab(
            ispressed: ispressed,
            textleft: apiscreeninfo['textzipcode'],
            textright: apiprofile_address_info['zipcode']),
      ],
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
class ProfileAddressDataTab extends StatefulWidget {
  final String textleft;
  final String textright;
  final bool ispressed;
  ProfileAddressDataTab({Key? key, required this.textleft, required this.textright, required this.ispressed}) : super(key: key);

  @override
  State<ProfileAddressDataTab> createState() => _ProfileAddressDataTabState();
}

class _ProfileAddressDataTabState extends State<ProfileAddressDataTab> {
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
