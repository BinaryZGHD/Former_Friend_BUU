




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class screens_Condition_PDPA extends StatefulWidget {
  const screens_Condition_PDPA({Key? key}) : super(key: key);

  @override
  State<screens_Condition_PDPA> createState() => _screens_Condition_PDPAState();
}

class _screens_Condition_PDPAState extends State<screens_Condition_PDPA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                // 0.1,
                0.1,
                1.0,
              ],
              colors: [

                // Colors.yellow,
                Colors.pinkAccent,
                Colors.white,

              ],
            )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Image.asset("assets/logo/Buu-logo11.png",
                //   width: MediaQuery.of(context).size.width,
                //   height: MediaQuery.of(context).size.height * 0.3,
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,),
                buildContainerTitle(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Image.asset("assets/PDPA.png",
                    fit: BoxFit.fill,
                  ),
                ),
                buildButtonComfirm(),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildContainerTitle() {
    return Container(
      constraints: BoxConstraints.expand(height: 80),

      child: Text("Terms of Service  \n and Privacy Policy",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, color: Colors.black)
      ),


    );
  }

  Row buildButtonComfirm() {
    return Row(
      children: [
        SizedBox(width: MediaQuery.of(context).size.width * 0.05,),
        Expanded(
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.3,
            child: Text("ACCEPT",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.black)
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: Colors.green[200]),
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.all(12),
          ),
        ),
         SizedBox(width: MediaQuery.of(context).size.width * 0.05,),
        Expanded(
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.3,
            child: Text("DECLINE",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.black)
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: Colors.red[200]),
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.all(12),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.05,),



      ],
    );
  }
  // Container buildButtonComfirm() {
  //   return Container(
  //     constraints: BoxConstraints.expand(height: 50),
  //
  //     child: Text("Comfirm",
  //         textAlign: TextAlign.center,
  //         style: TextStyle(fontSize: 18, color: Colors.black)
  //     ),
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(16), color: Colors.green[200]),
  //     margin: EdgeInsets.only(top: 16),
  //     padding: EdgeInsets.all(12),
  //
  //   );
  // }
}