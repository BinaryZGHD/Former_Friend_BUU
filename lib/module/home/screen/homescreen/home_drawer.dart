import 'package:f2fbuu/customs/button/buildbuttoncustom.dart';
import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/customs/dialog/texterror.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/home/model/response/screen_home_response.dart';
import 'package:f2fbuu/module/login/screen/changepasswordscreen/changepassword_screen.dart';
import 'package:f2fbuu/module/login/screen/loginscreen/login_screen.dart';
import 'package:f2fbuu/module/profile/model/response/api_profile.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

drawerhome(BuildContext context, ScreenHomeResponse? _screenhomeResponse, ApiProfileResponse? _screenprofileResponse) {
  return SafeArea(
    child: SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              color: HexColor('${_screenprofileResponse?.body?.profileGeneralInfo?.gencolor}'),
              padding: EdgeInsets.all(20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                _buildTableGeneralImgeinfo(
                  context,
                  _screenprofileResponse,
                  tb1: 0.65,
                  tb2: 0.05,
                  tb3: 0.3,
                ),
                SizedBox(
                  height: 5,
                ),
                _buildTableGeneralinfo(
                  context,
                  textlefttitile: '${_screenhomeResponse?.body?.screenInfo?.screenhome?.textname}',
                  textrightdetail: '${_screenprofileResponse?.body?.profileGeneralInfo?.name}' +
                      ' ' +
                      '${_screenprofileResponse?.body?.profileGeneralInfo?.surname}',
                  tb1: 0.25,
                  tb2: 0.05,
                  tb3: 0.70,
                ),
                SizedBox(
                  height: 5,
                ),
                _buildTableGeneralinfo(
                  context,
                  textlefttitile: '${_screenhomeResponse?.body?.screenInfo?.screenhome?.textnickname}',
                  textrightdetail: '${_screenprofileResponse?.body?.profileGeneralInfo?.nickname}',
                  tb1: 0.45,
                  tb2: 0.05,
                  tb3: 0.5,
                ),
                SizedBox(
                  height: 5,
                ),
                _buildTableGeneralinfo(
                  context,
                  textlefttitile: '${_screenhomeResponse?.body?.screenInfo?.screenhome?.textstdcode}',
                  textrightdetail: '${_screenprofileResponse?.body?.profileGeneralInfo?.stuCode}',
                  tb1: 0.45,
                  tb2: 0.05,
                  tb3: 0.5,
                ),
                SizedBox(
                  height: 5,
                ),
                _buildTableGeneralinfo(
                  context,
                  textlefttitile: '${_screenhomeResponse?.body?.screenInfo?.screenhome?.textemail}',
                  textrightdetail: '${_screenprofileResponse?.body?.profileGeneralInfo?.email}',
                  tb1: 0.25,
                  tb2: 0.05,
                  tb3: 0.70,
                ),
              ]),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              color: BSC_transparent,
              padding: EdgeInsets.only(top: 0, bottom: 0, left: 15, right: 15),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                _buildTableGeneralinfo(
                  context,
                  textlefttitile: '${_screenhomeResponse?.body?.screenInfo?.screenhome?.textrole}',
                  textrightdetail: '${_screenprofileResponse?.body?.profileGeneralInfo?.role}',
                  tb1: 0.5,
                  tb2: 0.05,
                  tb3: 0.45,
                ),
                SizedBox(height: 10),
              ]),
            ),
            Container(
              width: double.infinity,
              color: BSC_transparent,
              padding: EdgeInsets.only(top: 0, bottom: 0, left: 15, right: 15),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                _buildTableIconLanginfo(
                  context,
                  textlefttitile: '${_screenhomeResponse?.body?.screenInfo?.screenhome?.textlang}',
                  textrightdetail: '${_screenhomeResponse?.body?.screenInfo?.screenhome?.textlangdetail}',
                  tb1: 0.5,
                  tb2: 0.00,
                  tb3: 0.55,
                ),
                SizedBox(height: 10),
              ]),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => changePasswordScreen()));
              },
              child: Container(
                child: ListTile(
                  title: Text(
                    "${_screenhomeResponse?.body?.screenInfo?.screenhome?.btncpass}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: sizeText18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                dialogOneLineTwoBtn(
                    context, errchangepassword + '\n \n ' + 'Do you want to continue?', 'Confirm', 'Cancel',
                    onClickBtn: (String result) {
                  Navigator.of(context).pop();
                  switch (result) {
                    case 'Cancel':
                      {
                        break;
                      }
                    case 'OK':
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                          // int index = int.parse(widget.id);
                          return loginScreen();
                          // DisplayBeerScreen();
                        }));
                      }
                  }
                });
              },
              child: Container(
                child: ListTile(
                  title: Text(
                    "${_screenhomeResponse?.body?.screenInfo?.screenhome?.btndelacc}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: sizeText18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: BSC_transparent,
              padding: EdgeInsets.only(top: 0, bottom: 0, left: 15, right: 10),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                _buildTableGeneralinfo(
                  context,
                  textlefttitile: '${_screenhomeResponse?.body?.screenInfo?.screenhome?.textappver}',
                  textrightdetail: '${_screenhomeResponse?.body?.vs}',
                  tb1: 0.6,
                  tb2: 0.02,
                  tb3: 0.35,
                ),
                SizedBox(height: 10),
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 15, right: 15),
              child: buildButtonCustom(
                onPressed: () {
                  dialogOneLineTwoBtn(context, errlogout + '\n \n ' + 'Do you want to continue?', 'Confirm', 'Cancel',
                      onClickBtn: (String result) {
                    Navigator.of(context).pop();
                    switch (result) {
                      case 'Cancel':
                        {
                          break;
                        }
                      case 'OK':
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                            // int index = int.parse(widget.id);
                            return loginScreen();
                            // DisplayBeerScreen();
                          }));
                        }
                    }
                  });
                },
                label: "  ${_screenhomeResponse?.body?.screenInfo?.screenhome?.btnlogout}  ",
                colortext: BC_ButtonLogout,
                colorbutton: BC_ButtonText_style_White,
                sizetext: sizeTextBig20,
                colorborder: BC_ButtonLogout,
                iconlabel: Icons.exit_to_app,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ),
  );
}

