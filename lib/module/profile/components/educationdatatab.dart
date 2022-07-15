import 'package:f2fbuu/module/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/response/api_profile.dart';
import 'package:hexcolor/hexcolor.dart';


class ProfileEducationDataHead extends StatefulWidget {
  final ApiProfileResponse? dataFromAPI;
  ProfileEducationDataHead({Key? key, required this.dataFromAPI}) : super(key: key);

  @override
  State<ProfileEducationDataHead> createState() => _ProfileEducationDataHeadState();
}
class _ProfileEducationDataHeadState extends State<ProfileEducationDataHead> {
  bool isUnpressed = true;
  @override
  Widget build(BuildContext context) {
    var dataFromAPI = widget.dataFromAPI;
    String gpaJhValue = "";
    String gpaShValue = "";
    String gpaBdValue = "";
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
                          isUnpressed = !isUnpressed;
                          if(isUnpressed == true){
                            context.read<ProfileBloc>().add(EducationSubmitEvent(gpaBd: gpaBdValue, gpaSh: gpaShValue, gpaJh: gpaJhValue, token: ''));
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
                      child: isUnpressed
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
            isUnpressed: isUnpressed,
            textLeft: '${dataFromAPI?.body?.screeninfo?.textfac}',
            textRight: '${dataFromAPI?.body?.profileEduInfo?.faculty}'),
        ProfileEducationDataReadonlyTab(
            isUnpressed: isUnpressed,
            textLeft: '${dataFromAPI?.body?.screeninfo?.textdepart}',
            textRight: '${dataFromAPI?.body?.profileEduInfo?.department}'),
        ProfileEducationDataReadonlyTab(
            isUnpressed: isUnpressed,
            textLeft: '${dataFromAPI?.body?.screeninfo?.textmajor}',
            textRight: '${dataFromAPI?.body?.profileEduInfo?.major}'),
        ProfileEducationDataTab(
            isUnpressed: isUnpressed,
            textLeft: '${dataFromAPI?.body?.screeninfo?.textgpaju}',
            textRight: '${dataFromAPI?.body?.profileEduInfo?.gpaJhs}',
          onChange: (value) {
            gpaJhValue = value;
            print(gpaJhValue);
          },),
        ProfileEducationDataTab(
            isUnpressed: isUnpressed,
            textLeft: '${dataFromAPI?.body?.screeninfo?.textgpase}',
            textRight: '${dataFromAPI?.body?.profileEduInfo?.gpaShs}',
          onChange: (value) {
          gpaShValue = value;
          print(gpaShValue);
        },),
        ProfileEducationDataTab(
            isUnpressed: isUnpressed,
            textLeft: '${dataFromAPI?.body?.screeninfo?.textgpaba}',
            textRight: '${dataFromAPI?.body?.profileEduInfo?.gpaBd}',
          onChange: (value) {
            gpaBdValue = value;
            print(gpaBdValue);
          },),
      ],
    );
  }
}
////////////////////////////////////////////////////////////////////////////////
class ProfileEducationDataTab extends StatefulWidget {
  final String textLeft;
  final String textRight;
  final bool isUnpressed;
  final ValueChanged<String>? onChange;
  ProfileEducationDataTab(
      {Key? key,
        required this.textLeft,
        required this.textRight,
        required this.isUnpressed,
        this.onChange})
      : super(key: key);

  @override
  State<ProfileEducationDataTab> createState() => _ProfileEducationDataTabState();
}

class _ProfileEducationDataTabState extends State<ProfileEducationDataTab> {
  @override
  Widget build(BuildContext context) {
    String textLeft = widget.textLeft;
    String textRight = widget.textRight;
    bool isUnpressed = widget.isUnpressed;
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
              textLeft + ' ',
              style: TextStyle(fontSize: 18),
            ),
            Expanded(
              child: Container(
                child: TextFormField(
                  autofocus: false,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  keyboardType: TextInputType.numberWithOptions(),
                  readOnly: isUnpressed,
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
                  initialValue: textRight,
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
  final String textLeft;
  final String textRight;
  final bool isUnpressed;

  ProfileEducationDataReadonlyTab(
      {Key? key,
        required this.textLeft,
        required this.textRight,
        required this.isUnpressed})
      : super(key: key);

  @override
  State<ProfileEducationDataReadonlyTab> createState() => _ProfileEducationDataReadonlyTabState();
}

class _ProfileEducationDataReadonlyTabState extends State<ProfileEducationDataReadonlyTab> {
  @override
  Widget build(BuildContext context) {
    String textLeft = widget.textLeft;
    String textRight = widget.textRight;
    String textEduData = '';
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
              textLeft + ' ',
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
                      textEduData = value;
                      print(textEduData);
                    });
                  },
                  initialValue: textRight,
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