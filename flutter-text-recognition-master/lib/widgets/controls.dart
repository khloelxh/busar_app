import 'package:flutter/material.dart';

class ControlsWidget extends StatelessWidget {
  final VoidCallback onClickedPickImage;
  final VoidCallback onClickedScanText;
  final VoidCallback onClickedClear;
  final VoidCallback onClickedTakePic;

  const ControlsWidget({
    @required this.onClickedPickImage,
    @required this.onClickedScanText,
    @required this.onClickedClear,
    @required this.onClickedTakePic,
    Key key,
    }) : super(key: key);


  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      RaisedButton(
        onPressed: onClickedPickImage,
        child: Text('Pick Image'),
      ),
      const SizedBox(width: 10),
      // RaisedButton(
      //   onPressed: onClickedTakePic,
      //   child: Text('Take Picture'),
      // ),
      // const SizedBox(width: 10),
      RaisedButton(
        onPressed: onClickedScanText,
        child: Text('Scan Image'),
      ),
      const SizedBox(width: 10),
      RaisedButton(
        onPressed: onClickedClear,
        child: Text('Clear'),
      )
    ],
  );
  }