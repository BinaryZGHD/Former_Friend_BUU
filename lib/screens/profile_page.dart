import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [HexColor('#FFFFFF'), HexColor('#FFB1EE')])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          // backgroundColor: Colors.transparent,
          backgroundColor: Colors.white,
          elevation: 2,
          title: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: const Text("บัญชี",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                )),
          ),
        ),
        body: Column(
          children: [Expanded(child: SizedBox(

          ))
            
          ],
        ),
      ),
    );
  }
}
