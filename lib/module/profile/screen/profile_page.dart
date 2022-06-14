import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final attentionsitems = ['', 'คอมพิวเตอร์ ', 'ครู', 'ประกันภัย', 'สถิติ'];
  late String attentionsvalue = '';
  final statusitems = ['', 'ศึกษาต่อ', 'ว่างงาน', 'มีงานทำ'];
  late String statusvalue = '';
  final jobtypeitems = ['', '1', '2', '3'];
  late String jobtypevalue = '';
  bool isVisible = true;

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
                fontSize: 24,
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
              textleft: 'ข้อมูลทั่วไป',
              textright: 'แก้ไข',
              textleftfontsize: 20,
              textrightfontsize: 18,
            ),
            ProfileDataTab(
              textleft: 'ชื่อ',
              textright: 'ผู้ใช้งาน',
            ),
            ProfileDataTab(
                textleft: 'นามสกุล',
                textright: 'แอปพลิเคชัน'),
            ProfileDataTab(
                textleft: 'ชื่อเล่น',
                textright: 'แมท'),
            ProfileDataTab(
                textleft: 'รหัสนิสิต',
                textright: '62030xxx'),
            ProfileDataTab(
                textleft: 'รุ่น',
                textright: '65'),
            ProfileDataTab(
                textleft: 'โทร',
                textright: '0123456789'),
            ProfileDataHead(
                textleft: 'ข้อมูลการศึกษา',
                textright: 'แก้ไข',
                textleftfontsize: 20,
                textrightfontsize: 18),
            ProfileDataTab(
                textleft: 'คณะ',
                textright: 'วิทยาศาสตร์'),
            ProfileDataTab(
                textleft: 'ภาควิชา',
                textright: 'คณิตศาสตร์'),
            ProfileDataTab(
                textleft: 'สาขาวิชา',
                textright: 'คณิตศาสตร์'),
            ProfileDataTab(
                textleft: 'เกรดเฉลี่ย (ระดับมัธยมต้น)',
                textright: '4.00'),
            ProfileDataTab(
                textleft: 'เกรดเฉลี่ย (ระดับมัธยมปลาย)',
                textright: '3.55'),
            ProfileDataTab(
                textleft: 'เกรดเฉลี่ย (ระดับอนุปริญญา)',
                textright: '2.99'),
            ProfileDataHead(
                textleft: 'ข้อมูลที่อยู่ ',
                textright: 'แก้ไข',
                textleftfontsize: 20,
                textrightfontsize: 18),
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
                textleft: 'ข้อมูลติดต่อ',
                textright: 'แก้ไข',
                textleftfontsize: 20,
                textrightfontsize: 18),
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
                textleft: 'ข้อมูลอาชีพ',
                textright: 'แก้ไข',
                textleftfontsize: 20,
                textrightfontsize: 18),
            ProfileDropdownAttentionTab(
              textleft: 'ความสนใจ',
              careeritem: attentionsitems,
              itemvalue: attentionsvalue,
            ),
            ProfileCareerDropdownTab(
              textleft: 'สถานะ',
              careeritem: statusitems,
              itemvalue: statusvalue,
              jobitemvalue: jobtypevalue,
              jobtextleft: 'ประเภทงาน',
              jobitem: jobtypeitems,
            ),
            // if (statusvalue == 'มีงานทำ'){
            //   isVisible = true;
            // } else {
            //   isVisible = false;
            // };
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
class ProfileDataHead extends StatelessWidget {
  final String textleft;
  final String textright;
  final double textleftfontsize;
  final double textrightfontsize;

