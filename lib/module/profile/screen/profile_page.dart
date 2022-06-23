import 'dart:io' show File, Platform;
import 'dart:math';
import 'package:f2fbuu/module/profile/bloc/profile_bloc.dart';
import 'package:f2fbuu/module/profile/components/addressdatatab.dart';
import 'package:f2fbuu/module/profile/components/careerdatatab.dart';
import 'package:f2fbuu/module/profile/components/contactdatatab.dart';
import 'package:f2fbuu/module/profile/components/educationdatatab.dart';
import 'package:f2fbuu/module/profile/components/generaldatatab.dart';
import 'package:f2fbuu/module/profile/model/response/api_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import '../../../customs/progress_dialog.dart';
import '../../../customs/size/size.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with ProgressDialog {
  ApiProfileResponse? _apiProfileResponse;
  File? image;
  ChooseAvatarSuccess? avatarimg;
  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;
  //     final imageTemp = File(image.path);
  //     setState(() => this.image = imageTemp);
  //     print(imageTemp);
  //   } on PlatformException catch (e) {
  //     print('Failed to pick image');
  //   }
  // }

//---------------------------------API----------------------------------------//
//   String imgurl = 'https://picsum.photos/250?image=9';
  @override
  void initState() {
    super.initState();
    print('เรียก initState');
    context.read<ProfileBloc>().add(ProfileApiEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(listener: (context, state) {
      if (state is ProfileLoading) {
        showProgressDialog(context);
      }
      if (state is ProfileLoadingSuccess) {
        hideProgressDialog(context);
      }
      if (state is ProfileError) {
        print(state.errormessage);
      }
    }, child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      if (state is ProfileApiSuccessState) {
        _apiProfileResponse = state.response;
        return buildContent(context,_apiProfileResponse,image);
      }else if (state is ChooseAvatarSuccess){
        return buildContent(context,_apiProfileResponse,state.avatarimg);
      }
      return Scaffold(body: Container());
    }));
  }
}

Widget buildContent(BuildContext context,ApiProfileResponse? apiProfileResponse,File? image){
  var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
              title: Text(
                '${apiProfileResponse?.body?.screeninfo?.titleprofile}',
                // 'ทดสอบ bloc',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: sizeTitle24,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      // MaterialButton(
                      //     color: Colors.blue,
                      //     child: Text('Pick image'),
                      //     onPressed: (){
                      //       pickImage();
                      // }),
                      Container(
                          height: height * 0.3,
                          width: width,
                          color: HexColor('#FFF7FD'),
                          child: image == null
                              ?
                              // Icon(
                              //         Icons.account_circle,
                              //         size: 100,
                              //       )
                              Container(
                                  height: 150,
                                  width: 150,
                                  margin: EdgeInsets.all(20),
                                  child: InkWell(
                                    onTap: () {
                                      context
                                          .read<ProfileBloc>()
                                          .add(ChangeAvatarRequest());
                                      // pickImage();
                                    },
                                    child: CircleAvatar(
                                      radius: 40,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.red,
                                              Colors.orange,
                                              Colors.yellow,
                                              Colors.green,
                                              Colors.blue,
                                              Colors.purple,
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 50,
                                  width: 50,
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: FileImage(image),
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(
                                          Colors.white.withOpacity(0.1),
                                          BlendMode.dstATop),
                                    ),
                                  ),
                                  child: InkWell(
                                      onTap: () => context
                                          .read<ProfileBloc>()
                                          .add(ChangeAvatarRequest()),
                                      // onTap: () => pickImage(),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: FileImage(image),
                                          ),
                                        ),
                                      )
                                      // CircleAvatar(
                                      //   backgroundColor: Colors.transparent,
                                      //   child: ClipRRect(
                                      //     borderRadius: BorderRadius.circular(100.0),
                                      //     child:
                                      //     Image.file(
                                      //       File(image?.path??''),
                                      //       fit: BoxFit.cover,
                                      //     ),
                                      //   ),
                                      // ),

                                      ),

                                  // CircleAvatar(
                                  //   // backgroundImage: NetworkImage(imgurl),
                                  //   backgroundImage: FileImage(image!),
                                  //   // child: Image.file(image!),
                                  // )
                                )),
                    ],
                  ),
                  ProfileGeneralDataHead(dataFromAPI: apiProfileResponse),
                  ProfileEducationDataHead(dataFromAPI: apiProfileResponse),
                  ProfileAddressDataHead(dataFromAPI: apiProfileResponse),
                  ProfileContactDataHead(dataFromAPI: apiProfileResponse),
                  ProfileCareerDataHead(dataFromAPI: apiProfileResponse),
                ],
              ),
            ));
}

