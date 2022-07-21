import 'package:f2fbuu/module/profile/bloc/profile_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../model/response/api_profile.dart';

class ProfileGeneralDataHead extends StatefulWidget {
  final ApiProfileResponse? dataFromAPI;
  const ProfileGeneralDataHead({Key? key, required this.dataFromAPI})
      : super(key: key);
  @override
  State<ProfileGeneralDataHead> createState() => _ProfileGeneralDataHeadState();
}

class _ProfileGeneralDataHeadState extends State<ProfileGeneralDataHead> {
  bool isUnpressed = true;
  bool sentGeneralData = false;
  TextEditingController nameValueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var dataFromAPI = widget.dataFromAPI;
    String surnameValue = "";
    String nicknameValue = "";
    if (isUnpressed == true){
      sentGeneralData = true;
    }
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
                  '${dataFromAPI?.body?.screeninfo?.subtitlegeninfor}',
                  style: const TextStyle(fontSize: 20),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isUnpressed = !isUnpressed;
                          if(isUnpressed == true){
                            context.read<ProfileBloc>().add(GeneralSubmitEvent(nickname: nicknameValue, name: nameValueController.text, surname: surnameValue));
                          }
                        });
                      },
                      child: isUnpressed
                          // ? Text('บันทึก', style: TextStyle(color: Colors.green))
                          ? const Text('แก้ไข', style: TextStyle(color: Colors.red))
                          : const Text('บันทึก',
                              style: TextStyle(color: Colors.green)),
                      // : Text('แก้ไข', style: TextStyle(color: Colors.red)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ProfileGeneralDataTab(
          isUnpressed: isUnpressed,
          textLeft: '${dataFromAPI?.body?.screeninfo?.textname}',
          textRight: '${dataFromAPI?.body?.profileGeneralInfo?.name}',
          textEditingController: nameValueController,
          onChange: (value) {
            nameValueController.text = value;
            if (kDebugMode) {
              print(nameValueController.text);
            }
          },
        ),
        ProfileGeneralDataTab(
          isUnpressed: isUnpressed,
          textLeft: '${dataFromAPI?.body?.screeninfo?.textlname}',
          textRight: '${dataFromAPI?.body?.profileGeneralInfo?.surname}',
          onChange: (value) {
            surnameValue = value;
            if (kDebugMode) {
              print(surnameValue);
            }
          },
        ),
        ProfileGeneralDataTab(
            isUnpressed: isUnpressed,
            textLeft: '${dataFromAPI?.body?.screeninfo?.textnickname}',
            textRight: '${dataFromAPI?.body?.profileGeneralInfo?.nickname}',
            onChange: (value) {
              nicknameValue = value;
              if (kDebugMode) {
                print(nicknameValue);
              }
            }),
        ProfileGeneralDataReadonlyTab(
            isUnpressed: isUnpressed,
            textLeft: '${dataFromAPI?.body?.screeninfo?.textstdcode}',
            textRight: '${dataFromAPI?.body?.profileGeneralInfo?.stuCode}'),
        ProfileGeneralDataReadonlyTab(
            isUnpressed: isUnpressed,
            textLeft: '${dataFromAPI?.body?.screeninfo?.textgen}',
            textRight: '${dataFromAPI?.body?.profileGeneralInfo?.gen}'),
      ],
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
class ProfileGeneralDataTab extends StatefulWidget {
  final String textLeft;
  final String textRight;
  final bool isUnpressed;
  final ValueChanged<String>? onChange;
  final TextEditingController? textEditingController;
  const ProfileGeneralDataTab(
      {Key? key,
      required this.textLeft,
      required this.textRight,
      required this.isUnpressed,
      this.onChange, this.textEditingController})
      : super(key: key);

  @override
  State<ProfileGeneralDataTab> createState() => _ProfileGeneralDataTabState();
}

class _ProfileGeneralDataTabState extends State<ProfileGeneralDataTab> {
  @override
  Widget build(BuildContext context) {
    String textLeft = widget.textLeft;
    String textRight = widget.textRight;
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
            Text(
              '$textLeft ',
              style: const TextStyle(fontSize: 18),
            ),
            Expanded(
              child: TextFormField(
                autofocus: false,
                style: const TextStyle(fontSize: 18, color: Colors.black),
                readOnly: isUnpressed,
                // readOnly: true,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                initialValue: textRight,
                onChanged: widget.onChange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////
class ProfileGeneralDataReadonlyTab extends StatefulWidget {
  final String textLeft;
  final String textRight;
  final bool isUnpressed;

  const ProfileGeneralDataReadonlyTab(
      {Key? key,
      required this.textLeft,
      required this.textRight,
      required this.isUnpressed})
      : super(key: key);

  @override
  State<ProfileGeneralDataReadonlyTab> createState() =>
      _ProfileGeneralDataReadonlyTabState();
}

class _ProfileGeneralDataReadonlyTabState
    extends State<ProfileGeneralDataReadonlyTab> {
  @override
  Widget build(BuildContext context) {
    String textLeft = widget.textLeft;
    String textRight = widget.textRight;
    return Container(
      decoration: BoxDecoration(
        color: HexColor('#f5f5f5'),
        border: const Border(
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
                autofocus: false,
                style: const TextStyle(fontSize: 18, color: Colors.black),
                readOnly: true,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                initialValue: textRight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
