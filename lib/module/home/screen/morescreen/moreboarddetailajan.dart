import 'package:flutter/material.dart';

class DetailAjanScreen extends StatelessWidget {
  const DetailAjanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('รายละเอียดการขออนุมัติการเข้าร่วมกิจกรรม'),
    ));
  }
}
