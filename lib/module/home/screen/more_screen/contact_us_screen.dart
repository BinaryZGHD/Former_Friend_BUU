
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/module/home/bloc/more_bloc/more_bloc.dart';
import 'package:f2fbuu/module/home/screen/more_widget/contact_us_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => MoreBloc()..add(MoreContactUsEvent()),
        child: const ContactUsPage());
  }
}

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}
Future<void> _launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $url';
  }
}
class _ContactUsPageState extends State<ContactUsPage> with ProgressDialog {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoreBloc, MoreState>(
      listener: (context, state) {
        if (state is MoreContactUsLoading) {
          showProgressDialog(context);
        }
        if (state is MoreContactUsEndLoading) {
          hideProgressDialog(context);
        }
        if (state is MoreContactUsError) {
          // show dialog error
          if (kDebugMode) {
            print(state.message);
          }
        }
      },
      builder: (context, state) {
        if (state is MoreContactUsSuccessState) {
          return contactUsWidget(context,setState,_launchInBrowser);
        } else {
          return Container();
        }
      },

    );
  }
}
