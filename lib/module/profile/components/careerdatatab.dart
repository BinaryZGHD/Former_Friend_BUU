import 'package:flutter/material.dart';
import 'package:f2fbuu/module/profile/bloc/profiledata.dart';
class ProfileCareerDataHead extends StatefulWidget {

  ProfileCareerDataHead({Key? key}) : super(key: key);

  @override
  State<ProfileCareerDataHead> createState() => _ProfileCareerDataHeadState();
}
////////////////////////////////////////////////////////////////////////////////
class _ProfileCareerDataHeadState extends State<ProfileCareerDataHead> {
  bool ispressed = true;
  final attentionsitems = ['', 'คอมพิวเตอร์ ', 'ครู', 'ประกันภัย', 'สถิติ'];
  late String attentionsvalue = '';
  final statusitems = ['', 'ศึกษาต่อ', 'ว่างงาน', 'มีงานทำ'];
  late String statusvalue = '';
  final jobtypeitems = ['', '1', '2', '3'];
  late String jobtypevalue = '';
  bool isVisible = true;
  var apiscreeninfo = api['body']['screeninfo'];
  var apiprofile_career_info = api['body']['profile_career_info'];
  var apiattenionitems = api['body']['profile_career_info']['attention'];
  // var apiattenionitemszero = api['body']['profile_career_info']['attention'][0]['attenname'];
  // var apiattenionitemsone = api['body']['profile_career_info']['attention'][1]['attenname'];
  // var apiattenionitemstwo = api['body']['profile_career_info']['attention'][2]['attenname'];
  // var apiattenionitemsthree = api['body']['profile_career_info']['attention'][3]['attenname'];
  // var listapiattentionitems = [apiattenionitemszero, apiattenionitemsone, apiattenionitemstwo, apiattenionitemsthree];
  @override
  Widget build(BuildContext context) {
    // print(apiattenionitems);
    // List.generate(apiattenionitems.length, (index) => null);
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
                  apiscreeninfo['subtitleworkinfo'],
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
        ProfileAttentionDropdownTab(
          arai : apiattenionitems,
          textleft: apiscreeninfo['textatt'],
          careeritem: attentionsitems,
          itemvalue: attentionsvalue,
        ),
        ProfileCareerDropdownTab(
          ispressed: ispressed,
          textleft: 'สถานะ',
          careeritem: statusitems,
          itemvalue: statusvalue,
          jobitemvalue: jobtypevalue,
          jobtextleft: 'ประเภทงาน',
          jobitem: jobtypeitems,
        ),
      ],
    );
  }
}
////////////////////////////////////////////////////////////////////////////////
class ProfileAttentionDropdownTab extends StatefulWidget {
  final String textleft;
  final String itemvalue;
  final List<String> careeritem;
  final List<dynamic> arai;
  const ProfileAttentionDropdownTab(
      {Key? key,
        required this.textleft,
        required this.itemvalue,
        required this.careeritem, required this.arai})
      : super(key: key);

  @override
  State<ProfileAttentionDropdownTab> createState() =>
      _ProfileAttentionDropdownTabState();
}

class _ProfileAttentionDropdownTabState
    extends State<ProfileAttentionDropdownTab> {
  @override
  Widget build(BuildContext context) {
    String textleft = widget.textleft;
    String? itemvalue = widget.itemvalue;
    List<String> careeritem = widget.careeritem;
    List<dynamic> arai = widget.arai;
    List<String> listapiattentionitems = [arai[0]['attenname'],arai[1]['attenname'],arai[2]['attenname'],arai[3]['attenname'],arai[4]['attenname']];
    print(listapiattentionitems);
    print(careeritem);
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
                  value: listapiattentionitems[0],
                  items: listapiattentionitems
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
class ProfileCareerDataTab extends StatefulWidget {
  final String textleft;
  final String textright;
  final bool ispressed ;
  ProfileCareerDataTab({Key? key, required this.textleft, required this.textright, required this.ispressed}) : super(key: key);

  @override
  State<ProfileCareerDataTab> createState() => _ProfileCareerDataTabState();
}

class _ProfileCareerDataTabState extends State<ProfileCareerDataTab> {
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
                  readOnly: ispressed,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      texttest = value;
                      // print(texttest);
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
////////////////////////////////////////////////////////////////////////////////
class ProfileCareerDropdownTab extends StatefulWidget {
  final String textleft;
  final String itemvalue;
  final List<String> careeritem;
  final String jobtextleft;
  final String jobitemvalue;
  final List<String> jobitem;
  final bool ispressed;

  const ProfileCareerDropdownTab(
      {Key? key,
        required this.textleft,
        required this.itemvalue,
        required this.careeritem,
        required this.jobtextleft,
        required this.jobitem,
        required this.jobitemvalue,
        required this.ispressed})
      : super(key: key);

  @override
  State<ProfileCareerDropdownTab> createState() =>
      _ProfileCareerDropdownTabState();
}

class _ProfileCareerDropdownTabState extends State<ProfileCareerDropdownTab> {
  late String textleft;
  late String? itemvalue;
  late List<String> careeritem;
  bool isJobInStatusVisible = false;


  @override
  void initState() {
    textleft = widget.textleft;
    itemvalue = widget.itemvalue;
    careeritem = widget.careeritem;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool ispressed = widget.ispressed;
    String texttest = 'testtesttest';

    print('$itemvalue');
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
              ProfileDropdownCareerDataTab(
                jobitemvalue: widget.jobitemvalue,
                jobtextleft: widget.jobtextleft,
                jobitem: widget.jobitem,
              ),
              ProfileCareerDataTab(
                ispressed: ispressed,
                  textleft: 'สถานที่ทำงาน',
                  textright: 'BUU'),
              ProfileCareerDataTab(
                  ispressed: ispressed,
                  textleft: 'อาชีพ',
                  textright: 'นักศึกษา'),
              ProfileCareerDataTab(
                  ispressed: ispressed,
                  textleft: 'บริษัท',
                  textright: 'ม.บูรพา จำกัด')
            ],
          ),
        )
      ],
    );
  }
}