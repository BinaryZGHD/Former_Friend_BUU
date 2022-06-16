import 'package:flutter/material.dart';

class ProfileAttentionDropdownTab extends StatefulWidget {
  final String textleft;
  final String itemvalue;
  final List<String> careeritem;

  const ProfileAttentionDropdownTab(
      {Key? key,
        required this.textleft,
        required this.itemvalue,
        required this.careeritem})
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
class ProfileCareerDataTab extends StatefulWidget {
  final String textleft;
  final String textright;
  bool istffreadonly = true;
  ProfileCareerDataTab({Key? key, required this.textleft, required this.textright}) : super(key: key);

  @override
  State<ProfileCareerDataTab> createState() => _ProfileCareerDataTabState();
}

class _ProfileCareerDataTabState extends State<ProfileCareerDataTab> {
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
              ProfileDropdownCareerDataTab(
                jobitemvalue: widget.jobitemvalue,
                jobtextleft: widget.jobtextleft,
                jobitem: widget.jobitem,
              ),
              ProfileCareerDataTab(
                  textleft: 'สถานที่ทำงาน',
                  textright: 'BUU'),
              ProfileCareerDataTab(
                  textleft: 'อาชีพ',
                  textright: 'นักศึกษา'),
              ProfileCareerDataTab(
                  textleft: 'บริษัท',
                  textright: 'ม.บูรพา จำกัด')
            ],
          ),
        )
      ],
    );
  }
}