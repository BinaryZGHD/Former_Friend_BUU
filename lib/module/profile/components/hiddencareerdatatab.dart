import 'package:flutter/material.dart';

class ProfileDropdownCareerDataTab extends StatefulWidget {
  final String jobtextleft;
  final String jobitemvalue;
  final List<dynamic> jobitem;

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
    String? jobitemvalue = widget.jobitemvalue;
    List jobitem = widget.jobitem;
    List<String> listapijobitems = [jobitem[0]['jobname'],jobitem[1]['jobname'],jobitem[2]['jobname'],jobitem[3]['jobname']];
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
                  value: jobitemvalue,
                  items: listapijobitems
                      .map((item) => DropdownMenuItem<String>(
                      value: item, child: Text(item)))
                      .toList(),
                  onChanged: (item) => setState(() => jobitemvalue = item),
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
