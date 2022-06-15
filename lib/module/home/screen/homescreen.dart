import 'package:f2fbuu/customs/button/box.dart';
import 'package:f2fbuu/module/login/screen/loginscreen/loginscreen.dart';
import 'package:flutter/material.dart';

import '../../../customs/button/buttoncustom.dart';
import '../../../customs/color/colorconts.dart';
import '../../../customs/size/size.dart';
import '../../profile/screen/profile_page.dart';
import '../bloc/buildlistactivity.dart';
import '../bloc/data.dart';
import '../bloc/itemactivity.dart';
import 'moreboarddetailajan.dart';

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
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                'นายสมชาย นามสมบัติ',
                style: TextStyle(
                  fontFamily: 'Kanit',
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              accountEmail: Text(
                'F2F@Admin.com',
                style: TextStyle(
                  fontFamily: 'Kanit',
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/logo/profile.png'),
              ),
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => screens_Home()));
            //   },
            //   child: Container(
            //     child: ListTile(
            //       title: Text(
            //         '- - - ',
            //         style: TextStyle(
            //           fontFamily: 'Kanit',
            //           fontSize: 20,
            //           color: Colors.black,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
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
            Container(
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
            Container(
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
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
          ],
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
          title: Center(child: Text('My activity ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500 , color: TC_Black))),
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
                      // buildCardWelcome(),,

                      SizedBox(
                        // height: MediaQuery.of(context).size.height * 0.2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ButtonCustom(
            label:"     " + "  ADD  "+"     ",
            screengo: HomeScreen(),
            colortext: TC_Black,
            colorbutton: BC_ButtonWhite,
            sizetext: sizeTextSmaller14, colorborder: BSC_Black,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),

            // padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              color: BC_ButtonWhite,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  IconButton(
                    icon: Icon(Icons.account_circle, color: Colors.black, size: 50),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                    },
                  ),SizedBox(),
                  IconButton(
                    icon: Icon(Icons.home, color: Colors.blue, size: 50),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                  ),SizedBox(),
                  IconButton(
                    icon: Icon(Icons.auto_awesome_mosaic, color: Colors.black, size: 50),
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                  ),
                  SizedBox(),
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
