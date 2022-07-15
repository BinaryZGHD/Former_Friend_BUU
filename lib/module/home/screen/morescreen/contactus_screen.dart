

import 'package:f2fbuu/customs/commingsoon_screen.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/home/bloc/homemorebloc/homemore_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsScreen extends StatefulWidget {
  final String title;
  const ContactUsScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen>with ProgressDialog {

  @override
  Widget build(BuildContext context) {


    context.read<MoreBloc>().add(HomeMoreContactUsEvent());

    return BlocListener<MoreBloc, HomemoreState>(
      listener: (context, state) {
        if (state is HomeMoreContactUsLoading) {
          showProgressDialog(context);
        }
        if (state is HomeMoreContactUsEndLoading) {
          hideProgressDialog(context);
        }
        if (state is HomeMoreContactUsError) {
          // show dialog error
          if (kDebugMode) {
            print(state.message);
          }
        }
      },
      child: Scaffold(
        body: BlocBuilder<MoreBloc, HomemoreState>(builder: (context, state) {
          if (state is HomeMoreContactUsSuccessState) {
            return  Scaffold(
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
                title: Text(widget.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: sizeTitle24,
                  ),
                ),
              ),
              body: const SafeArea(
                child: CommingSoonScreen(),
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

