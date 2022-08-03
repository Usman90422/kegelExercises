import 'package:flutter/material.dart';
import 'package:kegel_training/constants/constant.dart';
import 'package:kegel_training/view/images_screen.dart';
import 'package:kegel_training/widgets/button.dart';

import '../../generated/l10n.dart';


class BeforeStartScreen extends StatefulWidget {
  const BeforeStartScreen({Key? key}) : super(key: key);

  @override
  _BeforeStartScreenState createState() => _BeforeStartScreenState();
}

class _BeforeStartScreenState extends State<BeforeStartScreen> {

  bool isLoading=false;
  bool visible=true;
  @override
  void initState() {

    super.initState();
    Future.delayed(const Duration(microseconds: 1),() async{
      setState(() {
        isLoading=true;
      });
    });

    Future.delayed(const Duration(seconds: 6),() async{
      setState(() {
        visible=false;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
       color: kRedColor,
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios,color: Colors.white,),),
                ],
              ),
              const SizedBox(height: 20),
              Icon(Icons.warning_amber,color: Colors.red,size: size.width*0.8,),
              const SizedBox(height: 20),
               Text(S.of(context).beforeYouStart,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
              const SizedBox(height: 20),
               Text(S.of(context).beforeYouStartDesc
              ,textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),
              ),
              const SizedBox(height: 40),
             Stack(
               children: [
                 AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: visible ? 1 : 0 ,
                    child: Stack(
                      children: [
                        Container(
                          width: size.width,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(seconds: 6),
                          width: isLoading ?size.width :size.width*0.2 ,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                         Positioned.fill(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(S.of(context).readTheInfoAbove,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),))),
                      ],
                    ),
                  ),
                 AnimatedOpacity(
                   duration: const Duration(milliseconds: 800),
                   opacity: visible ? 0 : 1 ,
                   child: MyButton(
                     onPressed: (){
                       if(visible==false) {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>const ImagesScreen(forBeforeStartScreen: true,)));
                       }
                   }, text: S.of(context).letsDoThis, textColor: Colors.black, buttonColor: Colors.white, height: 50,letterSpacing: 0,width: size.width,borderRadius: 50,textSize: 15,),
                 ),
               ],
             ) ,


            ],
          ),
        ),
      ),
    );
  }
}
