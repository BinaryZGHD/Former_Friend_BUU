import 'package:f2fbuu/customs/commingsoon_screen.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/home/bloc/homemorebloc/homemore_bloc.dart';
import 'package:f2fbuu/module/home/model/response/screen_homemore_faq_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class faqScreen extends StatefulWidget {
  final String title;
  const faqScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<faqScreen> createState() => _faqScreenState();
}

class _faqScreenState extends State<faqScreen> with ProgressDialog {
  ScreenHomeMoreFAQResponse? _screenHomeMoreFAQResponse;

  @override
  Widget build(BuildContext context) {


    context.read<HomemoreBloc>().add(HomeMoreFAQEvent());

    return BlocListener<HomemoreBloc, HomemoreState>(
      listener: (context, state) {
        if (state is HomeMoreFAQLoading) {
          showProgressDialog(context);
        }
        if (state is HomeMoreFAQEndLoading) {
          hideProgressDialog(context);
        }
        if (state is HomeMoreFAQError) {
          // show dialog error
          print(state.message);
        }
      },
      child: Scaffold(
        body: BlocBuilder<HomemoreBloc, HomemoreState>(builder: (context, state) {
          if (state is HomeMoreFAQSuccessState) {
            _screenHomeMoreFAQResponse = state.responseFAQ;
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


