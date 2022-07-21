import 'package:f2fbuu/module/profile/bloc/profile_bloc.dart';
import 'package:f2fbuu/module/profile/model/response/api_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfileContactDataHead extends StatefulWidget {
  final ApiProfileResponse? dataFromAPI;
  const ProfileContactDataHead({Key? key, required this.dataFromAPI})
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
          decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(width: 1, color: Colors.black12),
                bottom: BorderSide(width: 1, color: Colors.transparent)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  '${dataFromAPI?.body?.screeninfo?.subtitlecont}',
                  style: const TextStyle(fontSize: 20),
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
                        });
                      },
                      child: isUnpressed
                          ? const Text('แก้ไข', style: TextStyle(color: Colors.red))
                          : const Text('บันทึก',
                              style: TextStyle(color: Colors.green)),
                    ),
                  ),
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
          keyboardType: const TextInputType.numberWithOptions(),
          onChange: (value) {
            phoneValue = value;
            if (kDebugMode) {
              print(phoneValue);
            }
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
            if (kDebugMode) {
              print(lineValue);
            }
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
            if (kDebugMode) {
              print(facebookValue);
            }
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
            if (kDebugMode) {
              print(instagramValue);
            }
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
            if (kDebugMode) {
              print(twitterValue);
            }
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
            if (kDebugMode) {
              print(youtubeValue);
            }
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
  final TextInputType? keyboardType;
  const ProfileContactDataTab(
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
      decoration: const BoxDecoration(
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
              child: TextFormField(
                keyboardType: widget.keyboardType,
                readOnly: isUnpressed,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: widget.onChange,
                initialValue: textContact,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
