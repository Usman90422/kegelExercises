import 'package:flutter/material.dart';
import 'package:kegel_training/constants/constant.dart';
import 'package:kegel_training/view/images_screen.dart';
import 'package:kegel_training/view/main_screens/stopwatch_screen.dart';

import '../../generated/l10n.dart';
import '../../widgets/button.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({Key? key,required this.title,required this.description,required this.time,required this.delay, required this.texts}) : super(key: key);
  final String title;
  final String description;
  final int time;
  final int delay;
  final List texts;

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.black,
            kGreyColor,
          ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,

          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.arrow_back_ios,color: Colors.grey,),
                          ),
                        ],
                      ),

                      const SizedBox(height: 40),
                      SizedBox(
                          width: size.width,
                          child:  Text(widget.title,style: const TextStyle(fontWeight:  FontWeight.w600,fontSize: 28),textAlign: TextAlign.center,)),
                      const SizedBox(height: 20),
                      SizedBox(
                          width: size.width,
                          child:  Text(widget.description,style: const TextStyle(fontSize: 15,color: Colors.grey),textAlign: TextAlign.center,)),
                    ],
                  ),
                ),
                Column(
                  children: [
                    // MyButton(onPressed: (){
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>const ImagesScreen()));
                    // }, text: S.of(context).howToFindTheRightMuscle, textColor: Colors.white, buttonColor: kGreyColor, height: 50,width: size.width,textSize: 18,borderRadius: 50,letterSpacing: 0,),
                    // const SizedBox(height: 20),

                    MyButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> StopWatch(delay: widget.delay, time: widget.time, texts: widget.texts,)));
                    }, text: S.of(context).tryText, textColor: Colors.white, buttonColor: kRedColor, height: 50,width: size.width,textSize: 18,borderRadius: 50,letterSpacing: 0,),

                  ],
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
