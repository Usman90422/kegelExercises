import 'package:flutter/cupertino.dart';

class StopWatchModelClass {
  String name;
  int time;
  int vibrationInterval;
  bool contVibration;
  Key key;
  List text;
  String lang;
  StopWatchModelClass(
      this.name, this.time, this.vibrationInterval, this.contVibration,this.key,this.text,this.lang);
}
