import 'dart:async';
import 'dart:io';
import 'dart:ui';
//import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';

import '../details.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _text = '';
  PickedFile _image;
  final picker = ImagePicker();
  bool isInitialized = false;
  bool isLoading = false;
  final isDialOpen = ValueNotifier(false);

  //For Flutter mobile vision
  void initState() {
    FlutterMobileVision.start().then((value){
      isInitialized = true;
    });
    super.initState();
  }

  // void loading() async {
  //   this.setState(() {
  //     this.isLoading = true;
  //   });
  // }
  //
  // void doneLoading() {
  //   this.setState(() {
  //     this.isLoading = false;
  //   });
  // }

  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('Take a picture'),
          actions: [
             FlatButton(
              onPressed: scanText,
              child: Text(
                'Scan ',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),

        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.add_event,
          spaceBetweenChildren: 12,
          openCloseDial: isDialOpen,
          children: [
            SpeedDialChild(
              child: Icon(Icons.photo_album),
              label: 'Upload a photo',
              onTap: getImage,

            ),
            SpeedDialChild(
              child: Icon(Icons.add_a_photo),
              label: 'Take a picture',
              onTap: takeImage,
            ),
            SpeedDialChild(
              child: Icon(Icons.delete),
              label: 'Clear image',
            )
          ]
        ),


        // floatingActionButton: FloatingActionButton(
        //   onPressed: getImage,
        //   child: Icon(Icons.add_a_photo),
        // ),

        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: _image != null
              ? Image.file(
            File(_image.path),
            fit: BoxFit.fitWidth,
          )
              : Container(),
        )
    )
  ;

  }

  Future scanText() async {
    // For flutter mobile vision OCR
    // List<OcrText> list = [];
    // try{
    //   list= await FlutterMobileVision.read(
    //     waitTap: true,
    //     fps: 5,
    //     multiple: true,
    //   );
    //
    //   for (OcrText text in list){
    //     print('valueis ${text.value}');
    //   }
    // }catch(e){
    //
    // }


    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(File(_image.path));
    //create instance of detector
    final TextRecognizer textRecognizer =
        FirebaseVision.instance.textRecognizer();
    //process the image using the detector, and recognize the text
    final VisionText visionText =
        await textRecognizer.processImage(visionImage);

    //looping through blocks and to obtain text from image
    for (TextBlock block in visionText.blocks) {
      for (TextLine line in block.lines) {
        _text += line.text + '\n';
      }
    }

    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Details(_text)));
    setState(() {
      isLoading = false;
    });


    Widget buildProgress() {
      if (isLoading=false){
        return Icon(
            Icons.done
        );
      } else {
        // BuildContext context;
        showDialog(
          //context:context,
          builder: (context) => Center(
            child: CircularProgressIndicator(),
          ), context: context,
        );
      }
    }
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = pickedFile;
      } else {
        print('No image selected');
      }
    });
  }

  Future takeImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = pickedFile;
      } else {
        print('No image selected');
      }
    });

  }




}
