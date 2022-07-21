import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/module/home/bloc/morebloc/more_bloc.dart';
import 'package:f2fbuu/module/home/model/response/more_response/screen_more_faq_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class FaqScreen extends StatelessWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MoreBloc()..add(MoreFAQEvent()),
        child:  const FaqPage());
  }
}
class FaqPage extends StatefulWidget {
  const FaqPage({Key? key, }) : super(key: key);

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> with ProgressDialog {
  ScreenMoreFAQResponse? _screenHomeMoreFAQResponse;

  @override
  Widget build(BuildContext context)
  {
    return  BlocConsumer<MoreBloc, MoreState>(
      listener: (context, state) {
        if (state is MoreFAQLoading) {
          showProgressDialog(context);
        }
        if (state is MoreFAQEndLoading) {
          hideProgressDialog(context);
        }
        if (state is MoreFAQError) {
          // show dialog error
          // dialogOneLineOneBtn(context, state.message + '\n \n ' + 'Do you want to continue?', "OK", onClickBtn: () {
          //   Navigator.of(context).pop();
          // });
          if (kDebugMode) {
            print(state.message);
          }
        }

      },
      builder: (context, state) {
        if (state is MoreFAQSuccessState) {
          _screenHomeMoreFAQResponse = state.responseFAQ;
          return buildContent(context,_screenHomeMoreFAQResponse);
        }


        return Scaffold(body: Container(
          color: Colors.white,
        ));
      },
      buildWhen: (context, state) {
        return state is MoreFAQSuccessState ;
      },
    );
  }

  buildContent(BuildContext context, ScreenMoreFAQResponse? screenHomeMoreFAQResponse) {
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
            size: 24,
            color: Colors.black,
          ),
        ),
        title: Text("${_screenHomeMoreFAQResponse?.body?.screeninfo?.titleafq}",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: MyStatefulWidget(count: _screenHomeMoreFAQResponse?.body?.faq?.length ?? 0, screenHomeMoreFAQResponse: _screenHomeMoreFAQResponse,),
        ),
      ),
    );

  }

}

class Item {
  Item({

    required this.getIndex,
    this.isExpanded = false,
  });

  int getIndex;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems ) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(

      getIndex: index,
    );
  });
}

class MyStatefulWidget extends StatefulWidget {
  final int count;
  final ScreenMoreFAQResponse? screenHomeMoreFAQResponse ;
  const MyStatefulWidget({Key? key,  required this.count, required this.screenHomeMoreFAQResponse}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int count = 0;
  late List<Item> _data;
  @override
  initState() {
    super.initState();

     count = widget.count;
      _data = generateItems(count);
  }




  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text("${widget.screenHomeMoreFAQResponse?.body?.faq?.elementAt(item.getIndex).question}",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
          body: ListTile(
              title: Text("${widget.screenHomeMoreFAQResponse?.body?.screeninfo?.textanswer}"),
              subtitle:
               Text("${widget.screenHomeMoreFAQResponse?.body?.faq?.elementAt(item.getIndex).answer}" ),
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
}
