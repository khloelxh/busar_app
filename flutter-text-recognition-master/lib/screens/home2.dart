import 'package:text_recognition_project/widgets/text_recog.dart';
import 'package:flutter/material.dart';

// void main() => runApp(Home2());

class Home2 extends StatelessWidget {
  final String title = 'Text Recognition';


  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(primarySwatch: Colors.blue),
    home: HomePage(title: title),
  );

}

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({
    @required this.title,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
    ),
    body: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const SizedBox(height: 25),
          TextRecognitionWidget(),
          const SizedBox(height: 15),
        ],
      ),
    ),
  );
}
