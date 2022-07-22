import 'dart:io' show File;
import 'package:f2fbuu/customs/dialog/dialog_widget.dart';
import 'package:f2fbuu/module/profile/bloc/profile_bloc.dart';
import 'package:f2fbuu/module/profile/components/addressdatatab.dart';
import 'package:f2fbuu/module/profile/components/careerdatatab.dart';
import 'package:f2fbuu/module/profile/components/contactdatatab.dart';
import 'package:f2fbuu/module/profile/components/educationdatatab.dart';
import 'package:f2fbuu/module/profile/components/generaldatatab.dart';
import 'package:f2fbuu/module/profile/model/response/api_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../customs/progress_dialog.dart';
import '../../../customs/size/size.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ProfileBloc(),
    child: const ProfilePage(),
    );
  }
}



class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with ProgressDialog {
  ApiProfileResponse? _apiProfileResponse;
  File? image;
  ChooseAvatarSuccess? avatarImage;
  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print('เรียก initState');
    }
    context.read<ProfileBloc>().add(ProfileApiEvent());
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(listener: (context, state) {
      if (state is ProfileLoading) {
        showProgressDialog(context);
      }
      if (state is ProfileLoadingSuccess) {
        hideProgressDialog(context);
      }
      if (state is ProfileError) {
        // print(state.errorMessage);
        dialogOneLineOneBtn(context, '${state.errorMessage}\n ', "OK", onClickBtn: () {
        // dialogOneLineOneBtn(context, state.errorMessage + '\n ', "OK", onClickBtn: () {
          Navigator.of(context).pop();
        });
      }
      if (state is GeneralSubmitSuccessState) {
        // print("TEST general");
        // print(state.responseGeneral.toJson());
        // print("TEST general");
        context.read<ProfileBloc>().add(ProfileApiEvent());
      }
      if (state is EducationSubmitSuccessState) {
        // print("TEST edu");
        // print(state.responseEducation.toJson());
        // print("TEST edu");
        context.read<ProfileBloc>().add(ProfileApiEvent());
      }
      if (state is AddressSubmitSuccessState) {
        // print("TEST address");
        // print(state.responseAddress.toJson());
        // print("TEST address");
        context.read<ProfileBloc>().add(ProfileApiEvent());
      }
      if (state is ContactSubmitSuccessState) {
        // print("TEST contact");
        // print(state.responseContact.toJson());
        // print("TEST contact");
        context.read<ProfileBloc>().add(ProfileApiEvent());
      }
      if (state is CareerSubmitSuccessState) {
        // print("TEST Career");
        // print(state.responseCareer.toJson());
        // print("TEST Career");
        context.read<ProfileBloc>().add(ProfileApiEvent());
      }
    },
      builder: (context, state) {
        if (state is ProfileApiSuccessState) {
          _apiProfileResponse = state.response;
          return buildContent(context, _apiProfileResponse, image);
        } else if (state is ChooseAvatarSuccess) {
          return buildContent(context, _apiProfileResponse, state.avatarImage);
        }
        return SafeArea(child: Scaffold(body: Container()));
      },
      buildWhen: (context, state){
      return state is ProfileApiSuccessState || state is ChooseAvatarSuccess;

      },
    );
  }

  Widget buildContent(BuildContext context,
      ApiProfileResponse? apiProfileResponse, File? image) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
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
            '${apiProfileResponse?.body?.screeninfo?.titleprofile}'
                // '+$global_key'
            ,
            // 'ทดสอบ bloc',
            style: const TextStyle(
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
                        margin: const EdgeInsets.all(20),
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
                              decoration: const BoxDecoration(
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
                        margin: const EdgeInsets.all(10),
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
                            onTap: () =>
                                context
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
                        ),
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
}

