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
  final List<Item> _data = generateItems(1);

  @override
  Widget build(BuildContext context) {


    context.read<MoreBloc>().add(HomeMoreFAQEvent());

    return BlocListener<MoreBloc, HomemoreState>(
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
      child: BlocBuilder<MoreBloc, HomemoreState>(builder: (context, state) {
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
                title: Text(widget.title +"${_screenHomeMoreFAQResponse?.body?.faq?.length}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: sizeTitle24,
                  ),
                ),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: MyStatefulWidget(count: _screenHomeMoreFAQResponse?.body?.faq?.length ?? 0),
              ),
              ),
            );
          } else {
            return Container();
          }
        }),

    );

  }
  _buildPanel2({required String question, required String answer}  ) {
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
              title: Text(question),
            );
          },
          body: ListTile(
            title: Text(answer),
            subtitle:
             Text(answer),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  //
  // _buildPanel( String question, String answer) {
  //   return ExpansionPanelList(
  //     expansionCallback: (int index, bool isExpanded) {
  //       setState(() {
  //         _data[index].isExpanded = !isExpanded;
  //       });
  //     },
  //     children: _data.map<ExpansionPanel>((Item item) {
  //       return ExpansionPanel(
  //         headerBuilder: (BuildContext context, bool isExpanded) {
  //           return ListTile(
  //             title: Text(item.headerValue),
  //           );
  //         },
  //         body: ListTile(
  //           title: Text(item.expandedValue),
  //           subtitle:
  //           const Text('To delete this panel,\n tap \n the trash can iconTo delete this panel,\n tap \n the trash can iconTo delete this panel,\n tap \n the trash can iconTo delete this panel,\n tap \n the trash can icon'),
  //         ),
  //         isExpanded: item.isExpanded,
  //       );
  //     }).toList(),
  //   );
  // }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class MyStatefulWidget extends StatefulWidget {
  final int count;
  const MyStatefulWidget({Key? key,  required this.count}) : super(key: key);

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
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle:
              const Text('To delete this panel, tap the trash can icon'),
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
