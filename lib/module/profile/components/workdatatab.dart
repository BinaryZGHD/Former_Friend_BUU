
import 'package:f2fbuu/module/profile/components/careerdatatab.dart';
import 'package:f2fbuu/module/profile/components/hiddencareerdatatab.dart';
import 'package:f2fbuu/module/profile/model/response/api_profile.dart';
import 'package:flutter/material.dart';

class ProfileCareerDropdownTab extends StatefulWidget {
  final List<Status> statusarray;
  final String textleft;
  final String userstatusvalue;
  final String jobtextleft;
  final String userjobvalue;
  final List<Jobtype> jobtypearray;
  final bool ispressed;
  final String subtitleworkplace;
  final String userworkplace;
  final String usercareer;
  final String usercompany;
  final String textcareer;
  final String textcomp;
  const ProfileCareerDropdownTab(
      {Key? key,
        required this.textleft,
        required this.userstatusvalue,
        required this.jobtextleft,
        required this.jobtypearray,
        required this.userjobvalue,
        required this.ispressed,
        required this.subtitleworkplace,
        required this.userworkplace,
        required this.usercareer,
        required this.usercompany,
        required this.textcareer,
        required this.textcomp,
        required this.statusarray})
      : super(key: key);

  @override
  State<ProfileCareerDropdownTab> createState() =>
      _ProfileCareerDropdownTabState();
}

class _ProfileCareerDropdownTabState extends State<ProfileCareerDropdownTab> {
  late String textleft;
  late String? itemvalue;
  bool isJobInStatusVisible = false;


  @override
  void initState() {
    textleft = widget.textleft;
    itemvalue = widget.userstatusvalue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool ispressed = widget.ispressed;
    String subtitleworkplace = widget.subtitleworkplace;
    String userworkplace = widget.userworkplace;
    String usercareer = widget.usercareer;
    String usercompany = widget.usercompany;
    String textcareer = widget.textcareer;
    String textcomp = widget.textcomp;


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
                      items: widget.statusarray
                          .map((item) => DropdownMenuItem<String>(
                          value: item.statusname, child: Text(item.statusname??'')))
                          .toList(),
                      onChanged: (item) {
                        itemvalue = item;
                        if (itemvalue == 'มีงานทำ') {
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
                userjobtypevalue: widget.userjobvalue,
                jobtextleft: widget.jobtextleft,
                jobtypearray: widget.jobtypearray,
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
