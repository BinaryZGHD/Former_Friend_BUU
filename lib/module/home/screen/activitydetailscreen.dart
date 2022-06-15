import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../customs/color/colorconts.dart';
import '../../../customs/size/size.dart';

class ActivityDetailScreen extends StatefulWidget {
  final int id;
  final data;
  const ActivityDetailScreen({Key? key, required this.id, this.data}) : super(key: key);

  @override
  State<ActivityDetailScreen> createState() => _ActivityDetailScreenState();
}

class _ActivityDetailScreenState extends State<ActivityDetailScreen> {
  var id;
  var data;
  @override
  void initState() {

    id = widget.id;
    data = widget.data;
    super.initState();}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Center(
          child: Text(data['status'],
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
            ),
          ),
        ),
        actions: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
          ),
        ],
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    decoration: BoxDecoration(
                      color: HexColor(data['color']),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:
                    Row(
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height * 0.65,
                            width: 90,
                            margin: EdgeInsets.only(left: 10,top: 10,bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5,),
                                Expanded(child: Text("Activity name", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
                                Expanded(child: Text("Year", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
                                Expanded(child: Text("Term", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
                                Expanded(child: Text("Start date", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
                                Expanded(child: Text("Finish date", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
                                Expanded(child: Text("Total time", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
                                Expanded(child: Text("Approver", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
                                Expanded(child: Text("Venue", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
                                Expanded(child: Text("Detail  ", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
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
                            height: MediaQuery.of(context).size.height * 0.65,
                            width: 5,
                            margin: EdgeInsets.only(right: 10,top: 10,bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5,),
                                Expanded(child: Text(":", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
                                Expanded(child: Text(":", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
                                Expanded(child: Text(":", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
                                Expanded(child: Text(":", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
                                Expanded(child: Text(":", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
                                Expanded(child: Text(":", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
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
                              height: MediaQuery.of(context).size.height * 0.65,
                              // width: MediaQuery.of(context).size.width - 170,
                              margin: EdgeInsets.only(right: 5,top: 10,bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(height: 5,),
                                  Expanded(child: Container(
                                      width: double.infinity,
                                      child: Text(data["name"], style: TextStyle(fontSize: 14, color: Color(0xFF333333)),))),
                                  Expanded(child: Container(
                                      width: double.infinity,
                                      child: Text(data["year"], maxLines: 1000,style: TextStyle(fontSize: 14, color: Color(0xFF333333) ),))),
                                  Expanded(child: Container(
                                      width: double.infinity,
                                      child: Text(data["term"], style: TextStyle(fontSize: 14, color: Color(0xFF333333)),))),
                                  Expanded(child: Container(
                                      width: double.infinity,
                                      child: Text(data["sdate"], style: TextStyle(fontSize: 14, color: Color(0xFF333333)),))),
                                  Expanded(child: Container(
                                      width: double.infinity,
                                      child: Text(data["fdate"], maxLines: 1000,style: TextStyle(fontSize: 14, color: Color(0xFF333333) ),))),
                                  Expanded(child: Container(
                                      width: double.infinity,
                                      child: Text(data["tttime"]+" ( h:min ) ", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),))),
                                  Expanded(child: Container(
                                      width: double.infinity,
                                      child: Text(data["approver"], style: TextStyle(fontSize: 14, color: Color(0xFF333333)),))),
                                  Expanded(child: Container(
                                      width: double.infinity,
                                      child: Text(data["venue"], maxLines: 10,style: TextStyle(fontSize: 14, color: Color(0xFF333333) ),))),
                                  Expanded(child: Container(
                                      width: double.infinity,
                                      child:Text(data["detail"], style: TextStyle(fontSize: 14, color: Color(0xFF333333)),))),
                                  SizedBox(height: 5,),
                                ],
                              )
                          ),
                        ),



                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_circle_outline),
                        Text(data['status']),
                      ],
                    ),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}




////////////////////////////////////////////////////////////////////////////////

// class ActivityDetailScreen extends StatelessWidget {
//   final int id;
//   final data;
//
//   const ActivityDetailScreen({Key? key, required this.id, this.data})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_back,
//             size: sizeTitle24,
//             color: Colors.black,
//           ),
//         ),
//         title: Center(
//           child: Text(data['status'],
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 22,
//             ),
//           ),
//         ),
//         actions: <Widget>[
//           SizedBox(
//             width: MediaQuery.of(context).size.width * 0.1,
//           ),
//         ],
//       ),
//       body: Center(
//         child: Container(
//           height: MediaQuery.of(context).size.height * 0.8,
//           width: MediaQuery.of(context).size.width * 0.9,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 blurRadius: 10,
//                 spreadRadius: 5,
//               ),
//             ],
//           ),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
//                 child: Container(
//                   height: MediaQuery.of(context).size.height * 0.65,
//                   decoration: BoxDecoration(
//                     color: HexColor(data['color']),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child:
//                       Row(
//                         children: [
//                           Container(
//                               height: MediaQuery.of(context).size.height * 0.65,
//                               width: 90,
//                               margin: EdgeInsets.only(left: 10,top: 10,bottom: 10),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SizedBox(height: 5,),
//                                   Expanded(child: Text("Activity name", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
//                                   Expanded(child: Text("Year", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
//                                   Expanded(child: Text("Term", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
//                                   Expanded(child: Text("Start date", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
//                                   Expanded(child: Text("Finish date", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
//                                   Expanded(child: Text("Total time", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
//                                   Expanded(child: Text("Approver", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
//                                   Expanded(child: Text("Venue", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
//                                   Expanded(child: Text("Detail  ", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
//                                   SizedBox(height: 5,),
//                                 ],
//                               )
//                           ),
//                           // Container( height: 80, child: Image.asset("assets/images/Tom_Yum_Goong_C.jpg"),),
//                           // CustomImage(data["image"],
//                           //
//                           //   radius: 15,
//                           //   height: 80,
//                           // ),
//                           // SizedBox(width: 20,),
//                           Container(
//                               height: MediaQuery.of(context).size.height * 0.65,
//                               width: 5,
//                               margin: EdgeInsets.only(right: 10,top: 10,bottom: 10),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SizedBox(height: 5,),
//                                   Expanded(child: Text(":", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
//                                   Expanded(child: Text(":", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
//                                   Expanded(child: Text(":", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
//                                   Expanded(child: Text(":", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
//                                   Expanded(child: Text(":", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
//                                   Expanded(child: Text(":", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
//                                   Expanded(child: Text(":", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
//                                   Expanded(child: Text(":", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
//                                   Expanded(child: Text(":", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
//                                   SizedBox(height: 5,),
//                                 ],
//                               )
//                           ),
//                           Expanded(
//                             child: Container(
//                                 color: transparent,
//                                 height: MediaQuery.of(context).size.height * 0.65,
//                                 // width: MediaQuery.of(context).size.width - 170,
//                                 margin: EdgeInsets.only(right: 5,top: 10,bottom: 10),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisSize: MainAxisSize.max,
//                                   children: [
//                                     SizedBox(height: 5,),
//                                     Expanded(child: Container(
//                                         width: double.infinity,
//                                         child: Text(data["name"], style: TextStyle(fontSize: 14, color: Color(0xFF333333)),))),
//                                     Expanded(child: Text(data["year"], maxLines: 1000,style: TextStyle(fontSize: 14, color: Color(0xFF333333) ), textAlign: TextAlign.right,)),
//                                     Expanded(child: Text(data["term"], style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
//                                     Expanded(child: Text(data["sdate"], style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
//                                     Expanded(child: Text(data["fdate"], maxLines: 1000,style: TextStyle(fontSize: 14, color: Color(0xFF333333) ),)),
//                                     Expanded(child: Text(data["tttime"]+" ( h:min ) ", style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
//                                     Expanded(child: Text(data["approver"], style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
//                                     Expanded(child: Container(
//                                         width: double.infinity,
//                                         child: Text(data["venue"], maxLines: 10,style: TextStyle(fontSize: 14, color: Color(0xFF333333) ),))),
//                                     Expanded(child: Text(data["detail"], style: TextStyle(fontSize: 14, color: Color(0xFF333333)),)),
//                                     SizedBox(height: 5,),
//                                   ],
//                                 )
//                             ),
//                           ),
//
//
//
//                         ],
//                       ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.transparent,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.check_circle_outline),
//                       Text(data['status']),
//             ],
//           ),
//         ),
//               ),
//             ]
//       ),
//     ),
//     ),
//     );
//   }
// }
