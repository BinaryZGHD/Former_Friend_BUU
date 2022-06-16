import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
class ProfileContactDataHead extends StatefulWidget {
  final String title;

  ProfileContactDataHead({Key? key, required this.title}) : super(key: key);

  @override
  State<ProfileContactDataHead> createState() => _ProfileContactDataHeadState();
}

class _ProfileContactDataHeadState extends State<ProfileContactDataHead> {
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
        ProfileContactDataTab(
          ispressed: ispressed,
          iconcontact: Icon(
            Icons.phone,
            color: HexColor('#000000'),
          ),
          textcontact: '0123456789',
        ),
        ProfileContactDataTab(
          ispressed: ispressed,
          iconcontact: Icon(
            FontAwesomeIcons.line,
            color: HexColor('#00B900'),
          ),
          textcontact: '@scimath',
        ),
        ProfileContactDataTab(
          ispressed: ispressed,
          iconcontact: Icon(
            FontAwesomeIcons.facebook,
            color: HexColor('#3B5998'),
          ),
          textcontact: 'scimath',
        ),
        ProfileContactDataTab(
          ispressed: ispressed,
          iconcontact: Icon(
            FontAwesomeIcons.instagram,
            color: HexColor('#E1306C'),
          ),
          textcontact: 'scimath',
        ),
        ProfileContactDataTab(
          ispressed: ispressed,
          iconcontact: Icon(
            FontAwesomeIcons.twitter,
            color: HexColor('#00acee'),
          ),
          textcontact: 'scimath',
        ),
        ProfileContactDataTab(
          ispressed: ispressed,
          iconcontact: Icon(
            FontAwesomeIcons.youtube,
            color: HexColor('#FF0000'),
          ),
          textcontact: 'scimath',
        ),
      ],
    );
  }
}
//////
class ProfileContactDataTab extends StatefulWidget {
  final Widget iconcontact;
  final String textcontact;
  final bool ispressed;
  ProfileContactDataTab({Key? key, required this.iconcontact, required this.textcontact, required this.ispressed}) : super(key: key);

  @override
  State<ProfileContactDataTab> createState() => _ProfileContactDataTabState();
}

class _ProfileContactDataTabState extends State<ProfileContactDataTab> {
  @override
  Widget build(BuildContext context) {
    Widget iconcontact = widget.iconcontact;
    String textcontact = widget.textcontact;
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
            iconcontact,
            Expanded(
              child: Container(
                child: TextFormField(
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
                  initialValue: textcontact,
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


