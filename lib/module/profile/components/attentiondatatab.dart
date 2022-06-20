import 'package:f2fbuu/model/profilemodel/profilescreeninfoapi/profilescreeninfoapi.dart';
import 'package:f2fbuu/module/profile/bloc/profiledata.dart';
import 'package:flutter/material.dart';

class ProfileAttentionDropdownTab extends StatefulWidget {
  final List<Attention> testarray;
  final String textleft;
  // final String itemvalue;
  final String userattentionvalue;
  // final List<String> attention;
  const ProfileAttentionDropdownTab(
      {Key? key,
        required this.textleft,
        // required this.itemvalue,
        // required this.attention,
        required this.userattentionvalue,
        required this.testarray})
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
    // String? itemvalue = widget.itemvalue;
    String? userattentionvalue = widget.userattentionvalue;
    // List<String> attention = widget.attention;
    // List<String> listapiattentionitems = [attention[0]['attenname'],attention[1]['attenname'],attention[2]['attenname'],attention[3]['attenname'],attention[4]['attenname']];
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
                  value: userattentionvalue,
                  items: widget.testarray
                      .map((item) => DropdownMenuItem<String>(
                      value: item.attenname, child: Text(item.attenname??'')))
                      .toList(),
                  onChanged: (item) => setState(() => userattentionvalue = item),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}