import 'package:flutter/material.dart';

import '../model/response/api_profile.dart';


class ProfileAddressDataHead extends StatefulWidget {
  final ApiProfileResponse? dataFromAPI;

  ProfileAddressDataHead({Key? key, required this.dataFromAPI}) : super(key: key);

  @override
  State<ProfileAddressDataHead> createState() => _ProfileAddressDataHeadState();
}

class _ProfileAddressDataHeadState extends State<ProfileAddressDataHead> {
  bool ispressed = true;

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
                  '${dataFromAPI?.body?.screeninfo?.subtitleaddress}',
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
            textleft: '${dataFromAPI?.body?.screeninfo?.texthousenumber}',
            textright: '${dataFromAPI?.body?.profileAddressInfo?.number}'),
        ProfileAddressDataTab(
            ispressed: ispressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textmoo}',
            textright: '${dataFromAPI?.body?.profileAddressInfo?.moo}'),
        ProfileAddressDataTab(
            ispressed: ispressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textsoi}',
            textright: '${dataFromAPI?.body?.profileAddressInfo?.soi}'),
        ProfileAddressDataTab(
            ispressed: ispressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textroad}',
            textright: '${dataFromAPI?.body?.profileAddressInfo?.road}'),
        ProfileAddressDataTab(
            ispressed: ispressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textsubdistrict}',
            textright: '${dataFromAPI?.body?.profileAddressInfo?.subdistrict}'),
        ProfileAddressDataTab(
            ispressed: ispressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textdistrict}',
            textright: '${dataFromAPI?.body?.profileAddressInfo?.district}'),
        ProfileAddressDataTab(
            ispressed: ispressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textprovince}',
            textright: '${dataFromAPI?.body?.profileAddressInfo?.province}'),
        ProfileAddressDataTab(
            ispressed: ispressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textzipcode}',
            textright: '${dataFromAPI?.body?.profileAddressInfo?.zipcode}'),
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
