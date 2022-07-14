import 'dart:math';

import 'package:flutter/material.dart';

// cntrl + alt + L
// cntrl + alt + O

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'My cool App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color colorValue = Colors.white;
  late List<Color> colorsValueList;

  @override
  void initState() {
    super.initState();
    colorsValueList = _generateListOfRandomColors(color: Colors.white);
  }

  Color get _generateRandomColor => Color(Random().nextInt(0xffffffff));

  List<Color> _generateListOfRandomColors({Color? color}) => List.generate(
        widget.title.length,
        (index) => color ?? _generateRandomColor,
      );

  void _changeColor() {
    Color newColor = _generateRandomColor;
    List<Color> newColorsList = _generateListOfRandomColors();

    setState(() {
      colorValue = newColor;
      colorsValueList = newColorsList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorValue,
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 30),
            children: <TextSpan>[
              TextSpan(
                  text: widget.title[0],
                  style: TextStyle(color: colorsValueList[0])),
              TextSpan(
                  text: widget.title[1],
                  style: TextStyle(color: colorsValueList[1])),
              TextSpan(
                  text: widget.title[2],
                  style: TextStyle(color: colorsValueList[2])),
              TextSpan(
                  text: widget.title[3],
                  style: TextStyle(color: colorsValueList[3])),
              TextSpan(
                  text: widget.title[4],
                  style: TextStyle(color: colorsValueList[4])),
              TextSpan(
                  text: widget.title[5],
                  style: TextStyle(color: colorsValueList[5])),
              TextSpan(
                  text: widget.title[6],
                  style: TextStyle(color: colorsValueList[6])),
              TextSpan(
                  text: widget.title[7],
                  style: TextStyle(color: colorsValueList[7])),
              TextSpan(
                  text: widget.title[8],
                  style: TextStyle(color: colorsValueList[8])),
              TextSpan(
                  text: widget.title[9],
                  style: TextStyle(color: colorsValueList[9])),
              TextSpan(
                  text: widget.title[10],
                  style: TextStyle(color: colorsValueList[10])),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Your current color is:',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Text(
              '$colorValue',
              style: const TextStyle(
                fontSize: 40,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeColor,
        tooltip: 'Change background and font colors',
        child: const Icon(Icons.replay),
      ),
    );
  }
}
