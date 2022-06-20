import 'package:f2fbuu/module/profile/bloc/profiledata.dart';
import 'package:f2fbuu/module/profile/components/careerdatatab.dart';
import 'package:f2fbuu/module/profile/components/hiddencareerdatatab.dart';
import 'package:flutter/material.dart';

class ProfileCareerDropdownTab extends StatefulWidget {
  final String textleft;
  final String statusitemvalue;
  final String jobtextleft;
  final String jobitemvalue;
  final List<dynamic> jobitem;
  final bool ispressed;
  final List<dynamic> status;
  final String subtitleworkplace;
  final String userworkplace;
  final String usercareer;
  final String usercompany;
  final String textcareer;
  final String textcomp;
  const ProfileCareerDropdownTab(
      {Key? key,
        required this.textleft,
        required this.statusitemvalue,
        required this.jobtextleft,
        required this.jobitem,
        required this.jobitemvalue,
        required this.ispressed,
        required this.status,
        required this.subtitleworkplace,
        required this.userworkplace,
        required this.usercareer,
        required this.usercompany,
        required this.textcareer,
        required this.textcomp})
      : super(key: key);

  @override
  State<ProfileCareerDropdownTab> createState() =>
      _ProfileCareerDropdownTabState();
}

class _ProfileCareerDropdownTabState extends State<ProfileCareerDropdownTab> {
  late String textleft;
  late String? itemvalue;
  late List<dynamic> status = widget.status;
  bool isJobInStatusVisible = false;


  @override
  void initState() {
    textleft = widget.textleft;
    itemvalue = widget.statusitemvalue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool ispressed = widget.ispressed;
    String texttest = 'testtesttest';
    String subtitleworkplace = widget.subtitleworkplace;
    String userworkplace = widget.userworkplace;
    String usercareer = widget.usercareer;
    String usercompany = widget.usercompany;
    String textcareer = widget.textcareer;
    String textcomp = widget.textcomp;
    List<dynamic> status = widget.status;
    List<String> listapistatusitems = [status[0]['statusname'],status[1]['statusname'],status[2]['statusname'],status[3]['statusname']];
    print(listapistatusitems);


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
                      value: listapistatusitems[0],
                      items: listapistatusitems
                          .map((item) => DropdownMenuItem<String>(
                          value: item, child: Text(item)))
                          .toList(),
                      onChanged: (item) {
                        itemvalue = item;
                        if (itemvalue == listapistatusitems[3]) {
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
                  textleft: subtitleworkplace,
                  textright: userworkplace),
              ProfileCareerDataTab(
                  ispressed: ispressed,
                  textleft: textcareer,
                  textright: usercareer),
              ProfileCareerDataTab(
                  ispressed: ispressed,
                  textleft: textcomp,
                  textright: usercompany)
            ],
          ),
        )
      ],
    );
  }
}
////////////////////////////////////////////////////////////////////////////////
