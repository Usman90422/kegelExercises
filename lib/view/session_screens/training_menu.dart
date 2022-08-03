import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kegel_training/constants/constant.dart';
import 'package:kegel_training/controller/progress_controller.dart';
import 'package:kegel_training/controller/session_controller.dart';
import 'package:kegel_training/provider/session_provider.dart';
import 'package:kegel_training/view/session_screens/before_start_screen.dart';
import 'package:kegel_training/view/session_screens/before_start_screen2.dart';
import 'package:kegel_training/widgets/button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/user_controller.dart';
import '../../generated/l10n.dart';
import '../../widgets/current_goal.dart';
import '../main_screens/exercise_screen.dart';

class TrainingMenu extends StatefulWidget {
  const TrainingMenu({Key? key}) : super(key: key);

  @override
  _TrainingMenuState createState() => _TrainingMenuState();
}

class _TrainingMenuState extends State<TrainingMenu> {



final progressController=ProgressController();
List progress=[];

getProgress()async{
  progress=await progressController.getProgress();

}

String uid='';

getId()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    uid = prefs.getString('UID')!;
  });
}

final getUser=UserController();
List userDetails=[];

getUserDetails()async{
  userDetails=await getUser.getUser();
  for (int i = 0; i < userDetails.length; i++)
  {
    if (uid == userDetails[i]["uuid"] )
    {
      setState(() {
        userID=userDetails[i]['_id'];
        index=i;
      });
      break;
    }
    else{
      userID='';
    }
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setString("UniqueUserId", userID);

}
}

String userID="";
int index=0;


@override
void initState() {
  // TODO: implement initState
  super.initState();
  getId();
  getUserDetails();
  getProgress();
  if(progress.isEmpty){
    print("Empty list");
  }
  else{
    print("list");
  }
  //provider.resetSessionIndex();
  // if(progress.isEmpty){
  //   provider.resetSessionIndex();
  // }
  //
  // if(progress.isNotEmpty){
  //   if(progress[0]["session"]==progress[0]["session"]){
  //     provider.incrementSessionIndex();
  //   }
  // }
}


  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<SessionProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    // if(progress.isEmpty)
    // {
    //   provider.resetSessionIndex();
    // }
    // else if(progress[0]["session"]==progress[0]["session"])
    // {
    //   provider.incrementSessionIndex();
    // }

    return  SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CurrentGoal(),
            ),
            const SizedBox(height: 20),
            FittedBox(
              fit: BoxFit.fitHeight,
              child: Container(
                width: width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration:  BoxDecoration(
                    color: kDarkGreyColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Month 1 Day 1",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: height * 0.02),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "${S.of(context).completed} 0/2",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: height * 0.015),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                            children: [
                              Container(
                                height:15,
                                width: 15,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white24)
                                ),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                height:50,
                                width: width*0.65,
                                decoration: BoxDecoration(
                                    color: Colors.white24,
                                    borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                     Text("${S.of(context).session} 1",style: TextStyle(fontWeight: FontWeight.bold)),
                                    Row(
                                      children: const [
                                    Icon(Icons.timer,color: kDarkGreyColor,size: 15),
                                        SizedBox(width: 5),
                                        Text("1 min",style: TextStyle(color: kDarkGreyColor,fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ]
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                            children: [
                              Container(
                                height:15,
                                width: 15,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white24)
                                ),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                height:50,
                                width: width*0.65,
                                decoration: BoxDecoration(
                                  color: Colors.white24,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                     Text("${S.of(context).session} 2",style: TextStyle(fontWeight: FontWeight.bold)),
                                    Row(
                                      children: const [
                                        Icon(Icons.timer,color: kDarkGreyColor,size: 15),
                                        SizedBox(width: 5),
                                        Text("1 min",style: TextStyle(color: kDarkGreyColor,fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ]
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(color: Colors.black,height: 1,thickness: 4,),
                      const SizedBox(height: 10),
                      Center(child: Text(S.of(context).optionalSession,style: const TextStyle(fontSize: 12),)),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                            children: [
                              Container(
                                height:15,
                                width: 15,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white24)
                                ),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                height:50,
                                width: width*0.65,
                                decoration: BoxDecoration(
                                  color: Colors.white24,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                     Text("${S.of(context).session} 3",style: const TextStyle(fontWeight: FontWeight.bold)),
                                    Row(
                                      children: const [
                                        Icon(Icons.timer,color: kDarkGreyColor,size: 15),
                                        SizedBox(width: 5),
                                        Text("1 min",style: TextStyle(color: kDarkGreyColor,fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ]
                        ),
                      ),
                    ],
                  )
              ),
            ),
            const SizedBox(height: 20),
            MyButton(onPressed: (){
              if(progress.isEmpty && provider.completedSessionId.isEmpty){
                provider.resetSessionIndex();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const BeforeStartScreen()));
              }
              else
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const BeforeStartScreen2()));
                }
            }, text: S.of(context).startWorkoutSession, textColor: Colors.white, buttonColor: kRedColor, height: 50,letterSpacing: 0,width: width*0.8,borderRadius: 50,textSize: 15,)

          ],

      ),
    );
  }
}


