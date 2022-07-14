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
  bool isunpressed = true;

  @override
  Widget build(BuildContext context) {
    var dataFromAPI = widget.dataFromAPI;
    String numbervalue ="";
    String roadvalue ="";
    String subdistrictvalue ="";
    String districtvalue ="";
    String provincevalue ="";
    String zipcodevalue ="";
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
                          isunpressed = !isunpressed;
                          if(isunpressed == true){
                            context.read<ProfileBloc>().add(AddressSubmitEvent(zipcode: zipcodevalue, token: "demotoken", district: districtvalue, road: roadvalue, province: provincevalue, number: numbervalue, subdistrict: subdistrictvalue));
                          };
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
        ProfileAddressDataTab(
          isunpressed: isunpressed,
          textleft: '${dataFromAPI?.body?.screeninfo?.texthousenumber}',
          textright: '${dataFromAPI?.body?.profileAddressInfo?.number}',
          onChange: (value) {
            numbervalue = value;
            print(numbervalue);
          },
        ),
        ProfileAddressDataTab(
            isunpressed: isunpressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textmoo}',
            textright: '${dataFromAPI?.body?.profileAddressInfo?.moo}',
          onChange: (value) {
            numbervalue = value;
            print(numbervalue);
          },),
        ProfileAddressDataTab(
            isunpressed: isunpressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textsoi}',
            textright: '${dataFromAPI?.body?.profileAddressInfo?.soi}',
          onChange: (value) {
            numbervalue = value;
            print(numbervalue);
          },),
        ProfileAddressDataTab(
            isunpressed: isunpressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textroad}',
            textright: '${dataFromAPI?.body?.profileAddressInfo?.road}',
          onChange: (value) {
            roadvalue = value;
            print(roadvalue);
          },),
        ProfileAddressDataTab(
            isunpressed: isunpressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textsubdistrict}',
            textright: '${dataFromAPI?.body?.profileAddressInfo?.subdistrict}',
          onChange: (value) {
            subdistrictvalue = value;
            print(subdistrictvalue);
          },),
        ProfileAddressDataTab(
            isunpressed: isunpressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textdistrict}',
            textright: '${dataFromAPI?.body?.profileAddressInfo?.district}',
          onChange: (value) {
            districtvalue = value;
            print(districtvalue);
          },),
        ProfileAddressDataTab(
            isunpressed: isunpressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textprovince}',
            textright: '${dataFromAPI?.body?.profileAddressInfo?.province}',
          onChange: (value) {
            provincevalue = value;
            print(provincevalue);
          },),
        ProfileAddressDataTab(
            isunpressed: isunpressed,
            textleft: '${dataFromAPI?.body?.screeninfo?.textzipcode}',
            textright: '${dataFromAPI?.body?.profileAddressInfo?.zipcode}',
          onChange: (value) {
            zipcodevalue = value;
            print(zipcodevalue);
          },),
      ],
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
class ProfileAddressDataTab extends StatefulWidget {
  final String textleft;
  final String textright;
  final bool isunpressed;
  final ValueChanged<String>? onChange;
  ProfileAddressDataTab(
      {Key? key,
      required this.textleft,
      required this.textright,
      required this.isunpressed,
        this.onChange})
      : super(key: key);

  @override
  State<ProfileAddressDataTab> createState() => _ProfileAddressDataTabState();
}

class _ProfileAddressDataTabState extends State<ProfileAddressDataTab> {
  @override
  Widget build(BuildContext context) {
    String textleft = widget.textleft;
    String textright = widget.textright;
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
            Text(
              textleft + ' ',
              style: TextStyle(fontSize: 18),
            ),
            Expanded(
              child: Container(
                child: TextFormField(
                  autofocus: false,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  readOnly: ispressed,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  onChanged: widget.onChange,
                  initialValue: textright,
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
