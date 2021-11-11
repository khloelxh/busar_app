//import screens
import 'package:flutter/material.dart';
import 'package:text_recognition_project/screens/home.dart';
import 'package:text_recognition_project/util/const.dart';
import 'package:text_recognition_project/util/const.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/white.jpg"),
                      fit: BoxFit.cover))),

          Padding(
            padding:
            const EdgeInsets.only(top: 73, left: 32, right: 32, bottom: 16),
            child: Container(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset("assets/onboarding.jpg", scale: 1.0),


                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: FlatButton(
                          textColor: Constants.lightAccent,
                          color: Constants.lightAccent,
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/home');
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 16.0, right: 16.0, top: 16, bottom: 16),
                              child: Text("GET STARTED",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 16.0))),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ]));
  }
}

