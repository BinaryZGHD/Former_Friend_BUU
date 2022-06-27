import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class commingSoonScreen extends StatefulWidget {
  const commingSoonScreen({Key? key}) : super(key: key);

  @override
  State<commingSoonScreen> createState() => _commingSoonScreenState();
}

class _commingSoonScreenState extends State<commingSoonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Text(
              "COMMING",
              style: TextStyle(color: Colors.red,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "SOON",

              style: TextStyle(color: Colors.red,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "   No information found  \nin the current database.",

                style: TextStyle(color: Colors.grey,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[200],
              child: IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(
                Icons.arrow_back,color: Colors.grey,
              ),

              ),
            )
          ],
        ),

      ),
    );
  }
}
