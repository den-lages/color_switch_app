import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color colorValue = Colors.white;
  List<Color> colorsValueList = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];

  void _changeColor() {
    Color newColor = Color(Random().nextInt(0xffffffff));
    List<Color> newColorsList = [];

    for(int i = 0; i < colorsValueList.length; i++){
      newColorsList.add(Color(Random().nextInt(0xffffffff)));
    }
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      colorValue = newColor;

      for(int i = 0; i < colorsValueList.length; i++){
        colorsValueList[i] = newColorsList[i];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: colorValue,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            text: 'M',
            style: TextStyle(
              fontSize: 30,
              color: colorsValueList[0],
            ),
            children: <TextSpan>[
              TextSpan(text: 'y', style: TextStyle(color: colorsValueList[1])),
              TextSpan(text: ' c', style: TextStyle(color: colorsValueList[2])),
              TextSpan(text: 'o', style: TextStyle(color: colorsValueList[3])),
              TextSpan(text: 'o', style: TextStyle(color: colorsValueList[4])),
              TextSpan(text: 'l', style: TextStyle(color: colorsValueList[5])),
              TextSpan(text: ' a', style: TextStyle(color: colorsValueList[6])),
              TextSpan(text: 'p', style: TextStyle(color: colorsValueList[7])),
              TextSpan(text: 'p', style: TextStyle(color: colorsValueList[8])),
            ],
          ),
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
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
              style: TextStyle(
                fontSize: 40,
                color: Colors.grey,
              ),
           ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeColor,
        tooltip: 'Change background color',
        child: const Icon(Icons.replay),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
