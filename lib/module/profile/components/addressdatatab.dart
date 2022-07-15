import 'package:f2fbuu/module/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/response/api_profile.dart';

class ProfileAddressDataHead extends StatefulWidget {
  final ApiProfileResponse? dataFromAPI;

  ProfileAddressDataHead({Key? key, required this.dataFromAPI})
      : super(key: key);

  @override
  State<ProfileAddressDataHead> createState() => _ProfileAddressDataHeadState();
}

class _ProfileAddressDataHeadState extends State<ProfileAddressDataHead> {
  bool isUnpressed = true;

  @override
  Widget build(BuildContext context) {
    var dataFromAPI = widget.dataFromAPI;
    String numberValue ="";
    String roadValue ="";
    String subDistrictValue ="";
    String districtValue ="";
    String provinceValue ="";
    String zipcodeValue ="";
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
                  '${dataFromAPI?.body?.screeninfo?.subtitleaddress}',
                  style: TextStyle(fontSize: 20),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isUnpressed = !isUnpressed;
                          if(isUnpressed == true){
                            context.read<ProfileBloc>().add(AddressSubmitEvent(zipcode: zipcodeValue, district: districtValue, road: roadValue, province: provinceValue, number: numberValue, subDistrict: subDistrictValue));
                          };
                        });
                      },
                      child: isUnpressed
                          ? Text('แก้ไข', style: TextStyle(color: Colors.red))
                          : Text('บันทึก',
                              style: TextStyle(color: Colors.green)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ProfileAddressDataTab(
          isUnpressed: isUnpressed,
          textLeft: '${dataFromAPI?.body?.screeninfo?.texthousenumber}',
          textRight: '${dataFromAPI?.body?.profileAddressInfo?.number}',
          onChange: (value) {
            numberValue = value;
            print(numberValue);
          },
        ),
        ProfileAddressDataTab(
            isUnpressed: isUnpressed,
            textLeft: '${dataFromAPI?.body?.screeninfo?.textmoo}',
            textRight: '${dataFromAPI?.body?.profileAddressInfo?.moo}',
          onChange: (value) {
            numberValue = value;
            print(numberValue);
          },),
        ProfileAddressDataTab(
            isUnpressed: isUnpressed,
            textLeft: '${dataFromAPI?.body?.screeninfo?.textsoi}',
            textRight: '${dataFromAPI?.body?.profileAddressInfo?.soi}',
          onChange: (value) {
            numberValue = value;
            print(numberValue);
          },),
        ProfileAddressDataTab(
            isUnpressed: isUnpressed,
            textLeft: '${dataFromAPI?.body?.screeninfo?.textroad}',
            textRight: '${dataFromAPI?.body?.profileAddressInfo?.road}',
          onChange: (value) {
            roadValue = value;
            print(roadValue);
          },),
        ProfileAddressDataTab(
            isUnpressed: isUnpressed,
            textLeft: '${dataFromAPI?.body?.screeninfo?.textsubdistrict}',
            textRight: '${dataFromAPI?.body?.profileAddressInfo?.subdistrict}',
          onChange: (value) {
            subDistrictValue = value;
            print(subDistrictValue);
          },),
        ProfileAddressDataTab(
            isUnpressed: isUnpressed,
            textLeft: '${dataFromAPI?.body?.screeninfo?.textdistrict}',
            textRight: '${dataFromAPI?.body?.profileAddressInfo?.district}',
          onChange: (value) {
            districtValue = value;
            print(districtValue);
          },),
        ProfileAddressDataTab(
            isUnpressed: isUnpressed,
            textLeft: '${dataFromAPI?.body?.screeninfo?.textprovince}',
            textRight: '${dataFromAPI?.body?.profileAddressInfo?.province}',
          onChange: (value) {
            provinceValue = value;
            print(provinceValue);
          },),
        ProfileAddressDataTab(
            isUnpressed: isUnpressed,
            textLeft: '${dataFromAPI?.body?.screeninfo?.textzipcode}',
            textRight: '${dataFromAPI?.body?.profileAddressInfo?.zipcode}',
          onChange: (value) {
            zipcodeValue = value;
            print(zipcodeValue);
          },),
      ],
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
class ProfileAddressDataTab extends StatefulWidget {
  final String textLeft;
  final String textRight;
  final bool isUnpressed;
  final ValueChanged<String>? onChange;
  ProfileAddressDataTab(
      {Key? key,
      required this.textLeft,
      required this.textRight,
      required this.isUnpressed,
        this.onChange})
      : super(key: key);

  @override
  State<ProfileAddressDataTab> createState() => _ProfileAddressDataTabState();
}

class _ProfileAddressDataTabState extends State<ProfileAddressDataTab> {
  @override
  Widget build(BuildContext context) {
    String textLeft = widget.textLeft;
    String textRight = widget.textRight;
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
            Text(
              textLeft + ' ',
              style: TextStyle(fontSize: 18),
            ),
            Expanded(
              child: Container(
                child: TextFormField(
                  autofocus: false,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  readOnly: isUnpressed,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  onChanged: widget.onChange,
                  initialValue: textRight,
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