////////////////////////////////////////////////////////////////////////////////
// class ProfileDataHead extends StatelessWidget {
//   final String textleft;
//   final String textright;
//   final double textleftfontsize;
//   final double textrightfontsize;
//
//   ProfileDataHead(
//       {required this.textleft,
//       required this.textright,
//       required this.textleftfontsize,
//       required this.textrightfontsize});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border(
//             top: BorderSide(width: 1, color: Colors.black12),
//             bottom: BorderSide(width: 1, color: Colors.transparent)),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Row(
//           children: [
//             Text(
//               textleft,
//               style: TextStyle(fontSize: textleftfontsize),
//             ),
//             Expanded(
//               child: GestureDetector(
//                 onTap: () {
//                   print('กดแก้ไข');
//                 },
//                 child: Text(textright,
//                     style: TextStyle(
//                         fontSize: textrightfontsize, color: Colors.red),
//                     textAlign: TextAlign.right),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

////////////////////////////////////////////////////////////////////////////////
// class ProfileDataTab extends StatelessWidget {
//   final String textleft;
//   final String textright;
//   bool istffreadonly = true;
//   ProfileDataTab(
//       {
//         required this.textleft,
//         required this.textright});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border(
//             top: BorderSide(width: 1, color: Colors.black12),
//             bottom: BorderSide(width: 1, color: Colors.black12)),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Row(
//           children: [
//             Text(
//               textleft,
//               style: TextStyle(fontSize: 18),
//             ),
//             Expanded(
//               child: Container(
//                 child: TextFormField(
//                   readOnly: istffreadonly,
//                   textAlign: TextAlign.right,
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                   ),
//                   initialValue: textright,
//                 ),
//
//                 // Text(
//                 //   textright,
//                 //   style: TextStyle(fontSize: 18),
//                 //   textAlign: TextAlign.right,
//                 // ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

////////////////////////////////////////////////////////////////////////////////
// class ProfileContactTab extends StatelessWidget {
//   final Widget iconcontact;
//   final String textcontact;
//   bool istffreadonly = true;
//   ProfileContactTab({required this.iconcontact, required this.textcontact});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border(
//             top: BorderSide(width: 1, color: Colors.black12),
//             bottom: BorderSide(width: 1, color: Colors.black12)),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Row(
//           children: [
//             iconcontact,
//             Expanded(
//               child: Container(
//                 child: TextFormField(
//                   readOnly: istffreadonly,
//                   textAlign: TextAlign.right,
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                   ),
//                   initialValue: textcontact,
//                 ),
//
//                 // Text(
//                 //   textright,
//                 //   style: TextStyle(fontSize: 18),
//                 //   textAlign: TextAlign.right,
//                 // ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

////////////////////////////////////////////////////////////////////////////////
// class ProfileDropdownAttentionTab extends StatefulWidget {
//   final String textleft;
//   final String itemvalue;
//   final List<String> careeritem;
//
//   const ProfileDropdownAttentionTab(
//       {Key? key,
//         required this.textleft,
//         required this.itemvalue,
//         required this.careeritem})
//       : super(key: key);
//
//   @override
//   State<ProfileDropdownAttentionTab> createState() =>
//       _ProfileDropdownAttentionTabState();
// }
//
// class _ProfileDropdownAttentionTabState
//     extends State<ProfileDropdownAttentionTab> {
//   @override
//   Widget build(BuildContext context) {
//     String textleft = widget.textleft;
//     String? itemvalue = widget.itemvalue;
//     List<String> careeritem = widget.careeritem;
//     return Container(
//       decoration: BoxDecoration(
//         border: Border(
//             top: BorderSide(width: 1, color: Colors.black12),
//             bottom: BorderSide(width: 1, color: Colors.black12)),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Row(
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width * 0.6,
//               child: Text(
//                 textleft,
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//             Expanded(
//               child: SizedBox(
//                 child: DropdownButtonFormField<String>(
//                   // alignment: Alignment.centerRight,
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                   ),
//                   value: itemvalue,
//                   items: careeritem
//                       .map((item) => DropdownMenuItem<String>(
//                       value: item, child: Text(item)))
//                       .toList(),
//                   onChanged: (item) => setState(() => itemvalue = item),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