_buildTableGeneralImgeinfo(BuildContext context, ApiProfileResponse? _screenprofileResponse,
    {required tb1, required tb2, required tb3}) {
  return Table(
    border: TableBorder.symmetric(outside: BorderSide(width: 2, color: Colors.transparent)),
    columnWidths: {0: FractionColumnWidth(tb1), 1: FractionColumnWidth(tb2), 2: FractionColumnWidth(tb3)},
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      TableRow(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "${_screenprofileResponse?.body?.profileGeneralInfo?.gen}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Table(children: [
              TableRow(children: [
                Text(
                  '${_screenprofileResponse?.body?.profileGeneralInfo?.genname}',
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 18),
                ),
              ]),
            ]),
          ],
        ),
        SizedBox(
          width: 10,
        ),
        if (_screenprofileResponse?.body?.profileGeneralInfo?.img == null)
          CircleAvatar(
            radius: 35.0,
            backgroundImage: AssetImage(
              'assets/logo/profile.png',
            ),
          ),
        if (_screenprofileResponse?.body?.profileGeneralInfo?.img != null)
          CircleAvatar(
            radius: 35.0,
            backgroundImage: NetworkImage("${_screenprofileResponse?.body?.profileGeneralInfo?.img}"),
          ),
      ])
    ],
  );
}

_buildTableGeneralinfo(
  BuildContext context, {
  required textlefttitile,
  required String textrightdetail,
  required tb1,
  required tb2,
  required tb3,
}) {
  return Table(
    border: TableBorder.symmetric(outside: BorderSide(width: 2, color: Colors.transparent)),
    columnWidths: {0: FractionColumnWidth(tb1), 1: FractionColumnWidth(tb2), 2: FractionColumnWidth(tb3)},
    // defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      TableRow(children: [
        Text(
          textlefttitile,
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: sizeText18, fontWeight: FontWeight.bold),
        ),
        SizedBox(),
        Text(
          textrightdetail,
          textAlign: TextAlign.end,
          style: TextStyle(fontSize: sizeTextSmall16),
        ),
      ])
    ],
  );
}

_buildTableIconLanginfo(
  BuildContext context, {
  required String textlefttitile,
  required String textrightdetail,
  required tb1,
  required tb2,
  required tb3,
}) {
  bool _isVisible = false;

  return Table(
    border: TableBorder.symmetric(outside: BorderSide(width: 2, color: Colors.transparent)),
    columnWidths: {0: FractionColumnWidth(tb1), 1: FractionColumnWidth(tb2), 2: FractionColumnWidth(tb3)},
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      TableRow(children: [
        Text(
          textlefttitile,
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: sizeText18, fontWeight: FontWeight.bold),
        ),
        SizedBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              textrightdetail,
              style: TextStyle(fontSize: sizeTextSmall16),
            ),
            //

            IconButton(
                onPressed: () {
                  _isVisible = !_isVisible;
                },
                icon: _isVisible
                    ? Icon(Icons.toggle_off, color: Color(0xFF4F4F4F))
                    : Icon(Icons.toggle_on, color: Color(0xFF00A80A))),
          ],
        ),
      ])
    ],
  );
}
