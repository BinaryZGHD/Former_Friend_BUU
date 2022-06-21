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
   print(' launch   == ${toLaunchUrl}' );
    return GestureDetector(
      onTap: () {
        setState(() {
          _launched = _launchInBrowser(toLaunchUrl);
        });
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(2, 0, 2, 1),
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: BC_ButtonADD),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
