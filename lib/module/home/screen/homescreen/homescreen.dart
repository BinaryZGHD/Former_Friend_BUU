import 'package:f2fbuu/customs/button/box.dart';
import 'package:f2fbuu/module/login/screen/loginscreen/loginscreen.dart';
import 'package:flutter/material.dart';

import '../../../../customs/button/buttoncustom.dart';
import '../../../../customs/color/colorconts.dart';
import '../../../../customs/size/size.dart';
import '../../../login/screen/changepasswordscreen/changepasswordscreen.dart';
import '../../../profile/screen/profile_page.dart';
import '../../bloc/buildlistactivity.dart';
import '../../bloc/data.dart';
import '../../bloc/itemactivity.dart';
import '../morescreen/moreboarddetailajan.dart';
import '../morescreen/moremainscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  color: backgroundDawer,
                  padding: EdgeInsets.all(20),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage('assets/logo/profile.png',),

                    ),
                    SizedBox(height: 10),
                    Text(
                      "ชื่อ",
                      style: TextStyle(
                        color: TC_Black,
                        fontSize: sizeText18,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ชื่อเล่น",
                          style: TextStyle(
                            color: TC_Black,
                            fontSize: sizeText18,
                          ),
                        ),
                        Text(
                          "รุ่น",
                          style: TextStyle(
                            color: TC_Black,
                            fontSize: sizeText18,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "รหัสนิสิต",
                      style: TextStyle(
                        color: TC_Black,
                        fontSize: sizeText18,
                      ),
                    ),
                    Text(
                      "อิเมล",
                      style: TextStyle(
                        color: TC_Black,
                        fontSize: sizeText18,
                      ),
                    ),
                  ]),
                ),
                Container(
                  child: ListTile(
                    title: Text(
                      'ประเภทผู้ใช้งาน',
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Container(
                    child: ListTile(
                      title: Text(
                        'ภาษา',
                        style: TextStyle(
                          fontFamily: 'Kanit',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => changePasswordScreen()));
                  },
                  child: Container(
                    child: ListTile(
                      title: Text(
                        'เปลี่ยนรหัสผ่าน',
                        style: TextStyle(
                          fontFamily: 'Kanit',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Text(
                      'ลบบัญชี',
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: TC_Black,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                ),
                Container(
                  color: BC_ButtonRed,
                  child: ListTile(
                    title: Text(
                      'เวอร์ชั่นแอพพลิเคชั่น',
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => loginScreen()));
                  },
                  child: Container(
                    child: ListTile(
                      leading: Icon(
                        Icons.exit_to_app,
                        color: Colors.black,
                      ),
                      title: Text(
                        'ออกจากระบบ',
                        style: TextStyle(
                          fontFamily: 'Kanit',
                          fontSize: 20,
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
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.settings, color: TC_Black),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Center(
              child:
                  Text('My activity ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: TC_Black))),
          actions: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: BC_ButtonWhite,
              // height: MediaQuery.of(context).size.height*0.1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BuildListActivity(),
                      SizedBox(
                          // height: MediaQuery.of(context).size.height * 0.2,
                          ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
            child: ButtonCustom(
              label: "     " + "  ADD  " + "     ",
              colortext: TC_Black,
              colorbutton: BC_ButtonWhite,
              sizetext: sizeTextSmaller14,
              colorborder: BSC_Black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),

            // padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              color: BC_ButtonWhite,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: IconButton(
                    icon: Icon(Icons.account_circle, color: Colors.black, size: 50),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                    },
                  )),
                  Expanded(
                      child: IconButton(
                    icon: Icon(Icons.home, color: Colors.blue, size: 50),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => loginScreen()));
                    },
                  )),
                  Expanded(
                      child: IconButton(
                    icon: Icon(Icons.auto_awesome_mosaic, color: Colors.black, size: 50),
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MoreMainScreen()));
                    },
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 50.0),
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
      //     },
      //     tooltip: 'More',
      //     child: const Icon(Icons.add),
      //   ),
      // ),
    );
  }
}
