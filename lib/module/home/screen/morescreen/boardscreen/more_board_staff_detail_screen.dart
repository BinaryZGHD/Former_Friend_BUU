
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/home/bloc/homemorebloc/homemore_bloc.dart';
import 'package:f2fbuu/module/home/model/response/screen_homemore_board_teacher_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class moreBoardStaffrDetailScreen extends StatefulWidget {

  final String name;
  final String position;
  final String phone;
  final String email;
  final String titlename;
  final String titleposition;
  final String titlephone;
  final String titleemail;
  final String image;
  moreBoardStaffrDetailScreen({
    Key? key, required this.name, required this.position, required this.phone, required this.email,required this.image, required this.titlename, required this.titleposition, required this.titlephone, required this.titleemail,

  }) : super(key: key);

  @override
  State<moreBoardStaffrDetailScreen> createState() => _moreBoardStaffrDetailScreenState();
}

class _moreBoardStaffrDetailScreenState extends State<moreBoardStaffrDetailScreen> with ProgressDialog {
  ScreenHomeMoreBoardTeacherResponse? _screenHomeMoreBoardTeacherResponse;

  @override
  Widget build(BuildContext context) {
    Future<void>? _launched;

    Future<void> _launchInBrowser(Uri url) async {
      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      )) {
        throw 'Could not launch $url';
      }
    }

    context.read<HomemoreBloc>().add(HomeMoreBoardTeacherEvent());

    return BlocListener<HomemoreBloc, HomemoreState>(
      listener: (context, state) {
        if (state is HomeMoreBoardTeacherLoading) {
          showProgressDialog(context);
        }
        if (state is HomeMoreBoardTeacherEndLoading) {
          hideProgressDialog(context);
        }
        if (state is HomeMoreBoardTeacherError) {
          print("show dialog error");
          // show dialog error
          print(state.message);
        }
      },
      child: BlocBuilder<HomemoreBloc, HomemoreState>(builder: (context, state) {
          if (state is HomeMoreBoardTeacherSuccessState) {
            _screenHomeMoreBoardTeacherResponse = state.responseBoardTeacher;


            return  Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: sizeTitle24,
                    color: Colors.black,
                  ),
                ),
                title: Text(
                  "${widget.name}",
                  style: TextStyle(
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
                child: Stack(
                  children: [
                   Container(height: MediaQuery.of(context).size.height,  color: Colors.grey[200],),
                    Positioned(
                      left: 5,
                      right: 5,
                      top: 70,
                      child: Container(

                        padding:  EdgeInsets.fromLTRB(2, 5, 2, 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(40),
                            topLeft: Radius.circular(40),
                          ),
                        ),

                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            SizedBox(
                            height: 40,
                          ),
                            _buildStaffDetail(
                                titail: "${widget.titlename}", value: "${widget.name}"),
                            _buildStaffDetail(
                                titail: "${widget.titleposition}", value: "${widget.position}"),
                            _buildStaffDetail(
                                titail: "${widget.titlephone}", value: "${widget.phone}"),
                            _buildStaffDetail(
                                titail: "${widget.titleemail}", value: "${widget.email}"),
                            SizedBox(
                              height: 30,
                            ),
                            // TextButton(
                            //     onPressed: () {
                            //       setState(() {
                            //         _launched = _launchInBrowser(Uri.parse("https://sites.google.com/go.buu.ac.th/apisitp"));
                            //       });
                            //     },
                            //     child: Center(
                            //       child: Text(" > "+
                            //           "รายละเอียดเพิ่มเติม"+ " < ",
                            //         style: TextStyle(
                            //           fontSize: 14,
                            //           color: Colors.blue,
                            //         ),
                            //       ),
                            //     )),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 40,
                      right: 40,
                      top: 0,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 50.0,
                            backgroundImage: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"),
                          ),
                        ),
                      ),
                    ),

                  ]
                ),
              ),
            );
          } else {
            return Container();
          }
        }),

    );
  }
}

_buildStaffDetail({required String titail, required String value}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 10.0, top: 8.0, bottom: 15.0),
    child: Table(
      border: TableBorder.symmetric(outside: BorderSide(width: 2, color: Colors.transparent)),
      columnWidths: {0: FractionColumnWidth(0.3), 1: FractionColumnWidth(0.05), 2: FractionColumnWidth(0.65)},
      // defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(children: [
          // if (_screenprofileResponse?.body?.profileGeneralInfo?.img == null)
          Text(
            titail,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            value,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 14),
          ),
        ])
      ],
    ),
  );
}
