
import 'dart:ffi';

import 'package:f2fbuu/module/profile/model/response/api_profile.dart';
import 'package:flutter/material.dart';

class ProfileAttentionDropdownTab extends StatefulWidget {
  final List<Attention> attentionArray;
  final String textLeft;
  final String userAttentionValue;
  final bool isUnpressed;
  final Function(String attentionResult) callbackFromAttentionDataTab;
  const ProfileAttentionDropdownTab(
      {Key? key,
        required this.textLeft,
        required this.userAttentionValue,
        required this.attentionArray,
        required this.isUnpressed,
        required this.callbackFromAttentionDataTab})
      : super(key: key);

  @override
  State<ProfileAttentionDropdownTab> createState() =>
      _ProfileAttentionDropdownTabState();
}


class _ProfileAttentionDropdownTabState
    extends State<ProfileAttentionDropdownTab> {
  String? userattentionvalue;
  @override
  void initState(){
    userattentionvalue = widget.userAttentionValue;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String textleft = widget.textLeft;

    var isunpressed = widget.isUnpressed;
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
                  child:
                  PopupMenuButton<String>(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Text(
                                userattentionvalue??'',
                                style: const TextStyle(color: Colors.black),
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              )),
                          const Icon(Icons.keyboard_arrow_down)
                        ]),
                    itemBuilder: (context) {
                      return List.generate(widget.attentionArray.length,
                              (index) {
                            return PopupMenuItem(
                              child:
                              Text(widget.attentionArray[index].attenname ?? ''),
                              value: widget.attentionArray[index].attenname,
                            );
                          });
                    },
                    onSelected: (value) {
                      setState(() {
                        userattentionvalue = value;
                        widget.callbackFromAttentionDataTab(userattentionvalue??"-");
                      });
                    },


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