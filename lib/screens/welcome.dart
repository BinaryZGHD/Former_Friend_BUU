
import 'package:f2fbuu/screens/login.dart';
import 'package:f2fbuu/screens/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colorname.dart';
import 'home.dart';



class screens_Welcome extends StatefulWidget {
  const screens_Welcome({Key? key}) : super(key: key);

  @override
  State<screens_Welcome> createState() => _screens_WelcomeState();
}

class _screens_WelcomeState extends State<screens_Welcome> {
  int _selectedIndex = 0;
  static const List<Widget> _screenList = [

    screens_Home(),
    screens_Login(),
    screens_Login(),
    screens_Login(),
    ProfileScreen(),




  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList[_selectedIndex],
      // backgroundColor: Color.fromRGBO(11, 12, 54, 1),
      // backgroundColor: Colors.indigo,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: color_Icon,),
            label: 'Home',
            backgroundColor:color_white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,color: color_Icon, ),
            label: ' Search',
            backgroundColor:color_white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add,color: color_Icon, ),
            label: 'Add',
              backgroundColor:color_white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner,color: color_Icon,  ),
            label: 'Doc',
            backgroundColor:color_white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person ,color: color_Icon,),
            label: 'Profile',
            backgroundColor:color_white,
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: color_Icon,
        onTap: _onItemTapped,
      ),
    );
  }
}
