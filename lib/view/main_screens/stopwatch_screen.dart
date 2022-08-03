import 'dart:async';
import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';
import "package:flutter/material.dart";
import 'package:kegel_training/constants/constant.dart';
import 'package:kegel_training/controller/exercise_controller.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

import '../../generated/l10n.dart';
import '../../provider/change_language.dart';
import '../../widgets/button.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({Key? key,required this.texts,required this.time,required this.delay}) : super(key: key);
  final int time;
  final int delay;
  final List texts;

  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {


  Timer? timer;
  late int seconds = widget.time;
  late  int vibrationIntervals=500;
  bool visible=false;

  int counter=0;


  rebuild(){
    setState(() {
      seconds=widget.time;
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

   startVibration() {
       Vibration.vibrate(
        pattern: getPattern(),
      );
  }

  changeText(String language){
    if(counter>=widget.texts.length) {
        setState(() {
          counter=0;
        });
      }

    String value = widget.texts[counter][language];
    counter++;
    return value ;
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds != 0) {
        setState(() {
          visible=false;
          seconds--;
        // changeText();

        });
      } else {
        setState(() {
          visible=true;
        });
        return timer.cancel();
      }
    });
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
    startVibration();
     }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Vibration.cancel();
    timer!.cancel();

  }


  @override
  Widget build(BuildContext context) {
    final provider= Provider.of<ChangeLanguageProvider>(context);

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              kGreyColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Stack(
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
                duration: const Duration(milliseconds: 350),
                height: size.height * 0.4,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(
                        color: kGreyColor,
                        width: seconds.isOdd ? 80 : 0)),
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
                        // AnimatedTextKit(
                        //   repeatForever: true,
                        //   animatedTexts: [
                        //     for (int i = 0; i <= widget.texts.length; i++)
                        //     RotateAnimatedText(
                        //       widget.texts[i],
                        //       textStyle: const TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold,letterSpacing: 5),
                        //       duration:  Duration(milliseconds: widget.delay),
                        //     ),
                        //
                        //
                        //   ],
                        // ),


                      Text(changeText(provider.language)),
                      ],
                    ),
                    backgroundColor: Colors.grey,
                    progressColor:
                        seconds != 0 ? Colors.white : Colors.grey,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                child: MyButton(onPressed: (){
                  Navigator.pop(context);
                }, text: S.of(context).stop, textColor: Colors.white, buttonColor: kRedColor, height: 60,width: size.width*0.9,textSize: 18,borderRadius: 50,letterSpacing: 0,),
              ),
              if(seconds==0)
              Positioned(
                bottom: 100,
                child: AnimatedOpacity(
                  opacity: visible ? 1 : 0,
                  duration: const Duration(milliseconds: 500),
                  child: MyButton(
                    onPressed: ()  {
                       rebuild();
                  },
                    text:  S.of(context).tryAgain,
                    textColor: Colors.white,
                    buttonColor: kGreyColor,
                    height: 60,width: size.width*0.9,
                    textSize: 18,
                    borderRadius: 50,
                    letterSpacing: 0,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
