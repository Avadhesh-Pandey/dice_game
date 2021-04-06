import 'dart:math';

import 'file:///D:/flutter_project/doctorprofilemanagement/demo_flutter/lib/utils/AppSetings.dart';
import 'file:///D:/flutter_project/doctorprofilemanagement/demo_flutter/lib/utils/CommonUIs.dart';
import 'package:flutter/material.dart';

import 'PlayGameScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dice Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Dice Game Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CommonUis.getThemeRaisedButton("Start Game", () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) {
              return PlayGameScreen();
            }));
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CommonUis.getText("Welcome to the Dice game", AppColors.blackTxt, AppFontSize.size14, AppFonts.PoppinsRegular)
          ],
        ),
      ),
    );
  }
}
