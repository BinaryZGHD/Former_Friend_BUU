import 'package:f2fbuu/customs/color/colorconts.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/home/bloc/more_bloc/more_bloc.dart';
import 'package:f2fbuu/module/home/model/response/more_response/scree_more_pdpa_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class PDPAScreen extends StatelessWidget {
  const PDPAScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MoreBloc()..add(MorePDPAEvent()),
        child:  const PDPAPage());
  }
}

class PDPAPage extends StatefulWidget {
  const PDPAPage({Key? key}) : super(key: key);

  @override
  State<PDPAPage> createState() => _PDPAPageState();
}

class _PDPAPageState extends State<PDPAPage> with ProgressDialog {

  ScreenMorePDPAResponse? _screenHomeMorePDPAResponse;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoreBloc, MoreState>(
      listener: (context, state) {
        if (state is MorePDPALoading) {
          showProgressDialog(context);
        }
        if (state is MorePDPAEndLoading) {
          hideProgressDialog(context);
        }
        if (state is MorePDPAError) {
          // show dialog error
          if (kDebugMode) {
            print(state.message);
          }
        }
      },
      builder: (context, state) {
        if (state is MorePDPASuccessState) {
          _screenHomeMorePDPAResponse = state.responsePDPA;
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
              title: Text("${_screenHomeMorePDPAResponse?.body?.screeninfo?.textPDPAhead}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: sizeTitle24,
                ),
              ),
            ),
            body: SafeArea(
              child: Container(
                  padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 20),
                  color: bscTransparent,
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
      },

    );
  }
}