import 'package:f2fbuu/module/profile/model/response/api_profile.dart';
import 'package:flutter/material.dart';

class ProfileDropdownCareerDataTab extends StatefulWidget {
  final String jobtextleft;
  final String userjobtypevalue;
  final List<Jobtype> jobtypearray;

  const ProfileDropdownCareerDataTab(
      {Key? key,
        required this.jobtextleft,
        required this.userjobtypevalue,
        required this.jobtypearray})
      : super(key: key);

  @override
  State<ProfileDropdownCareerDataTab> createState() =>
      _ProfileDropdownCareerDataTabState();
}

class _ProfileDropdownCareerDataTabState
    extends State<ProfileDropdownCareerDataTab> {
  @override
  Widget build(BuildContext context) {
    String? userjobtypevalue = widget.userjobtypevalue;
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
              width: MediaQuery.of(context).size.width * 0.4,
              child: Text(
                widget.jobtextleft,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Expanded(
              child: DropdownButtonFormField<String>(
                // alignment: Alignment.centerRight,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                value: userjobtypevalue,
                items: widget.jobtypearray
                    .map((item) => DropdownMenuItem<String>(
                    value: item.jobname, child: Text(item.jobname??'')))
                    .toList(),
                onChanged: (item) => setState(() => userjobtypevalue = item),
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
  final bool isunpressed ;
  ProfileCareerDataTab({Key? key, required this.textleft, required this.textright, required this.isunpressed}) : super(key: key);

  @override
  State<ProfileCareerDataTab> createState() => _ProfileCareerDataTabState();
}

class _ProfileCareerDataTabState extends State<ProfileCareerDataTab> {
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
