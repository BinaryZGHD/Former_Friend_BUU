import 'package:f2fbuu/module/home/model/response/more_response/screen_more_faq_response.dart';
import 'package:f2fbuu/module/home/screen/more_widget/faq_widget.dart';
import 'package:flutter/material.dart';

fagBody(BuildContext context, ScreenMoreFAQResponse? screenHomeMoreFAQResponse) {
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
          size: 24,
          color: Colors.black,
        ),
      ),
      title: Text(
        "${screenHomeMoreFAQResponse?.body?.screeninfo?.titleafq}",
        style: const TextStyle(
          color: Colors.black,
          fontSize: 24,
        ),
      ),
    ),
    body: SafeArea(
      child: SingleChildScrollView(
        child: FAQWidget(
          count: screenHomeMoreFAQResponse?.body?.faq?.length ?? 0,
          screenHomeMoreFAQResponse: screenHomeMoreFAQResponse,
        ),
      ),
    ),
  );
}
