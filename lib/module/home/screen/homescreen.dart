import 'package:f2fbuu/module/login/screen/loginscreen/loginscreen.dart';
import 'package:flutter/material.dart';

import '../../profile/screen/profile_page.dart';






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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen()));
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginScreen()));
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
          title: Center(child: Text('My activity ' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))),
        ),

      ),



      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildCardWelcome(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1 , ),





              ],

            ),

          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }


  buildCardWelcome(){
    return Card(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width ,
      ),
    );
  }


}