import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreBoardTeacherDetailScreen extends StatefulWidget {
  final String name;
  final String position;
  final String phone;
  final String email;
  final String url;
  final String titlename;
  final String titleposition;
  final String titlephone;
  final String titleemail;
  final String titleurl;
  final String image;
  const MoreBoardTeacherDetailScreen({
    Key? key,
    required this.name,
    required this.position,
    required this.phone,
    required this.email,
    required this.url,
    required this.image,
    required this.titlename,
    required this.titleposition,
    required this.titlephone,
    required this.titleemail,
    required this.titleurl,
  }) : super(key: key);

  @override
  State<MoreBoardTeacherDetailScreen> createState() => _MoreBoardTeacherDetailScreenState();
}

class _MoreBoardTeacherDetailScreenState extends State<MoreBoardTeacherDetailScreen> with ProgressDialog {
  @override
  Widget build(BuildContext context) {
    Future<void> _launchInBrowser(Uri url) async {
      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      )) {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: sizeTitle24,
            color: Colors.black,
          ),
        ),
        title: Text(
          widget.name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: sizeTitle24,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(2, 5, 2, 10),
        color: Colors.grey[200],
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.grey[200],
          ),
          Positioned(
            left: 5,
            right: 5,
            top: 70,
            child: Container(
              padding: const EdgeInsets.fromLTRB(2, 5, 2, 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  _buildTeacherDetail(titail: widget.titlename, value: widget.name),
                  _buildTeacherDetail(titail: widget.titleposition, value: widget.position),
                  _buildTeacherDetail(titail: widget.titlephone, value: widget.phone),
                  _buildTeacherDetail(titail: widget.titleemail, value: widget.email),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          _launchInBrowser(Uri.parse(widget.url));
                        });
                      },
                      child: Center(
                        child: Text(
                          " > ".toString() + widget.titleurl + " < ".toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            left: 40,
            right: 40,
            top: 0,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

_buildTeacherDetail({required String titail, required String value}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 10.0, top: 8.0, bottom: 15.0),
    child: Table(
      border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
      columnWidths: const {0: FractionColumnWidth(0.3), 1: FractionColumnWidth(0.05), 2: FractionColumnWidth(0.65)},
      // defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(children: [
          // if (_screenprofileResponse?.body?.profileGeneralInfo?.img == null)
          Text(
            titail,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            value,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 14),
          ),
        ])
      ],
    ),
  );
}
