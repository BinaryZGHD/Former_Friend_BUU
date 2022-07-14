import 'package:f2fbuu/module/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/response/api_profile.dart';
import '../model/response/api_profile.dart';
import 'package:hexcolor/hexcolor.dart';


class ProfileEducationDataHead extends StatefulWidget {
  final ApiProfileResponse? dataFromAPI;
  ProfileEducationDataHead({Key? key, required this.dataFromAPI}) : super(key: key);

  @override
  State<ProfileEducationDataHead> createState() => _ProfileEducationDataHeadState();
}
class _ProfileEducationDataHeadState extends State<ProfileEducationDataHead> {
  bool isunpressed = true;
  @override
  Widget build(BuildContext context) {
    var dataFromAPI = widget.dataFromAPI;
    String gpajhvalue = "";
    String gpashvalue = "";
    String gpabdvalue = "";
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
                  '${dataFromAPI?.body?.screeninfo?.subtitleeduinfo}',
                  style: TextStyle(fontSize: 20),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isunpressed = !isunpressed;
                          if(isunpressed == true){
                            context.read<ProfileBloc>().add(EducationSubmitEvent(gpabd: gpabdvalue, gpash: gpashvalue, gpajh: gpajhvalue, token: ''));
                          };
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
                      child: isunpressed
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
        ProfileEducationDataReadonlyTab(
            isunpressed: isunpressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textfac}',
            textright: '${dataFromAPI?.body?.profileEduInfo?.faculty}'),
        ProfileEducationDataReadonlyTab(
            isunpressed: isunpressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textdepart}',
            textright: '${dataFromAPI?.body?.profileEduInfo?.department}'),
        ProfileEducationDataReadonlyTab(
            isunpressed: isunpressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textmajor}',
            textright: '${dataFromAPI?.body?.profileEduInfo?.major}'),
        ProfileEducationDataTab(
            isunpressed: isunpressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textgpaju}',
            textright: '${dataFromAPI?.body?.profileEduInfo?.gpaJhs}',
          onChange: (value) {
            gpajhvalue = value;
            print(gpajhvalue);
          },),
        ProfileEducationDataTab(
            isunpressed: isunpressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textgpase}',
            textright: '${dataFromAPI?.body?.profileEduInfo?.gpaShs}',
          onChange: (value) {
          gpashvalue = value;
          print(gpashvalue);
        },),
        ProfileEducationDataTab(
            isunpressed: isunpressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textgpaba}',
            textright: '${dataFromAPI?.body?.profileEduInfo?.gpaBd}',
          onChange: (value) {
            gpabdvalue = value;
            print(gpabdvalue);
          },),
      ],
    );
  }
}
////////////////////////////////////////////////////////////////////////////////
class ProfileEducationDataTab extends StatefulWidget {
  final String textleft;
  final String textright;
  final bool isunpressed;
  final ValueChanged<String>? onChange;
  ProfileEducationDataTab(
      {Key? key,
        required this.textleft,
        required this.textright,
        required this.isunpressed,
        this.onChange})
      : super(key: key);

  @override
  State<ProfileEducationDataTab> createState() => _ProfileEducationDataTabState();
}

class _ProfileEducationDataTabState extends State<ProfileEducationDataTab> {
  @override
  Widget build(BuildContext context) {
    String textleft = widget.textleft;
    String textright = widget.textright;
    bool ispressed = widget.isunpressed;
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
                  keyboardType: TextInputType.numberWithOptions(),
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
                  onChanged : widget.onChange,
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

////////////////////////////////////////////////////////////////////////////////
class ProfileEducationDataReadonlyTab extends StatefulWidget {
  final String textleft;
  final String textright;
  final bool isunpressed;

  ProfileEducationDataReadonlyTab(
      {Key? key,
        required this.textleft,
        required this.textright,
        required this.isunpressed})
      : super(key: key);

  @override
  State<ProfileEducationDataReadonlyTab> createState() => _ProfileEducationDataReadonlyTabState();
}

class _ProfileEducationDataReadonlyTabState extends State<ProfileEducationDataReadonlyTab> {
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
                  readOnly: true,
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