import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../customs/color/colorconts.dart';
import 'moremainscreen.dart';

class CardMore extends StatefulWidget {
  final String title;
  const CardMore({Key? key, required this.title}) : super(key: key);

  @override
  State<CardMore> createState() => _CardMoreState();
}

class _CardMoreState extends State<CardMore> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MoreMainScreen()));
      },
      child: Padding(
          padding:const EdgeInsets.fromLTRB(2, 0, 2, 1),
          child: Container(
              padding:const EdgeInsets.fromLTRB(15, 0, 15, 0),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: BC_ButtonADD),
              width: MediaQuery.of(context).size.width ,
              height: MediaQuery.of(context).size.height* 0.1 ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.title, style: TextStyle(fontSize: 20, color: Colors.white),),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20,),
                ],

          ),

      ),
      ),
    );
  }
}