  ProfileDataHead(
      {
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
              child: GestureDetector(
                onTap: () {
                  print('กดแก้ไข');
                },
                child: Text(textright,
                    style:
                        TextStyle(fontSize: textrightfontsize, color: Colors.red),
                    textAlign: TextAlign.right),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
class ProfileDataTab extends StatelessWidget {
  final String textleft;
  final String textright;

  ProfileDataTab(
      {
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
                  child: GestureDetector(
                    child: Text(
              textright,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.right,
            ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
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

////////////////////////////////////////////////////////////////////////////////
class ProfileDropdownAttentionTab extends StatefulWidget {
  final String textleft;
  final String itemvalue;
  final List<String> careeritem;

  const ProfileDropdownAttentionTab(
      {Key? key,
      required this.textleft,
      required this.itemvalue,
      required this.careeritem})
      : super(key: key);

  @override
  State<ProfileDropdownAttentionTab> createState() =>
      _ProfileDropdownAttentionTabState();
}

class _ProfileDropdownAttentionTabState
    extends State<ProfileDropdownAttentionTab> {
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
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                textleft,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: DropdownButtonFormField<String>(
                  // alignment: Alignment.centerRight,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  value: itemvalue,
                  items: careeritem
                      .map((item) => DropdownMenuItem<String>(
                          value: item, child: Text(item)))
                      .toList(),
                  onChanged: (item) => setState(() => itemvalue = item),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
class ProfileDropdownCareerDataTab extends StatefulWidget {
  final String jobtextleft;
  final String jobitemvalue;
  final List<String> jobitem;

  const ProfileDropdownCareerDataTab(
      {Key? key,
      required this.jobtextleft,
      required this.jobitemvalue,
      required this.jobitem})
      : super(key: key);

  @override
  State<ProfileDropdownCareerDataTab> createState() =>
      _ProfileDropdownCareerDataTabState();
}

class _ProfileDropdownCareerDataTabState
    extends State<ProfileDropdownCareerDataTab> {
  @override
  Widget build(BuildContext context) {
    String textleft = widget.jobtextleft;
    String? itemvalue = widget.jobitemvalue;
    List<String> careeritem = widget.jobitem;
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
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                textleft,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: DropdownButtonFormField<String>(
                  // alignment: Alignment.centerRight,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  value: itemvalue,
                  items: careeritem
                      .map((item) => DropdownMenuItem<String>(
                          value: item, child: Text(item)))
                      .toList(),
                  onChanged: (item) => setState(() => itemvalue = item),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
class ProfileCareerDropdownTab extends StatefulWidget {
  final String textleft;
  final String itemvalue;
  final List<String> careeritem;
  final String jobtextleft;
  final String jobitemvalue;
  final List<String> jobitem;

  const ProfileCareerDropdownTab(
      {Key? key,
      required this.textleft,
      required this.itemvalue,
      required this.careeritem,
      required this.jobtextleft,
      required this.jobitem,
      required this.jobitemvalue})
      : super(key: key);

  @override
  State<ProfileCareerDropdownTab> createState() =>
      _ProfileCareerDropdownTabState();
}

class _ProfileCareerDropdownTabState extends State<ProfileCareerDropdownTab> {
  late String textleft;
  late String? itemvalue;
  late List<String> careeritem;
  bool isJobInStatusVisible = true;

  @override
  void initState() {
    textleft = widget.textleft;
    itemvalue = widget.itemvalue;
    careeritem = widget.careeritem;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('aaa = ' + '$itemvalue');
    return Column(
      children: [
        Container(
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
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    textleft,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: DropdownButtonFormField<String>(
                      // alignment: Alignment.centerRight,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      value: itemvalue,
                      items: careeritem
                          .map((item) => DropdownMenuItem<String>(
                              value: item, child: Text(item)))
                          .toList(),
                      onChanged: (item) {
                        itemvalue = item;
                        if (itemvalue == careeritem[3]) {
                          isJobInStatusVisible = true;
                        } else {
                          isJobInStatusVisible = false;
                        }
                        setState(() {});
                        print(item);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: isJobInStatusVisible,
          child: Column(
            children: [
              ProfileDataTab(
                  textleft: 'สถานที่ทำงาน',
                  textright: 'BUU'),
              ProfileDropdownCareerDataTab(
                jobitemvalue: widget.jobitemvalue,
                jobtextleft: widget.jobtextleft,
                jobitem: widget.jobitem,
              ),
              ProfileDataTab(
                  textleft: 'อาชีพ',
                  textright: 'นักศึกษา'),
              ProfileDataTab(
                  textleft: 'บริษัท',
                  textright: 'ม.บูรพา จำกัด')
            ],
          ),
        )
      ],
    );
  }
}
