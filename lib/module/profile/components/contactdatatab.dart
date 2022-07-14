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
  bool isunpressed = true;
  @override
  Widget build(BuildContext context) {
    var dataFromAPI = widget.dataFromAPI;
    String phonevalue ="";
    String linevalue ="";
    String facebookvalue ="";
    String instagramvalue ="";
    String twittervalue ="";
    String youtubevalue ="";
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
                          isunpressed = !isunpressed;
                          if (isunpressed == true) {
                            context.read<ProfileBloc>().add(ContactSubmitEvent(
                                instragram: instagramvalue,
                                twitter: twittervalue,
                                youtube: youtubevalue,
                                facebook: facebookvalue,
                                line: linevalue,
                                phone: phonevalue,
                                token: 'demotoken'));
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
                      child: isunpressed
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
          isunpressed: isunpressed,
          iconcontact: Icon(
            Icons.phone,
            color: HexColor('#000000'),
          ),
          textcontact: '${dataFromAPI?.body?.profileContactInfo?.phone}',
          keyboardtype: TextInputType.numberWithOptions(),
          onChange: (value) {
            phonevalue = value;
            print(phonevalue);
          },
        ),
        ProfileContactDataTab(
            isunpressed: isunpressed,
            iconcontact: Icon(
              FontAwesomeIcons.line,
              color: HexColor('#00B900'),
            ),
            textcontact: '${dataFromAPI?.body?.profileContactInfo?.line}',
          onChange: (value) {
            linevalue = value;
            print(linevalue);
          },),
        ProfileContactDataTab(
            isunpressed: isunpressed,
            iconcontact: Icon(
              FontAwesomeIcons.facebook,
              color: HexColor('#3B5998'),
            ),
            textcontact: '${dataFromAPI?.body?.profileContactInfo?.facebook}',
          onChange: (value) {
            facebookvalue = value;
            print(facebookvalue);
          },),
        ProfileContactDataTab(
            isunpressed: isunpressed,
            iconcontact: Icon(
              FontAwesomeIcons.instagram,
              color: HexColor('#E1306C'),
            ),
            textcontact: '${dataFromAPI?.body?.profileContactInfo?.instagram}',
          onChange: (value) {
            instagramvalue = value;
            print(instagramvalue);
          },),
        ProfileContactDataTab(
            isunpressed: isunpressed,
            iconcontact: Icon(
              FontAwesomeIcons.twitter,
              color: HexColor('#00acee'),
            ),
            textcontact: '${dataFromAPI?.body?.profileContactInfo?.twitter}',
          onChange: (value) {
            twittervalue = value;
            print(twittervalue);
          },),
        ProfileContactDataTab(
            isunpressed: isunpressed,
            iconcontact: Icon(
              FontAwesomeIcons.youtube,
              color: HexColor('#FF0000'),
            ),
            textcontact: '${dataFromAPI?.body?.profileContactInfo?.youtube}',
          onChange: (value) {
            youtubevalue = value;
            print(youtubevalue);
          },),
      ],
    );
  }
}

//////
class ProfileContactDataTab extends StatefulWidget {
  final Widget iconcontact;
  final String textcontact;
  final bool isunpressed;
  final ValueChanged<String>? onChange;
  final keyboardtype;
  ProfileContactDataTab(
      {Key? key,
      required this.iconcontact,
      required this.textcontact,
      required this.isunpressed,
      this.keyboardtype,
      this.onChange})
      : super(key: key);

  @override
  State<ProfileContactDataTab> createState() => _ProfileContactDataTabState();
}

class _ProfileContactDataTabState extends State<ProfileContactDataTab> {
  @override
  Widget build(BuildContext context) {
    Widget iconcontact = widget.iconcontact;
    String textcontact = widget.textcontact;
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
            iconcontact,
            Expanded(
              child: Container(
                child: TextFormField(
                  keyboardType: widget.keyboardtype,
                  readOnly: ispressed,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  onChanged: widget.onChange,
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
