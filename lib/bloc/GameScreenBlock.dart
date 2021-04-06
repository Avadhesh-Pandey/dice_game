import 'dart:async';

import 'dart:math';

import 'file:///D:/flutter_project/doctorprofilemanagement/demo_flutter/lib/utils/CommonUIs.dart';
import 'package:flutter/cupertino.dart';

class GameScreenBlock{

  List<int> _rollHistory=List();
  int rollCount=0;
  int rollValue=0;



  final rollStreamController=StreamController<String>();

  StreamSink<String> get rollSink =>rollStreamController.sink;
  Stream<String> get rollStream =>rollStreamController.stream;

  final rollStreamHistory=StreamController<List<int>>();

  StreamSink<List<int>> get rollHistorySink =>rollStreamHistory.sink;
  Stream<List<int>> get rollHistoryStream =>rollStreamHistory.stream;

  rollTheDice(BuildContext context)
  {
    if(_rollHistory.length<5)
      {
        Random _random=Random();
        int next(int min, int max) => min + _random.nextInt(max - min);
        int v=next(1,7);
        rollSink.add("$v");
        _rollHistory.add(v);
        rollHistorySink.add(_rollHistory);
      }
    else{
      CommonUis.showToast("Max limit reached, Please reset to continue", context);
    }

  }

  resetTheDeiceValue()
  {
    _rollHistory.clear();
    rollValue=0;
    rollSink.add("$rollValue");
    rollHistorySink.add(_rollHistory);
  }


}