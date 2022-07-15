import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/module/home/bloc/homemorebloc/homemore_bloc.dart';
import 'package:f2fbuu/module/home/model/response/screen_homemore_faq_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FaqScreen extends StatefulWidget {
  final String title;
  const FaqScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> with ProgressDialog {
  ScreenHomeMoreFAQResponse? _screenHomeMoreFAQResponse;

  @override
  Widget build(BuildContext context)
  {
    context.read<MoreBloc>().add(HomeMoreFAQEvent());
    return  BlocConsumer<MoreBloc, HomemoreState>(
      listener: (context, state) {
        if (state is HomeMoreFAQLoading) {
          showProgressDialog(context);
        }
        if (state is HomeMoreFAQEndLoading) {
          hideProgressDialog(context);
        }
        if (state is HomeMoreFAQError) {
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
        if (state is HomeMoreFAQSuccessState) {
          _screenHomeMoreFAQResponse = state.responseFAQ;
          return buildContent(context,_screenHomeMoreFAQResponse);
        }


        return Scaffold(body: Container(
          color: Colors.white,
        ));
      },
      buildWhen: (context, state) {
        return state is HomeMoreFAQSuccessState ;
      },
    );
  }
  buildContent(BuildContext context, ScreenHomeMoreFAQResponse? screenHomeMoreFAQResponse) {
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
        title: Text(" FAQ ${_screenHomeMoreFAQResponse?.body?.faq?.length}",
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
  final ScreenHomeMoreFAQResponse? screenHomeMoreFAQResponse ;
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
                  fontSize: 18,
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
