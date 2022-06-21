import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../customs/color/colorconts.dart';
import 'moremainscreen.dart';

class CardMore extends StatefulWidget {
  final String title;
  final String URL;
  const CardMore({Key? key, required this.title, required this.URL}) : super(key: key);

  @override
  State<CardMore> createState() => _CardMoreState();
}

class _CardMoreState extends State<CardMore> {



  @override
  Widget build(BuildContext context) {
    Uri _url = Uri.parse("${widget.URL}");
    print("_url555555"+ "${_url}");
    return GestureDetector(
      onTap: ()
        // Navigator.push(context, MaterialPageRoute(builder: (context) => MoreMainScreen()))
        async {
          if (!await launchUrl(
          Uri.parse("${_url}"),
          )) {
            print('Could not launch ${_url}');
          }
        throw 'Could not launch $_url';

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

