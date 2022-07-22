import 'package:f2fbuu/customs/size/size.dart';
import 'package:flutter/material.dart';

studentDetailBody(BuildContext context, String title) {
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
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: sizeTitle24,
        ),
      ),
    ),
    body: SafeArea (child:  Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.grey[200],
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Stack(children: [
                // Container(
                //   height: MediaQuery.of(context).size.height*1.5,
                //   color: Colors.grey[200],
                // ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.grey[200],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 70),
                  // padding: EdgeInsets.fromLTRB(5, 5, 5, 10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 35,
                        ),
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
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  left: 50,
                  right: 50,
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
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    ),),
  );
}

_buildListStudentDetail({required String titail, required String value}) {
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
