import 'package:f2fbuu/customs/commingsoon_screen.dart';
import 'package:f2fbuu/customs/progress_dialog.dart';
import 'package:f2fbuu/customs/size/size.dart';
import 'package:f2fbuu/module/home/bloc/homemorebloc/homemore_bloc.dart';
import 'package:f2fbuu/module/home/model/response/screen_homemore_faq_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  return List<Item>.generate(
      20, (int index) {
    return Item(
      headerValue: " I have App with : ${index +1 }",
      expandedValue: 'คำตอบ $index',
    );
  });
}


class faqScreen extends StatefulWidget {
  final String title;
  const faqScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<faqScreen> createState() => _faqScreenState();
}

class _faqScreenState extends State<faqScreen> with ProgressDialog {
  ScreenHomeMoreFAQResponse? _screenHomeMoreFAQResponse;

  final List<Item> _data = generateItems(18);
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
      child: Scaffold(
        body: BlocBuilder<MoreBloc, HomemoreState>(builder: (context, state) {
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
                  child: Container(

                    child: _buildPanel(),
                  ),
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
            const Text('To delete this panel,\n tap \n the trash can iconTo delete this panel,\n tap \n the trash can iconTo delete this panel,\n tap \n the trash can iconTo delete this panel,\n tap \n the trash can icon'),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}



