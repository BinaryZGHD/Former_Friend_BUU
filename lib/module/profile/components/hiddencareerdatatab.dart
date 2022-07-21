import 'package:f2fbuu/module/profile/model/response/api_profile.dart';
import 'package:flutter/material.dart';

class ProfileDropdownCareerDataTab extends StatefulWidget {
  final String jobTextLeft;
  final String userJobTypeValue;
  final List<Jobtype> jobTypeArray;
  final bool isUnpressed;
  final Function(String? jobtype) callbackHiddenCareerDataTab;
  const ProfileDropdownCareerDataTab(
      {Key? key,
        required this.jobTextLeft,
        required this.userJobTypeValue,
        required this.jobTypeArray, required this.isUnpressed,
        required this.callbackHiddenCareerDataTab
      })
      : super(key: key);

  @override
  State<ProfileDropdownCareerDataTab> createState() =>
      _ProfileDropdownCareerDataTabState();
}

class _ProfileDropdownCareerDataTabState
    extends State<ProfileDropdownCareerDataTab> {
  String? userJobTypeValue;
  @override
  void initState(){
    userJobTypeValue = widget.userJobTypeValue;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    bool isUnpressed = widget.isUnpressed;
    return Container(
      decoration: const BoxDecoration(
        border: Border(
            top: BorderSide(width: 1, color: Colors.black12),
            bottom: BorderSide(width: 1, color: Colors.black12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                widget.jobTextLeft,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: IgnorePointer(
                  ignoring: isUnpressed,
                  child:
                  PopupMenuButton<String>(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Text(
                                userJobTypeValue??'',
                                style: const TextStyle(color: Colors.black),
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              )),
                          const Icon(Icons.keyboard_arrow_down)
                        ]),
                    itemBuilder: (context) {
                      return List.generate(widget.jobTypeArray.length,
                              (index) {
                            return PopupMenuItem(
                              value: widget.jobTypeArray[index].jobname,
                              child:
                              Text(widget.jobTypeArray[index].jobname ?? ''),
                            );
                          });
                    },
                    onSelected: (value) {

                      setState(() {
                        userJobTypeValue = value;
                        widget.callbackHiddenCareerDataTab(userJobTypeValue);
                      });
                    },
                  ),
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
  final String textLeft;
  final String textRight;
  final bool isUnpressed;
  final Function(String result) callbackFromHiddenCareerDataTab;

  const ProfileCareerDataTab({Key? key, required this.textLeft, required this.textRight, required this.isUnpressed,required this.callbackFromHiddenCareerDataTab,}) : super(key: key);

  @override
  State<ProfileCareerDataTab> createState() => _ProfileCareerDataTabState();
}

class _ProfileCareerDataTabState extends State<ProfileCareerDataTab> {
  @override
  Widget build(BuildContext context) {
    String textLeft = widget.textLeft;
    String textRight = widget.textRight;
    bool isUnpressed = widget.isUnpressed;
    String userValue = '';
    return Container(
      decoration: const BoxDecoration(
        border: Border(
            top: BorderSide(width: 1, color: Colors.black12),
            bottom: BorderSide(width: 1, color: Colors.black12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Text(
              '$textLeft ',
              style: const TextStyle(fontSize: 18),
            ),
            Expanded(
              child: TextFormField(
                readOnly: isUnpressed,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    userValue = value;
                    widget.callbackFromHiddenCareerDataTab(userValue);
                  });
                },
                initialValue: textRight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
////////////////////////////////////////////////////////////////////////////////
