import 'package:f2fbuu/module/home/model/response/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../customs/color/colorconts.dart';
import '../../../../customs/dialog/dialog_widget.dart';
import '../../../../customs/dialog/texterror.dart';
import '../../../../customs/size/size.dart';
import '../../../login/screen/changepasswordscreen/changepasswordscreen.dart';
import '../../../login/screen/loginscreen/loginscreen.dart';
import 'homescreen.dart';

drawerhome(BuildContext context, ScreenHomeResponse? _screenhomeResponse) {
  return SafeArea(
    child: SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              color: HexColor('${_screenhomeResponse?.body?.dataDrawerDetail?.gencolor}'),
              padding: EdgeInsets.all(20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                _buildTableGeneralImgeinfo(
                  context,
                  _screenhomeResponse,
                  tb1: 0.65,
                  tb2: 0.05,
                  tb3: 0.3,
                ),
                SizedBox(
                  height: 5,
                ),
                _buildTableGeneralinfo(
                  context,
                  textlefttitile: '${_screenhomeResponse?.body?.screeninfo?.textname}',
                  textrightdetail: '${_screenhomeResponse?.body?.dataDrawerDetail?.name}',
                  tb1: 0.25,
                  tb2: 0.05,
                  tb3: 0.70,
                ),
                SizedBox(
                  height: 5,
                ),
                _buildTableGeneralinfo(
                  context,
                  textlefttitile: '${_screenhomeResponse?.body?.screeninfo?.textnickname}',
                  textrightdetail: '${_screenhomeResponse?.body?.dataDrawerDetail?.nickname}',
                  tb1: 0.45,
                  tb2: 0.05,
                  tb3: 0.5,
                ),
                SizedBox(
                  height: 5,
                ),
                _buildTableGeneralinfo(
                  context,
                  textlefttitile: '${_screenhomeResponse?.body?.screeninfo?.textstdcode}',
                  textrightdetail: '${_screenhomeResponse?.body?.dataDrawerDetail?.studentid}',
                  tb1: 0.45,
                  tb2: 0.05,
                  tb3: 0.5,
                ),
                SizedBox(
                  height: 5,
                ),
                _buildTableGeneralinfo(
                  context,
                  textlefttitile: '${_screenhomeResponse?.body?.screeninfo?.textemail}',
                  textrightdetail: '${_screenhomeResponse?.body?.dataDrawerDetail?.email}',
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
                  textlefttitile: '${_screenhomeResponse?.body?.screeninfo?.textrole}',
                  textrightdetail: '${_screenhomeResponse?.body?.dataDrawerDetail?.role}',
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
                  textlefttitile: '${_screenhomeResponse?.body?.screeninfo?.textlang}',
                  textrightdetail: '${_screenhomeResponse?.body?.screeninfo?.textlangdetail}',
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
                    "${_screenhomeResponse?.body?.screeninfo?.btncpass}",
                    style: TextStyle(
                      fontFamily: 'Kanit',
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),GestureDetector(
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
                    "${_screenhomeResponse?.body?.screeninfo?.btndelacc}",
                    style: TextStyle(
                      fontFamily: 'Kanit',
                      fontSize: 18,
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
                  textlefttitile: '${_screenhomeResponse?.body?.screeninfo?.textappver}',
                  textrightdetail: '${_screenhomeResponse?.body?.dataDrawerDetail?.vs}',
                  tb1: 0.6,
                  tb2: 0.02,
                  tb3: 0.35,
                ),
                SizedBox(height: 10),
              ]),
            ),
            GestureDetector(
              onTap: () {
                dialogOneLineTwoBtn(
                    context, errlogout + '\n \n ' + 'Do you want to continue?', 'Confirm', 'Cancel',
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
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.black,
                  ),
                  title: Text(
                    "${_screenhomeResponse?.body?.screeninfo?.btnlogout}",
                    style: TextStyle(
                      fontFamily: 'Kanit',
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
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

_buildTableGeneralImgeinfo(BuildContext context, ScreenHomeResponse? _screenhomeResponse,
    { required tb1, required tb2, required tb3}) {
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
              "${_screenhomeResponse?.body?.dataDrawerDetail?.gen}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Table(children: [
              TableRow(children: [
                Text(
                  '${_screenhomeResponse?.body?.dataDrawerDetail?.genname}',
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
        if (_screenhomeResponse?.body?.dataDrawerDetail?.img == null)
          CircleAvatar(
            radius: 35.0,
            backgroundImage: AssetImage(
              'assets/logo/profile.png',
            ),
          ),
        if (_screenhomeResponse?.body?.dataDrawerDetail?.img != null)
          CircleAvatar(
            radius: 35.0,
            backgroundImage: NetworkImage("${_screenhomeResponse?.body?.dataDrawerDetail?.img}"),
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
          style: TextStyle(fontFamily: 'Kanit', fontSize: sizeText18, fontWeight: FontWeight.bold),
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
  return Table(
    border: TableBorder.symmetric(outside: BorderSide(width: 2, color: Colors.transparent)),
    columnWidths: {0: FractionColumnWidth(tb1), 1: FractionColumnWidth(tb2), 2: FractionColumnWidth(tb3)},
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      TableRow(children: [
        Text(
          textlefttitile,
          textAlign: TextAlign.start,
          style: TextStyle(fontFamily: 'Kanit', fontSize: sizeText18, fontWeight: FontWeight.bold),
        ),
        SizedBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              textrightdetail,
              style: TextStyle(fontSize: sizeTextSmall16),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.toggle_on)),
          ],
        ),
      ])
    ],
  );
}
