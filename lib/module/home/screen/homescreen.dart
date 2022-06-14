import 'package:f2fbuu/customs/button/box.dart';
import 'package:f2fbuu/module/login/screen/loginscreen/loginscreen.dart';
import 'package:flutter/material.dart';

import '../../profile/screen/profile_page.dart';
import 'moreboarddetailajan.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                'นายสมชาย สมบัติ',
                style: TextStyle(
                  fontFamily: 'Kanit',
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              accountEmail: Text(
                '62030340@Admin.com',
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
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Center(child: Text('My activity ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              // height: MediaQuery.of(context).size.height*0.1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildCardWelcome(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints.expand(height: 50),
            child: GestureDetector(
                child: Text("ADD", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.black)),
                onTap: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                }),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.green[200]),
            margin: EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
            padding: EdgeInsets.all(12),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 5,
                ),
                IconButton(
                  icon: Icon(Icons.account_circle , color: Colors.black),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.home, color: Colors.blue),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.auto_awesome_mosaic, color: Colors.black),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailAjanScreen()));
                  },
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
          // ButtonBar(
          //   alignment: MainAxisAlignment.center,
          //   buttonPadding:EdgeInsets.symmetric(
          //       horizontal: 30,
          //       vertical: 5
          //   ),
          //   children: [
          //     RaisedButton(
          //       child: Text("Yes"),
          //       textColor: Colors.white,
          //       color: Colors.blue,
          //       onPressed: (){},
          //     ),
          //     RaisedButton(
          //       child: Text("No"),
          //       textColor: Colors.white,
          //       color: Colors.red,
          //       onPressed: (){},
          //     ),
          //     RaisedButton(
          //       child: Text("Cancel"),
          //       //textColor: Colors.white,
          //       color: Colors.green,
          //       onPressed: (){},
          //     ),
          //   ],
          // )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
          },
          tooltip: 'More',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  buildCardWelcome() {
    return Card(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
