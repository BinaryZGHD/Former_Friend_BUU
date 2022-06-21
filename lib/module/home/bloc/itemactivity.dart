
import 'package:flutter/material.dart';

import '../../../customs/color/colorconts.dart';


class ItemActivity extends StatelessWidget {

  final data;

  final GestureTapCallback? onTap;
  ItemActivity({ Key? key, required this.data, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: BC_ButtonGreen),
              // margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.all(3),
              width: MediaQuery.of(context).size.width ,
              child: Row(
                children: [
                  Container(
                    height: 80,
                    width: 100,
                    margin: EdgeInsets.only(left: 10,top: 10,bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Expanded(child: Text("Activity name", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),

                        Expanded(child: Text("Teacher  ", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),

                        Expanded(child: Text("Period ", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
                        SizedBox(height: 5,),
                      ],
                    )
                  ),
                  // Container( height: 80, child: Image.asset("assets/images/Tom_Yum_Goong_C.jpg"),),
                  // CustomImage(data["image"],
                  //
                  //   radius: 15,
                  //   height: 80,
                  // ),
                  // SizedBox(width: 20,),
                  Container(
                      height: 80,
                      width: 5,
                      margin: EdgeInsets.only(right: 10,top: 10,bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5,),
                          Expanded(child: Text(":", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),

                          Expanded(child: Text(":", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),

                          Expanded(child: Text(":", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
                          SizedBox(height: 5,),
                        ],
                      )
                  ),
                  Expanded(
                    child: Container(
                      color: transparent,
                        height: 80,
                        // width: MediaQuery.of(context).size.width - 170,
                        margin: EdgeInsets.only(right: 5,top: 10,bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5,),
                            Expanded(child: Text(data["name"] +"  "+ data["id"].toString(), style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),

                            Expanded(child: Text(data["AJ"] + "  " + (data["id"]*2 -21).toString(), maxLines: 1000,style: TextStyle(fontSize: 14, color: Color(0xFF333333) ), textAlign: TextAlign.right,)),

                            Expanded(child: Text(data["sdate"] + " - " + data["fdate"] + " , " + data["tttime"] +" ( h:min ) ", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
                            SizedBox(height: 5,),
                          ],
                        )
                    ),
                  ),



                ],
              )
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}