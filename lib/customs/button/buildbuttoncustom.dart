import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class  buildButtonCustom extends StatelessWidget {
  final String linklabel;
  final String linkurl;

  final Widget maptype;
  final String mapscreen;
  final String mapdetailscreen;
  final linktextcolor;
  final VoidCallback? onPressed;
  const  buildButtonCustom({Key? key, required this.linklabel, required this.linkurl, required this.maptype, this.linktextcolor, this.onPressed, required this.mapscreen, required this.mapdetailscreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.8,
      constraints: BoxConstraints.expand(height: 50),
      child: GestureDetector(
          child: Text(linklabel, textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.black)),

          onTap: () async {
            Navigator.push(context, MaterialPageRoute(builder: (context) => maptype ));
          }

          ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.green[200]),
      margin: EdgeInsets.all( 16),
      padding: EdgeInsets.all(12),
    );
  }
}
/////