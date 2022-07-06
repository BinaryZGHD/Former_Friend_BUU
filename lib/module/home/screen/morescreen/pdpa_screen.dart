import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/home/bloc/homemorebloc/homemore_bloc.dart';
import 'package:f2fbuu/module/home/model/response/scree_homemore_pdpa_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class pdpaScreen extends StatefulWidget {
  final String title;
  const pdpaScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<pdpaScreen> createState() => _pdpaScreenState();
}

class _pdpaScreenState extends State<pdpaScreen> with ProgressDialog {

  ScreenHomeMorePDPAResponse? _screenHomeMorePDPAResponse;

  @override
  Widget build(BuildContext context) {


    context.read<MoreBloc>().add(HomeMorePDPAEvent());

    return BlocListener<MoreBloc, HomemoreState>(
      listener: (context, state) {
        if (state is HomeMorePDPALoading) {
          showProgressDialog(context);
        }
        if (state is HomeMorePDPAEndLoading) {
          hideProgressDialog(context);
        }
        if (state is HomeMorePDPAError) {
          // show dialog error
          print(state.message);
        }
      },
      child: Scaffold(
        body: BlocBuilder<MoreBloc, HomemoreState>(builder: (context, state) {
          if (state is HomeMorePDPASuccessState) {
            _screenHomeMorePDPAResponse = state.responsePDPA;
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
                title: Text(widget.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: sizeTitle24,
                  ),
                ),
              ),
              body: SafeArea(
                child: Container(
                    padding: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 20),
                    color: BSC_transparent,
                    width: MediaQuery.of(context).size.width,
                    child: SfPdfViewer.network("${_screenHomeMorePDPAResponse?.body?.linkpdpa}")
                  // Image.asset(
                  //   "assets/PDPA.png",
                  //   fit: BoxFit.fill,
                  // ),
                ),
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