////////////////////////////////////////////////////////////////////////////////
// class ProfileDropdownCareerDataTab extends StatefulWidget {
//   final String jobtextleft;
//   final String jobitemvalue;
//   final List<String> jobitem;
//
//   const ProfileDropdownCareerDataTab(
//       {Key? key,
//         required this.jobtextleft,
//         required this.jobitemvalue,
//         required this.jobitem})
//       : super(key: key);
//
//   @override
//   State<ProfileDropdownCareerDataTab> createState() =>
//       _ProfileDropdownCareerDataTabState();
// }
//
// class _ProfileDropdownCareerDataTabState
//     extends State<ProfileDropdownCareerDataTab> {
//   @override
//   Widget build(BuildContext context) {
//     String textleft = widget.jobtextleft;
//     String? itemvalue = widget.jobitemvalue;
//     List<String> careeritem = widget.jobitem;
//     return Container(
//       decoration: BoxDecoration(
//         border: Border(
//             top: BorderSide(width: 1, color: Colors.black12),
//             bottom: BorderSide(width: 1, color: Colors.black12)),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Row(
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width * 0.6,
//               child: Text(
//                 textleft,
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//             Expanded(
//               child: SizedBox(
//                 child: DropdownButtonFormField<String>(
//                   // alignment: Alignment.centerRight,
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                   ),
//                   value: itemvalue,
//                   items: careeritem
//                       .map((item) => DropdownMenuItem<String>(
//                       value: item, child: Text(item)))
//                       .toList(),
//                   onChanged: (item) => setState(() => itemvalue = item),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

////////////////////////////////////////////////////////////////////////////////
// class ProfileCareerDropdownTab extends StatefulWidget {
//   final String textleft;
//   final String itemvalue;
//   final List<String> careeritem;
//   final String jobtextleft;
//   final String jobitemvalue;
//   final List<String> jobitem;
//
//   const ProfileCareerDropdownTab(
//       {Key? key,
//         required this.textleft,
//         required this.itemvalue,
//         required this.careeritem,
//         required this.jobtextleft,
//         required this.jobitem,
//         required this.jobitemvalue})
//       : super(key: key);
//
//   @override
//   State<ProfileCareerDropdownTab> createState() =>
//       _ProfileCareerDropdownTabState();
// }
//
// class _ProfileCareerDropdownTabState extends State<ProfileCareerDropdownTab> {
//   late String textleft;
//   late String? itemvalue;
//   late List<String> careeritem;
//   bool isJobInStatusVisible = false;
//
//   @override
//   void initState() {
//     textleft = widget.textleft;
//     itemvalue = widget.itemvalue;
//     careeritem = widget.careeritem;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print('aaa = ' + '$itemvalue');
//     return Column(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             border: Border(
//                 top: BorderSide(width: 1, color: Colors.black12),
//                 bottom: BorderSide(width: 1, color: Colors.black12)),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Row(
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.6,
//                   child: Text(
//                     textleft,
//                     style: TextStyle(fontSize: 18),
//                   ),
//                 ),
//                 Expanded(
//                   child: SizedBox(
//                     child: DropdownButtonFormField<String>(
//                       // alignment: Alignment.centerRight,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                       ),
//                       value: itemvalue,
//                       items: careeritem
//                           .map((item) => DropdownMenuItem<String>(
//                           value: item, child: Text(item)))
//                           .toList(),
//                       onChanged: (item) {
//                         itemvalue = item;
//                         if (itemvalue == careeritem[3]) {
//                           isJobInStatusVisible = true;
//                         } else {
//                           isJobInStatusVisible = false;
//                         }
//                         setState(() {});
//                         print(item);
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Visibility(
//           visible: isJobInStatusVisible,
//           child: Column(
//             children: [
//               ProfileDropdownCareerDataTab(
//                 jobitemvalue: widget.jobitemvalue,
//                 jobtextleft: widget.jobtextleft,
//                 jobitem: widget.jobitem,
//               ),
//               ProfileCareerDataTab(
//                   textleft: 'สถานที่ทำงาน',
//                   textright: 'BUU'),
//               ProfileCareerDataTab(
//                   textleft: 'อาชีพ',
//                   textright: 'นักศึกษา'),
//               ProfileCareerDataTab(
//                   textleft: 'บริษัท',
//                   textright: 'ม.บูรพา จำกัด')
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
