import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../model/response/api_profile.dart';

class ProfileGeneralDataHead extends StatefulWidget {
  final ApiProfileResponse? dataFromAPI;
  ProfileGeneralDataHead({Key? key, required this.dataFromAPI})
      : super(key: key);
  @override
  State<ProfileGeneralDataHead> createState() => _ProfileGeneralDataHeadState();
}

class _ProfileGeneralDataHeadState extends State<ProfileGeneralDataHead> {
  bool isunpressed = true;
  bool sentgeneraldata = false;
  @override
  Widget build(BuildContext context) {
    var dataFromAPI = widget.dataFromAPI;
    String namevalue = "";
    String surnamevalue = "";
    String nicknamevalue = "";
    if (isunpressed == true){
      sentgeneraldata = true;
    };
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
                  '${dataFromAPI?.body?.screeninfo?.subtitlegeninfor}',
                  style: TextStyle(fontSize: 20),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isunpressed = !isunpressed;
                        });
                      },
                      child: isunpressed
                          // ? Text('บันทึก', style: TextStyle(color: Colors.green))
                          ? Text('แก้ไข', style: TextStyle(color: Colors.red))
                          : Text('บันทึก',
                              style: TextStyle(color: Colors.green)),
                      // : Text('แก้ไข', style: TextStyle(color: Colors.red)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ProfileGeneralDataTab(
          isunpressed: isunpressed,
          textleft: '${dataFromAPI?.body?.screeninfo?.textname}',
          textright: '${dataFromAPI?.body?.profileGeneralInfo?.name}',
          onChange: (value) {
            namevalue = value;
            print(namevalue);
          },
        ),
        ProfileGeneralDataTab(
          isunpressed: isunpressed,
          textleft: '${dataFromAPI?.body?.screeninfo?.textlname}',
          textright: '${dataFromAPI?.body?.profileGeneralInfo?.surname}',
          onChange: (value) {
            surnamevalue = value;
            print(surnamevalue);
          },
        ),
        ProfileGeneralDataTab(
            isunpressed: isunpressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textnickname}',
            textright: '${dataFromAPI?.body?.profileGeneralInfo?.nickname}',
            onChange: (value) {
              nicknamevalue = value;
              print(nicknamevalue);
            }),
        ProfileGeneralDataReadonlyTab(
            isunpressed: isunpressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textstdcode}',
            textright: '${dataFromAPI?.body?.profileGeneralInfo?.stuCode}'),
        ProfileGeneralDataReadonlyTab(
            isunpressed: isunpressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textgen}',
            textright: '${dataFromAPI?.body?.profileGeneralInfo?.gen}'),
      ],
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
class ProfileGeneralDataTab extends StatefulWidget {
  final String textleft;
  final String textright;
  final bool isunpressed;
  final ValueChanged<String>? onChange;

  ProfileGeneralDataTab(
      {Key? key,
      required this.textleft,
      required this.textright,
      required this.isunpressed,
      this.onChange})
      : super(key: key);

  @override
  State<ProfileGeneralDataTab> createState() => _ProfileGeneralDataTabState();
}

class _ProfileGeneralDataTabState extends State<ProfileGeneralDataTab> {
  @override
  Widget build(BuildContext context) {
    String textleft = widget.textleft;
    String textright = widget.textright;
    bool ispressed = widget.isunpressed;
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
                  // readOnly: true,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  initialValue: textright,
                  onChanged: widget.onChange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////
class ProfileGeneralDataReadonlyTab extends StatefulWidget {
  final String textleft;
  final String textright;
  final bool isunpressed;

  ProfileGeneralDataReadonlyTab(
      {Key? key,
      required this.textleft,
      required this.textright,
      required this.isunpressed})
      : super(key: key);

  @override
  State<ProfileGeneralDataReadonlyTab> createState() =>
      _ProfileGeneralDataReadonlyTabState();
}

class _ProfileGeneralDataReadonlyTabState
    extends State<ProfileGeneralDataReadonlyTab> {
  @override
  Widget build(BuildContext context) {
    String textleft = widget.textleft;
    String textright = widget.textright;
    bool ispressed = widget.isunpressed;
    String texttest = 'testtesttest';
    return Container(
      decoration: BoxDecoration(
        color: HexColor('#f5f5f5'),
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
                  // readOnly: ispressed,
                  readOnly: true,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  initialValue: textright,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
