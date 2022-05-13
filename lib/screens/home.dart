import 'package:f2fbuu/screens/register.dart';
import 'package:flutter/material.dart';

import 'login.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Image.asset("assets/logo/profile.png"),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                color: Colors.amber[100],
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),

                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Username",),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.amber[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",),
                ),
              ),

              TextFormField(
                decoration: InputDecoration(
                  labelText: "Phone",),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  label:
                      Text("Register", style: TextStyle(fontSize: 20)),
                      onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context){
                          return RegisterScreen();
                      })
                    );
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.login),
                  label: Text("Singin", style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context){
                          return LoginScreen();
                      })
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
