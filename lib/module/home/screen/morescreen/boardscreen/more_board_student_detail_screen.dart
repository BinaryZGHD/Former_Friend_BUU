import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/home/bloc/homemorebloc/homemore_bloc.dart';
import 'package:f2fbuu/module/home/model/response/screen_homemore_board_student_response.dart';
import 'package:f2fbuu/module/home/screen/morescreen/boardscreen/BuildListStudent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class moreBoardStudentDetailScreen extends StatefulWidget {
  final String title;
  const moreBoardStudentDetailScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<moreBoardStudentDetailScreen> createState() => _moreBoardStudentDetailScreenState();
}

class _moreBoardStudentDetailScreenState extends State<moreBoardStudentDetailScreen> with ProgressDialog {
  ScreenHomeMoreBoardStudentResponse? _screenHomeMoreBoardStudentResponse;

  @override
  Widget build(BuildContext context) {
    context.read<HomemoreBloc>().add(HomeMoreBoardStudentEvent());

    return BlocListener<HomemoreBloc, HomemoreState>(
      listener: (context, state) {
        if (state is HomeMoreBoardStudentLoading) {
          showProgressDialog(context);
        }
        if (state is HomeMoreBoardStudentEndLoading) {
          hideProgressDialog(context);
        }
        if (state is HomeMoreBoardStudentError) {
          print("show dialog error");
          // show dialog error
          print(state.message);
        }
      },
      child: Scaffold(
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
            "${widget.title}",
            style: TextStyle(
              color: Colors.black,
              fontSize: sizeTitle24,
            ),
          ),
        ),
        body: BlocBuilder<HomemoreBloc, HomemoreState>(builder: (context, state) {
          if (state is HomeMoreBoardStudentSuccessState) {
            _screenHomeMoreBoardStudentResponse = state.responseBoardStudent;
            return SingleChildScrollView(
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

                    padding:  EdgeInsets.fromLTRB(5, 5, 5, 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                    ),

                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Container(height: 35,),
                          _buildListStudentDetail(titail: "ชื่อ", value: "Lastname"),
                          _buildListStudentDetail(titail: "ชื่อเล่น", value: "Lastname"),
                          _buildListStudentDetail(titail: "รุ่น", value: "65"),
                          _buildListStudentDetail(titail: "รหัสนิสิต", value: "62X3X3XX"),
                          _buildListStudentDetail(titail: "อาจารย์ที่ปรึกษา", value: "อาจารย์ที่ปรึกษา"),
                          _buildListStudentDetail(titail: "เบอร์โทรศํพท์", value: "62X3X3XX"),
                          _buildListStudentDetail(titail: "ช่องทางการติดต่อ", value: "ช่องทางการติดต่อ"),
                          _buildListStudentDetail(titail: "สายงาน", value: "สายงาน"),
                          _buildListStudentDetail(titail: "สถานะการทำงาน", value: "สถานะการทำงาน"),
                          _buildListStudentDetail(titail: "ชื่อสถานที่ทำงาน", value: "ชื่อสถานที่ทำงาน"),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
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
              ]),
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}

_buildListStudentDetail({required String titail, required String value}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 10.0, top: 8.0, bottom: 15.0),
    child: Table(
      border: TableBorder.symmetric(outside: BorderSide(width: 2, color: Colors.transparent)),
      columnWidths: {0: FractionColumnWidth(0.3), 1: FractionColumnWidth(0.05), 2: FractionColumnWidth(0.65)},
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
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
