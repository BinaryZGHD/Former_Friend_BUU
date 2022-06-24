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
  Future<void>? _launched;

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri toLaunchUrl = Uri.parse("${widget.URL}");
    print(' launch   == ${toLaunchUrl}');
    return GestureDetector(
      onTap: () {
        setState(() {
          _launched = _launchInBrowser(toLaunchUrl);
        });
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
        child:
            // Container(
            //   padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: TC_White),
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height * 0.1,
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 8,
              child: Container(
          margin: EdgeInsets.all(1),
          // padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          decoration: BoxDecoration(
              color: Color(0xFF94CCF9),
              border: Border.all(
                color: transparent,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(12.0),
              gradient: LinearGradient(stops: [
                0.02,
                0.02,
                0.94
              ], colors: [
                // Color(0xFF000000),
                Colors.white,
                Colors.white,
                // Color(0xFFCECECE),
                Colors.white,
              ], begin: Alignment.centerLeft, end: Alignment.centerRight),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text( "   "+
                  widget.title,
                  style: TextStyle(fontSize: 20, color: TC_Black),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: TC_Black,
                  size: 20,
                ),
              ],
          ),
        ),
            ),
      ),
    );
  }
}
