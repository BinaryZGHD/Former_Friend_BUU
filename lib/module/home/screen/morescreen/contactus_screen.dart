

import 'package:f2fbuu/customs/commingsoon_screen.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/home/bloc/homemorebloc/homemore_bloc.dart';
import 'package:f2fbuu/module/home/model/response/screen_homemore_contact_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class contactUsScreen extends StatefulWidget {
  final String title;
  const contactUsScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<contactUsScreen> createState() => _contactUsScreenState();
}

class _contactUsScreenState extends State<contactUsScreen>with ProgressDialog {
  ScreenHomeMoreContactUsResponse? _screenHomeMoreContactUsResponse;

  @override
  Widget build(BuildContext context) {


    context.read<HomemoreBloc>().add(HomeMoreContactUsEvent());

    return BlocListener<HomemoreBloc, HomemoreState>(
      listener: (context, state) {
        if (state is HomeMoreContactUsLoading) {
          showProgressDialog(context);
        }
        if (state is HomeMoreContactUsEndLoading) {
          hideProgressDialog(context);
        }
        if (state is HomeMoreContactUsError) {
          // show dialog error
          print(state.message);
        }
      },
      child: Scaffold(
        body: BlocBuilder<HomemoreBloc, HomemoreState>(builder: (context, state) {
          if (state is HomeMoreContactUsSuccessState) {
            _screenHomeMoreContactUsResponse = state.responseContactUs;
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
                title: Text(widget.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: sizeTitle24,
                  ),
                ),
              ),
              body: SafeArea(
                child: commingSoonScreen(),
              ),
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}

