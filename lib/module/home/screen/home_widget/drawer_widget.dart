import 'package:f2fbuu/customs/button/button_icon_text.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/home/bloc/home_bloc/home_bloc.dart';
import 'package:f2fbuu/module/home/model/response/home_response/screen_home_response.dart';
import 'package:f2fbuu/module/home/screen/home_widget/change_language_widget.dart';
import 'package:f2fbuu/module/home/screen/home_widget/general_img_info_drawer_widget.dart';
import 'package:f2fbuu/module/home/screen/home_widget/general_info_drawer_widget.dart';
import 'package:f2fbuu/module/login/screen/change_password_screen/change_password_screen.dart';
import 'package:f2fbuu/module/profile/model/response/api_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';


drawerhome(BuildContext context,void Function() toggleLanguageView , isHidden,ScreenHomeResponse? screenhomeResponse, ApiProfileResponse? screenprofileResponse,
    ) {
  return SafeArea(
    child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            color: HexColor( screenprofileResponse?.body?.profileGeneralInfo?.gencolor ?? '#ffffff'),
            padding: const EdgeInsets.all(20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              buildTableGeneralImgeinfo(
                context,
                screenprofileResponse,
                tb1: 0.65,
                tb2: 0.05,
                tb3: 0.3,
              ),
              const SizedBox(
                height: 5,
              ),
              buildTableGeneralinfo(
                context,
                textlefttitile: screenhomeResponse?.body?.screenInfo?.textname ?? '-',
                textrightdetail:
                screenprofileResponse?.body?.profileGeneralInfo?.name?? '-' "${screenprofileResponse?.body?.profileGeneralInfo?.surname ?? '-'}" ,
                tb1: 0.3,
                tb2: 0.05,
                tb3: 0.65,
              ),
              const SizedBox(
                height: 5,
              ),
              buildTableGeneralinfo(
                context,
                textlefttitile: '${screenhomeResponse?.body?.screenInfo?.textnickname}',
                textrightdetail: screenprofileResponse?.body?.profileGeneralInfo?.nickname ?? '-',
                tb1: 0.45,
                tb2: 0.05,
                tb3: 0.5,
              ),
              const SizedBox(
                height: 5,
              ),
              buildTableGeneralinfo(
                context,
                textlefttitile: '${screenhomeResponse?.body?.screenInfo?.textstdcode}',
                textrightdetail: screenprofileResponse?.body?.profileGeneralInfo?.stuCode?? '-',
                tb1: 0.45,
                tb2: 0.05,
                tb3: 0.5,
              ),
              const SizedBox(
                height: 5,
              ),
              buildTableGeneralinfo(
                context,
                textlefttitile: '${screenhomeResponse?.body?.screenInfo?.textemail}',
                textrightdetail: screenprofileResponse?.body?.profileGeneralInfo?.email?? '-',
                tb1: 0.2,
                tb2: 0.02,
                tb3: 0.77,
              ),
            ]),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            color: bscTransparent,
            padding: const EdgeInsets.only(top: 0, bottom: 0, left: 15, right: 15),
            child: buildTableGeneralinfo(
              context,
              textlefttitile: '${screenhomeResponse?.body?.screenInfo?.textrole}',
              textrightdetail: screenprofileResponse?.body?.profileGeneralInfo?.role?? '-',
              tb1: 0.5,
              tb2: 0.05,
              tb3: 0.45,
            ),
          ),
          Container(
            width: double.infinity,
            color: bscTransparent,
            padding: const EdgeInsets.only(top: 0, bottom: 0, left: 15, right: 15),
            child: changLanguage(
              context,
              toggleLanguageView,
              isHidden,
              textlefttitile: '${screenhomeResponse?.body?.screenInfo?.textlang}',
              textrightdetail: '${screenhomeResponse?.body?.screenInfo?.textlangdetail}',
              tb1: 0.5,
              tb2: 0.00,
              tb3: 0.55,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangePasswordScreen()));
            },
            child: Container(
              width: double.infinity,
              color: bscTransparent,
              padding: const EdgeInsets.only(top: 0, bottom: 10, left: 15, right: 15),
              child: buildTableGeneralinfo(
                context,
                textlefttitile: '${screenhomeResponse?.body?.screenInfo?.btncpass}',
                textrightdetail: '',
                tb1: 0.5,
                tb2: 0.05,
                tb3: 0.45,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<HomeBloc>().add(OnClickDeleteAccountHomeEvent());
            },
            child: Container(
              width: double.infinity,
              color: bscTransparent,
              padding: const EdgeInsets.only(top: 0, bottom: 10, left: 15, right: 15),
              child: buildTableGeneralinfo(
                context,
                textlefttitile: '${screenhomeResponse?.body?.screenInfo?.btndelacc}',
                textrightdetail: '',
                tb1: 0.5,
                tb2: 0.05,
                tb3: 0.45,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: bscTransparent,
            padding: const EdgeInsets.only(top: 0, bottom: 15, left: 15, right: 15),
            child: buildTableGeneralinfo(
              context,
              textlefttitile: '${screenhomeResponse?.body?.screenInfo?.textappver}',
              textrightdetail: '${screenhomeResponse?.body?.vs}',
              tb1: 0.5,
              tb2: 0.05,
              tb3: 0.45,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: buttonIconsText(
              onPressed: () {
                context.read<HomeBloc>().add(OnClickLogoutHomeEvent());
              },
              label: "  ${screenhomeResponse?.body?.screenInfo?.btnlogout}  ",
              colortext: bcButtonLogout,
              colorbutton: tcButtonTextWhite,
              sizetext: sizeTextBig20,
              colorborder: bcButtonLogout,
              iconlabel: Icons.exit_to_app,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    ),
  );
}


