import 'package:flutter/material.dart';

class ProfileContactDataTab extends StatefulWidget {
  final Widget iconcontact;
  final String textcontact;
  bool istffreadonly = true;
  ProfileContactDataTab({Key? key, required this.iconcontact, required this.textcontact}) : super(key: key);

  @override
  State<ProfileContactDataTab> createState() => _ProfileContactDataTabState();
}

class _ProfileContactDataTabState extends State<ProfileContactDataTab> {
  @override
  Widget build(BuildContext context) {
    Widget iconcontact = widget.iconcontact;
    String textcontact = widget.textcontact;
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
            iconcontact,
            Expanded(
              child: Container(
                child: TextFormField(
                  readOnly: istffreadonly,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  initialValue: textcontact,
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


