import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final attentionsitems = ['คอมพิวเตอร์', 'ครู', 'ประกันภัย', 'สถิติ'];
  late String attentionsvalue = 'คอมพิวเตอร์';
  final statusitems = ['ศึกษาต่อ', 'ว่างงาน', 'มีงานทำ'];
  late String statusvalue = 'ศึกษาต่อ';
  final jobtypeitems = ['1', '2', '3'];
  late String jobtypevalue;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    String imgurl = 'https://picsum.photos/250?image=9';
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: const Text("บัญชี",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: height * 0.3,
                width: width,
                color: HexColor('#FFF7FD'),
                child: imgurl == ''
                    ? Icon(
                        Icons.account_circle,
                        size: 100,
                      )
                    : Container(
                        margin: EdgeInsets.all(30),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(imgurl),
                          radius: 10,
                        ))),
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: Row(
            //     children: [
            //       Text("ข้อมูลทั่วไป", style: TextStyle(fontSize: 25)),
            //       Spacer(),
            //       Text("Edit", style: TextStyle(fontSize: 20, color: Colors.red)),
            //     ],
            //   ),
            // ),
            ProfileDataHead(
              dheight: height,
              dwidth: width,
              textleft: 'ข้อมูลทั่วไป',
              textright: 'แก้ไข',
              textleftfontsize: 25,
              textrightfontsize: 20,
            ),
            ProfileDataTab(
              dheight: height,
              dwidth: width,
              textleft: 'ชื่อ',
              textright: 'ผู้ใช้งาน',
            ),
            ProfileDataTab(
                dheight: height,
                dwidth: width,
                textleft: 'นามสกุล',
                textright: 'แอปพลิเคชัน'),
            ProfileDataTab(
                dheight: height,
                dwidth: width,
                textleft: 'ชื่อเล่น',
                textright: 'แมท'),
            ProfileDataTab(
                dheight: height,
                dwidth: width,
                textleft: 'รหัสนิสิต',
                textright: '62030xxx'),
            ProfileDataTab(
                dheight: height,
                dwidth: width,
                textleft: 'รุ่น',
                textright: '65'),
            ProfileDataTab(
                dheight: height,
                dwidth: width,
                textleft: 'โทร',
                textright: '0123456789'),
            ProfileDataHead(
                dheight: height,
                dwidth: width,
                textleft: 'ข้อมูลการศึกษา',
                textright: 'แก้ไข',
                textleftfontsize: 25,
                textrightfontsize: 20),
            ProfileDataTab(
                dheight: height,
                dwidth: width,
                textleft: 'คณะ',
                textright: 'วิทยาศาสตร์'),
            ProfileDataTab(
                dheight: height,
                dwidth: width,
                textleft: 'ภาควิชา',
                textright: 'คณิตศาสตร์'),
            ProfileDataTab(
                dheight: height,
                dwidth: width,
                textleft: 'สาขาวิชา',
                textright: 'คณิตศาสตร์'),
            ProfileDataTab(
                dheight: height,
                dwidth: width,
                textleft: 'เกรดเฉลี่ย (ระดับมัธยมต้น)',
                textright: '4.00'),
            ProfileDataTab(
                dheight: height,
                dwidth: width,
                textleft: 'เกรดเฉลี่ย (ระดับมัธยมปลาย)',
                textright: '3.55'),
            ProfileDataTab(
                dheight: height,
                dwidth: width,
                textleft: 'เกรดเฉลี่ย (ระดับอนุปริญญา)',
                textright: '2.99'),
            ProfileDataHead(
                dheight: height,
                dwidth: width,
                textleft: 'ข้อมูลที่อยู่ ',
                textright: 'แก้ไข',
                textleftfontsize: 25,
                textrightfontsize: 20),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: 1, color: Colors.black12),
                    bottom: BorderSide(width: 1, color: Colors.transparent)),
              ),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                minLines: null,
                decoration: InputDecoration(
                  hintText: 'ที่อยู่......',
                  labelStyle: TextStyle(fontSize: 18),
                  border: InputBorder.none,
                  // border: OutlineInputBorder(),
                ),
              ),
            ),
            ProfileDataHead(
                dheight: height,
                dwidth: width,
                textleft: 'ข้อมูลติดต่อ',
                textright: 'แก้ไข',
                textleftfontsize: 25,
                textrightfontsize: 20),
            ProfileContactTab(
              iconcontact: Icon(
                Icons.phone,
                color: HexColor('#000000'),
              ),
              textcontact: '0123456789',
            ),
            ProfileContactTab(
              iconcontact: Icon(
                FontAwesomeIcons.line,
                color: HexColor('#00B900'),
              ),
              textcontact: '@scimath',
            ),
            ProfileContactTab(
              iconcontact: Icon(
                FontAwesomeIcons.facebook,
                color: HexColor('#3B5998'),
              ),
              textcontact: 'scimath',
            ),
            ProfileContactTab(
              iconcontact: Icon(
                FontAwesomeIcons.instagram,
                color: HexColor('#E1306C'),
              ),
              textcontact: 'scimath',
            ),
            ProfileContactTab(
              iconcontact: Icon(
                FontAwesomeIcons.twitter,
                color: HexColor('#00acee'),
              ),
              textcontact: 'scimath',
            ),
            ProfileContactTab(
              iconcontact: Icon(
                FontAwesomeIcons.youtube,
                color: HexColor('#FF0000'),
              ),
              textcontact: 'scimath',
            ),
            ProfileDataHead(
                dheight: height,
                dwidth: width,
                textleft: 'ข้อมูลอาชีพ',
                textright: 'แก้ไข',
                textleftfontsize: 25,
                textrightfontsize: 20),
            ProfileCareerDropdownTab(textleft: 'ความสนใจ', careeritem: attentionsitems, itemvalue: attentionsvalue,),
            ProfileCareerDropdownTab(textleft: 'สถานะ', careeritem: statusitems, itemvalue: statusvalue,),
          ],
        ),
      ),
    );
  }
}

