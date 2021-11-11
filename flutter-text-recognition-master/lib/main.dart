import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import 'package:image_picker/image_picker.dart';
import 'package:text_recognition_project/screens/home.dart';
import 'package:text_recognition_project/screens/home2.dart';
import 'package:text_recognition_project/screens/onboarding.dart';
import 'package:text_recognition_project/util/const.dart';

import 'details.dart';



main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      home: MyApp()
  )
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // final floatingButtons = List<unicornbutton>();
    // floatingButtons.add(
    //   UnicornButton(
    //     hasLabel: true,
    //     labelText: "Attachment",
    //     currentButton: FloatingActionButton(
    //       heroTag: "attachment",
    //       backgroundColor: Colors.blue,
    //       mini: true,
    //       child: Icon(Icons.attach_file),
    //       onPressed: () {
    //         print('Attachment FAB clicked');
    //       },
    //     ),
    //   ),
    // );


    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.appName,
        theme: Constants.lightTheme,
        darkTheme: Constants.darkTheme,
        initialRoute: "/onboarding",
        home: Home(),
        routes: <String, WidgetBuilder>{
        "/onboarding": (BuildContext context) => new Onboarding(),
          "/home": (BuildContext context) => new Home(),
        }
    );
  }


}
