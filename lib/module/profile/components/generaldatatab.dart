import 'package:flutter/material.dart';

class ProfileGeneralDataHead extends StatefulWidget {
  final String title;
  ProfileGeneralDataHead({Key? key, required this.title}) : super(key: key);

  @override
  State<ProfileGeneralDataHead> createState() => _ProfileGeneralDataHeadState();
}

class _ProfileGeneralDataHeadState extends State<ProfileGeneralDataHead> {
  bool ispressed = false;
  bool isedit = false;
  @override
  Widget build(BuildContext context) {
    String textleft = widget.title;
    String editorsave = 'Edit';

    return Container(
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
                    setState((){
                      if (ispressed == true) {
                        editorsave = 'บันทึก';
                      } else {
                        editorsave = 'แก้ไข';
                      }
                      print(ispressed);
                    });
                  }, child: Text(editorsave!,
                    style:
                    TextStyle(fontSize: 18, color: Colors.red),),),
              ),

              // Text(editorsave,
              //       style:
              //       TextStyle(fontSize: 18, color: Colors.red),
              //       textAlign: TextAlign.right),
              ),
          ],
        ),
      ),
    );
  }
}



////////////////////////////////////////////////////////////////////////////////
class ProfileGeneralDataTab extends StatefulWidget {
  final String textleft;
  final String textright;
  bool istffreadonly = true;
  ProfileGeneralDataTab({Key? key, required this.textleft, required this.textright}) : super(key: key);

  @override
  State<ProfileGeneralDataTab> createState() => _ProfileGeneralDataTabState();
}

class _ProfileGeneralDataTabState extends State<ProfileGeneralDataTab> {
  @override
  Widget build(BuildContext context) {
    String textleft = widget.textleft;
    String textright = widget.textright;
    bool istffreadonly = true;
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
                  readOnly: istffreadonly,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
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
