import 'package:flutter/material.dart';
import 'package:kegel_training/view/session_screens/training_home.dart';
import 'package:kegel_training/widgets/button.dart';
import 'package:kegel_training/widgets/rating_view.dart';

import '../../constants/constant.dart';
import '../../generated/l10n.dart';

class SessionCompleteScreen extends StatefulWidget {
  const SessionCompleteScreen({Key? key}) : super(key: key);

  @override
  _SessionCompleteScreenState createState() => _SessionCompleteScreenState();
}

class _SessionCompleteScreenState extends State<SessionCompleteScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 500),() async{
     openRatingDialog(context);
    });
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.black,
                kGreyColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const Text(''),
                Column(
                  children: [
                    SizedBox(
                        width: size.width*0.5,
                        child: const Image(image: AssetImage("assets/images/trophy.png"),)),
                    const SizedBox(height: 20),
                     Text(S.of(context).goodJob,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 20),
                     Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(S.of(context).reminderMessage,style: TextStyle(fontSize: 15),textAlign: TextAlign.center,),
                    ),
                  ],
                ),

                Column(
                  children: [
                  MyButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const TrainingHome()));
                    },
                    text: S.of(context).ok, textColor: Colors.white, buttonColor: kRedColor, height: 50,width: size.width*0.8,letterSpacing: 0,textSize: 15,)
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

   openRatingDialog(BuildContext context){
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: kDarkGreyColor,
         child:RatingView(),
        );
      },
    );
  }
}
