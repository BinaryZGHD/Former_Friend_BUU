
import 'package:f2fbuu/module/profile/model/response/api_profile.dart';
import 'package:flutter/material.dart';

class ProfileAttentionDropdownTab extends StatefulWidget {
  final List<Attention> attentionarray;
  final String textleft;
  final String userattentionvalue;
  final bool isunpressed;
  const ProfileAttentionDropdownTab(
      {Key? key,
        required this.textleft,
        required this.userattentionvalue,
        required this.attentionarray,
        required this.isunpressed})
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
    String? userattentionvalue = widget.userattentionvalue;
    var isunpressed = widget.isunpressed;
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
                child: IgnorePointer(
                  ignoring: isunpressed,

                  child: DropdownButtonFormField<String>(
                    // alignment: Alignment.centerRight,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    value: userattentionvalue,
                    items: widget.attentionarray
                        .map((item) => DropdownMenuItem<String>(
                        value: item.attenname, child: Text(item.attenname??'',textAlign: TextAlign.right,)))
                        .toList(),
                    onChanged: (item) => setState(() => userattentionvalue = item),
                  ),

                  // DropdownButtonFormField<String>(
                  //   // alignment: Alignment.centerRight,
                  //   decoration: InputDecoration(
                  //     border: InputBorder.none,
                  //   ),
                  //   value: userattentionvalue,
                  //   items: widget.testarray
                  //       .map((item) => DropdownMenuItem<String>(
                  //       value: item.attenname, child: Text(item.attenname??'', overflow: TextOverflow.fade,
                  //       softWrap: false)))
                  //       .toList(),
                  //   onChanged: (item) => setState(() => userattentionvalue = item),
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}