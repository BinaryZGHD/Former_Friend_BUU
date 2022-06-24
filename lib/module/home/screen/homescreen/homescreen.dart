import 'package:f2fbuu/customs/button/box.dart';
import 'package:f2fbuu/module/activity/screen/add_activity.dart';
import 'package:f2fbuu/module/login/screen/loginscreen/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../customs/button/buttoncustom.dart';
import '../../../../customs/color/colorconts.dart';
import '../../../../customs/progress_dialog.dart';
import '../../../../customs/size/size.dart';
import '../../bloc/homebloc/home_bloc.dart';
import '../../model/response/screen_home.dart';
import '../../../profile/screen/profile_page.dart';
import '../../bloc/buildlistactivity.dart';
import '../morescreen/moremainscreen.dart';
import 'drawerhome.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with ProgressDialog {
  ScreenHomeResponse? _screenhomeResponse;

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(HomeScreenInfoEvent());

    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeLoading) {
          showProgressDialog(context);
        }
        if (state is HomeEndLoading) {
          hideProgressDialog(context);
        }
        if (state is HomeError) {
          // show dialog error
          print(state.message);
        }
      },
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state is HomeScreenInfoSuccessState) {
            _screenhomeResponse = state.response;
            return Scaffold(
              drawer: Drawer(
                child: drawerhome(
                  context,
                  _screenhomeResponse,
                ),
              ),
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
                child: AppBar(
                  backgroundColor: Colors.white,
                  leading: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: const Icon(Icons.settings, color: TC_Black),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                      );
                    },
                  ),
                  title: Center(
                      child: Text("${_screenhomeResponse?.body?.screeninfo?.titlestatus}",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: TC_Black))),
                  actions: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: BC_ButtonWhite,
                      // height: MediaQuery.of(context).size.height*0.1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              BuildListActivity(
                                context,
                                _screenhomeResponse,
                              ),
                              SizedBox(
                                  // height: MediaQuery.of(context).size.height * 0.2,
                                  ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                    child: ButtonCustom(
                        label: "     " + "  ADD  " + "     ",
                        colortext: TC_Black,
                        colorbutton: BC_ButtonWhite,
                        sizetext: sizeTextSmaller14,
                        colorborder: BSC_Black,
                        onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => addActivity()));
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),

                    // padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      color: BC_ButtonWhite,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: IconButton(
                            icon: Icon(Icons.account_circle, color: Colors.black, size: 50),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                            },
                          )),
                          Expanded(
                              child: IconButton(
                            icon: Icon(Icons.home, color: Colors.blue, size: 50),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => loginScreen()));
                            },
                          )),
                          Expanded(
                              child: IconButton(
                            icon: Icon(Icons.auto_awesome_mosaic, color: Colors.black, size: 50),
                            onPressed: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MoreMainScreen()));
                            },
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
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
