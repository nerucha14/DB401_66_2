import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int shade = 16777215;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(child: GestureDetector(
          onVerticalDragUpdate: (details) {
            setState(() {
              double height = MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top;
              shade = (details.localPosition.dy / height * 16777215).round();
              if (shade < 0) {
                shade = 0;
              } else if (shade > 16777215) {
                shade = 16777215;
              }
            });
            //print(details.localPosition.dy);
            //print(MediaQuery.of(context).size.height);
            //print(MediaQuery.of(context).padding.top);
          },
        )),
        backgroundColor: Color(0xFF000000 + shade),
      ),
    );
  }
}
