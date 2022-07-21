import 'package:f2fbuu/module/home/model/response/more_response/screen_more_faq_response.dart';
import 'package:f2fbuu/module/home/screen/more_widget/faq_widget.dart';
import 'package:flutter/material.dart';


 faqPanelWidget(BuildContext context, ScreenMoreFAQResponse? screenHomeMoreFAQResponse, Type item, List<Item> data, void Function(VoidCallback fn) setState,) {
  return ExpansionPanelList(
    expansionCallback: (int index, bool isExpanded) {
      setState(() {
        data[index].isExpanded = !isExpanded;
      });
    },
    children: data.map<ExpansionPanel>((Item item) {
      return ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return ListTile(
            title: Text("${screenHomeMoreFAQResponse?.body?.faq?.elementAt(item.getIndex).question}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
        body: ListTile(
          title: Text("${screenHomeMoreFAQResponse?.body?.screeninfo?.textanswer}"),
          subtitle:
          Text("${screenHomeMoreFAQResponse?.body?.faq?.elementAt(item.getIndex).answer}" ),
          // trailing: const Icon(Icons.delete),
          // onTap: () {
          //   setState(() {
          //     _data.removeWhere((Item currentItem) => item == currentItem);
          //   });
          // }
        ),
        isExpanded: item.isExpanded,
      );
    }).toList(),
  );
}