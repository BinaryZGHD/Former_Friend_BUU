import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class ProfileEducationDataHead extends StatefulWidget {
  final String title;
  ProfileEducationDataHead({Key? key, required this.title}) : super(key: key);

  @override
  State<ProfileEducationDataHead> createState() => _ProfileEducationDataHeadState();
}
class _ProfileEducationDataHeadState extends State<ProfileEducationDataHead> {
  bool ispressed = true;
  @override
  Widget build(BuildContext context) {
    String textleft = widget.title;

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
                  textleft,
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
            textleft: 'คณะ',
            textright: 'วิทยาศาสตร์'),
        ProfileEducationDataTab(
            ispressed: ispressed,
            textleft: 'ภาควิชา',
            textright: 'คณิตศาสตร์'),
        ProfileEducationDataTab(
            ispressed: ispressed,
            textleft: 'สาขาวิชา',
            textright: 'คณิตศาสตร์'),
        ProfileEducationDataTab(
            ispressed: ispressed,
            textleft: 'เกรดเฉลี่ย (ระดับมัธยมต้น)',
            textright: '4.00'),
        ProfileEducationDataTab(
            ispressed: ispressed,
            textleft: 'เกรดเฉลี่ย (ระดับมัธยมปลาย)',
            textright: '3.55'),
        ProfileEducationDataTab(
            ispressed: ispressed,
            textleft: 'เกรดเฉลี่ย (ระดับอนุปริญญา)',
            textright: '2.99'),
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