class ProfileDataHead extends StatelessWidget {
  final double dheight;
  final double dwidth;
  final String textleft;
  final String textright;
  final double textleftfontsize;
  final double textrightfontsize;
  ProfileDataHead(
      {required this.dheight,
      required this.dwidth,
      required this.textleft,
      required this.textright,
      required this.textleftfontsize,
      required this.textrightfontsize});
  @override
  Widget build(BuildContext context) {
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
              style: TextStyle(fontSize: textleftfontsize),
            ),
            Expanded(
              child: Text(textright,
                  style:
                      TextStyle(fontSize: textrightfontsize, color: Colors.red),
                  textAlign: TextAlign.right),
            ),
          ],
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////
class ProfileDataTab extends StatelessWidget {
  final double dheight;
  final double dwidth;
  final String textleft;
  final String textright;

  ProfileDataTab(
      {required this.dheight,
      required this.dwidth,
      required this.textleft,
      required this.textright});

  @override
  Widget build(BuildContext context) {
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
              textleft,
              style: TextStyle(fontSize: 18),
            ),
            Expanded(
                child: Text(
              textright,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.right,
            )),
          ],
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////
class ProfileContactTab extends StatelessWidget {
  final Widget iconcontact;
  final String textcontact;
  ProfileContactTab({required this.iconcontact, required this.textcontact});
  @override
  Widget build(BuildContext context) {
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
                child: Text(
              textcontact,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.right,
            )),
          ],
        ),
      ),
    );
  }
}
////////////////////////////////////////////////////////////////////////////////////
class ProfileCareerDropdownTab extends StatefulWidget {
  final String textleft;
  final String itemvalue;
  final List<String> careeritem;
  const ProfileCareerDropdownTab({Key? key, required this.textleft, required this.itemvalue, required this.careeritem}) : super(key: key);

  @override
  State<ProfileCareerDropdownTab> createState() => _ProfileCareerDropdownTabState();
}

class _ProfileCareerDropdownTabState extends State<ProfileCareerDropdownTab> {

  @override
  Widget build(BuildContext context) {
    String textleft = widget.textleft;
    String? itemvalue = widget.itemvalue;
    List<String> careeritem = widget.careeritem;
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
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                textleft,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Expanded(
                child: SizedBox(
                  child: DropdownButtonFormField<String>(
                    alignment: Alignment.centerRight,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    value: itemvalue,
                    items: careeritem.map(
                            (item) => DropdownMenuItem<String>(value: item, child: Text(item)
                        )).toList(),
                    onChanged: (item) => setState(() => itemvalue = item),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}


// DropdownButton<String>(
// value: attentionsvalue,
// items: attentionsitems.map(
// (item) => DropdownMenuItem<String>(value: item, child: Text(item)
// )).toList(),
// onChanged: (item) => setState(() => attentionsvalue = item),
// )