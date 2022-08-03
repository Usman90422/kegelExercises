import 'package:flutter/material.dart';
import 'package:kegel_training/view/session_screens/session_screen.dart';
import 'package:kegel_training/view/session_screens/training_home.dart';
import 'package:provider/provider.dart';

import '../../constants/constant.dart';
import '../../generated/l10n.dart';
import '../../provider/session_provider.dart';
import '../../widgets/button.dart';

class BeforeStartScreen2 extends StatefulWidget {
  const BeforeStartScreen2({Key? key}) : super(key: key);

  @override
  State<BeforeStartScreen2> createState() => _BeforeStartScreen2State();

  }



class _BeforeStartScreen2State extends State<BeforeStartScreen2> {


  @override
  Widget build(BuildContext context) {
    // final provider=Provider.of<SessionProvider>(context);
    // provider.getSessions();
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TrainingHome()));
                          },
                          child: const Icon(Icons.arrow_back_ios,color: Colors.grey,),
                        ),
                      ],
                    ),
                    Icon(Icons.check,color: Colors.green,size: size.width*0.8,),
                      const SizedBox(height: 20),
                       Text(S.of(context).tryTheExercise,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                      const SizedBox(height: 20),
                       Text(S.of(context).tryExerciseDesc,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),
                      ),

                    ],
                  ),
                  MyButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SessionScreen()));
                  }, text: S.of(context).letsDoThis, textColor: Colors.white, buttonColor: kRedColor, height: 50,letterSpacing: 0,width: size.width,borderRadius: 50,textSize: 15,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
