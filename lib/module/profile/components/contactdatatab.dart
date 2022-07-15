import 'package:f2fbuu/module/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfileContactDataHead extends StatefulWidget {
  final dataFromAPI;
  ProfileContactDataHead({Key? key, required this.dataFromAPI})
      : super(key: key);

  @override
  State<ProfileContactDataHead> createState() => _ProfileContactDataHeadState();
}

class _ProfileContactDataHeadState extends State<ProfileContactDataHead> {
  bool isUnpressed = true;
  @override
  Widget build(BuildContext context) {
    var dataFromAPI = widget.dataFromAPI;
    String phoneValue ="";
    String lineValue ="";
    String facebookValue ="";
    String instagramValue ="";
    String twitterValue ="";
    String youtubeValue ="";
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(width: 1, color: Colors.black12),
                bottom: BorderSide(width: 1, color: Colors.transparent)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  '${dataFromAPI.body?.screeninfo?.subtitlecont}',
                  style: TextStyle(fontSize: 20),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isUnpressed = !isUnpressed;
                          if (isUnpressed == true) {
                            context.read<ProfileBloc>().add(ContactSubmitEvent(
                                instragram: instagramValue,
                                twitter: twitterValue,
                                youtube: youtubeValue,
                                facebook: facebookValue,
                                line: lineValue,
                                phone: phoneValue));
                          }
                          ;
                        });
                        // setState((){
                        //   if (ispressed == true) {
                        //     editorsave = 'บันทึก';
                        //   } else {
                        //     editorsave = 'แก้ไข';
                        //   }
                        //   print(ispressed);
                        // });
                        // }, child: Text(editorsave,
                      },
                      child: isUnpressed
                          ? Text('แก้ไข', style: TextStyle(color: Colors.red))
                          : Text('บันทึก',
                              style: TextStyle(color: Colors.green)),
                    ),
                  ),

                  // Text(editorsave,
                  //       style:
                  //       TextStyle(fontSize: 18, color: Colors.red),
                  //       textAlign: TextAlign.right),
                ),
              ],
            ),
          ),
        ),
        ProfileContactDataTab(
          isUnpressed: isUnpressed,
          iconContact: Icon(
            Icons.phone,
            color: HexColor('#000000'),
          ),
          textContact: '${dataFromAPI?.body?.profileContactInfo?.phone}',
          keyboardType: TextInputType.numberWithOptions(),
          onChange: (value) {
            phoneValue = value;
            print(phoneValue);
          },
        ),
        ProfileContactDataTab(
            isUnpressed: isUnpressed,
            iconContact: Icon(
              FontAwesomeIcons.line,
              color: HexColor('#00B900'),
            ),
            textContact: '${dataFromAPI?.body?.profileContactInfo?.line}',
          onChange: (value) {
            lineValue = value;
            print(lineValue);
          },),
        ProfileContactDataTab(
            isUnpressed: isUnpressed,
            iconContact: Icon(
              FontAwesomeIcons.facebook,
              color: HexColor('#3B5998'),
            ),
            textContact: '${dataFromAPI?.body?.profileContactInfo?.facebook}',
          onChange: (value) {
            facebookValue = value;
            print(facebookValue);
          },),
        ProfileContactDataTab(
            isUnpressed: isUnpressed,
            iconContact: Icon(
              FontAwesomeIcons.instagram,
              color: HexColor('#E1306C'),
            ),
            textContact: '${dataFromAPI?.body?.profileContactInfo?.instagram}',
          onChange: (value) {
            instagramValue = value;
            print(instagramValue);
          },),
        ProfileContactDataTab(
            isUnpressed: isUnpressed,
            iconContact: Icon(
              FontAwesomeIcons.twitter,
              color: HexColor('#00acee'),
            ),
            textContact: '${dataFromAPI?.body?.profileContactInfo?.twitter}',
          onChange: (value) {
            twitterValue = value;
            print(twitterValue);
          },),
        ProfileContactDataTab(
            isUnpressed: isUnpressed,
            iconContact: Icon(
              FontAwesomeIcons.youtube,
              color: HexColor('#FF0000'),
            ),
            textContact: '${dataFromAPI?.body?.profileContactInfo?.youtube}',
          onChange: (value) {
            youtubeValue = value;
            print(youtubeValue);
          },),
      ],
    );
  }
}

//////
class ProfileContactDataTab extends StatefulWidget {
  final Widget iconContact;
  final String textContact;
  final bool isUnpressed;
  final ValueChanged<String>? onChange;
  final keyboardType;
  ProfileContactDataTab(
      {Key? key,
      required this.iconContact,
      required this.textContact,
      required this.isUnpressed,
      this.keyboardType,
      this.onChange})
      : super(key: key);

  @override
  State<ProfileContactDataTab> createState() => _ProfileContactDataTabState();
}

class _ProfileContactDataTabState extends State<ProfileContactDataTab> {
  @override
  Widget build(BuildContext context) {
    Widget iconContact = widget.iconContact;
    String textContact = widget.textContact;
    bool isUnpressed = widget.isUnpressed;
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
            iconContact,
            Expanded(
              child: Container(
                child: TextFormField(
                  keyboardType: widget.keyboardType,
                  readOnly: isUnpressed,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  onChanged: widget.onChange,
                  initialValue: textContact,
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
