import 'dart:async';
import 'dart:developer';
import "package:flutter/material.dart";
import 'package:kegel_training/constants/constant.dart';
import 'package:kegel_training/provider/change_language.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

import '../widgets/button.dart';

class MyStopWatch extends StatefulWidget {
   const MyStopWatch({Key? key,required this.lang,required this.seconds, required this.vibrationIntervals, this.constantVibration,this.name,required this.texts}) : super(key: key);
  final int seconds;
  final int vibrationIntervals;
  final bool? constantVibration;
  final String? name;
  final List texts;
  final String lang;

  @override
  _MyStopWatchState createState() => _MyStopWatchState();
}

class _MyStopWatchState extends State<MyStopWatch> {
  Timer? timer;
  String value="";

  late int seconds = widget.seconds;
  late int vibrationIntervals=widget.vibrationIntervals;
  int counter=0;


List textlist=[];

  rebuild(){
      setState(() {
      seconds=widget.seconds;
      startTimer();
      startVibration();
    });
  }

  getPattern() {
    List<int> pattern=[0,vibrationIntervals];
    for(int j=0;j<seconds*2;j++){
      pattern.add(vibrationIntervals);
    }
    return pattern;
  }

  getPatternForConstantVibration() {
    List<int> pattern=[0,widget.seconds*1000];
    return pattern;
  }

  changeText(){
    if(counter>=widget.texts.length) {
      setState(() {
        counter=0;
      });
    }

    String value1 =textlist[counter];
    print(value1);
    counter++;

    return value1;
  }

  startVibration() {
    Vibration.vibrate(
      pattern: widget.constantVibration==true ? getPatternForConstantVibration() :getPattern(),
      amplitude: 1,
    );
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds != 0) {
        setState(() {
          seconds--;
          startVibration();
        });
      } else {
         timer.cancel();
         Vibration.cancel();
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
    startVibration();
    getdata(widget.lang);
  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Vibration.cancel();
    timer!.cancel();
  }

void getdata(String lang)
{
  var list=widget.texts;
  for(int i=0;i<list.length;i++ )
  {
    if(lang=='en')
      {
        textlist.add(list[i].en);
      }

    if(lang=='ar')
    {
      textlist.add(list[i].ar);
    }
  }
}



  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<ChangeLanguageProvider>(context);
    var size = MediaQuery.of(context).size;
   // getLanguage(provider.language);
    return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: size.height * 0.26,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(color: kGreyColor, width: 25)),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            height: size.height * 0.4,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                    color: kGreyColor,
                    width: widget.constantVibration==true? 80 : seconds.isOdd ? 80 : 0)),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 10),
              child: CircularPercentIndicator(
                radius: 90.0,
                lineWidth: seconds != 0 ? 4 : 1,
                startAngle: 180,
                animation: true,
                percent: 1,
                circularStrokeCap: CircularStrokeCap.round,
                backgroundWidth: 1,
                animationDuration: seconds * 1000,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$seconds",
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 60),
                    ),
                    Text(changeText()),
                  ],
                ),
                backgroundColor: Colors.grey,
                progressColor:
                seconds != 0 ? Colors.white : Colors.grey,
              ),
            ),
          ),
        ],
    );

  }
}
