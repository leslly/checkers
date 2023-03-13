import 'package:checkers/button.dart';
import 'package:checkers/next_view.dart';
import 'package:checkers/video_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Leslie'),
    );
  }
}

class MyHomePage extends StatefulWidget {//page one
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Column(
        children: [
          const SizedBox(height: 50),
          Center(
              child: ButtonView(
                callback: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NextView()));
                },
              ),
          ),
          SizedBox(height: 10),

           ButtonView(
            callback: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => NextView()));
            },
          ),
        ],
      ),
    );
  }
}
