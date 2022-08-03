import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:kegel_training/controller/progress_controller.dart';
import 'package:kegel_training/provider/change_language.dart';
import 'package:kegel_training/view/session_screens/session_completion_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/constant.dart';
import '../../generated/l10n.dart';
import '../../model/sessionModel.dart';
import '../../model/stopWatchModel.dart';
import '../../provider/session_provider.dart';
import '../../widgets/stopwatch.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({Key? key}) : super(key: key);

  @override
  _SessionScreenState createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {


  final progressController=ProgressController();
  late Map progressDetails;

  String userId='';

  getId()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('UniqueUserId')!;
    });
  }

  Timer? timer;
  int countDown = 3;
  bool countDownStop = false;
  int idx=0;

  bool disableTouch=false;
  int holdingTime=10;

  List<StopWatchModelClass> stopWatchWidgets=[];


  final sessionProvider=SessionProvider();

  void scrollToIndex(index) {
    scrollController.animateTo( index,
        duration: const Duration(seconds: 2), curve: Curves.easeIn);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getId();
    startCountDown();
    Future.delayed(const Duration(seconds: 3), () async {
      setState(() {
        countDownStop = true;
      });
    });
  }


  void startCountDown() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countDown != 0) {
        setState(() {
          countDown--;
        });
      } else {
        return timer.cancel();
      }
    });
  }
  final scrollController = ScrollController();
  void scrollTo(index) {
    scrollController.animateTo(60.0*index,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer!.cancel();
  }

  List<String> exerciseNames=[];
  List exerciseTexts=[];

  String sessionId='';


  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<SessionProvider>(context);
    final languageProvider=Provider.of<ChangeLanguageProvider>(context);

    if(stopWatchWidgets.isEmpty){
      print(provider.sessionIndex);
      populateStopWatchWidgetList(provider.sessions[provider.sessionIndex].exercises,languageProvider.language);
      setState(() {
        sessionId=provider.sessions[provider.sessionIndex].id;
      });
    }

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AbsorbPointer(
              absorbing: countDown != 0 ? true : false,
              child: Container(
                height: size.height,
                width:  size.width,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kDarkGreyColor),
                              child:  Center(
                                  child: Text(
                                    S.of(context).FAQ,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                          GestureDetector(
                            onTap: ()async{

                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kDarkGreyColor),
                              child: const Center(
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 20,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (countDownStop == true)
                      getStopWatch(exerciseNames[idx],),


                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  idx==0 ?null:
                                  setState(() {
                                    if(idx!=0)
                                    {
                                      idx--;
                                      double ind=idx.toDouble();
                                      scrollTo(ind);
                                    }
                                  });
                                },
                                child:  Icon(
                                  Icons.arrow_back_ios,
                                  color: idx!=0 ? Colors.white : Colors.grey,
                                  size: 40,
                                ),
                              ),

                              Text(exerciseNames[idx],style: const TextStyle(fontSize: 20),),

                              GestureDetector(
                                onTap: (){
                                  idx==exerciseNames.length-1? null :
                                  setState(() {
                                    if(idx!=exerciseNames.length-1 )
                                    {
                                      idx++;
                                      double ind=idx.toDouble();
                                      scrollTo(ind);
                                    }

                                  });
                                },
                                child:  Icon(
                                  Icons.arrow_forward_ios,
                                  color: idx!=exerciseNames.length-1 ? Colors.white : Colors.grey,
                                  size: 40,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),
                        SizedBox(
                          height: size.height * 0.05,
                          width: size.width * 0.8,
                          child: ListView.builder(
                              clipBehavior: Clip.none,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              controller: scrollController,
                              itemCount: exerciseNames.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Text(exerciseNames[index],style: TextStyle(color: index==idx ? Colors.white: Colors.grey ),));
                              }),
                        ),

                        Padding(
                            padding: const EdgeInsets.only(
                              bottom: 20,),
                            child:SizedBox(
                              width: size.width*0.8,
                              height: 50,
                              child: AbsorbPointer(
                                absorbing: disableTouch ? true: false,
                                child: ElevatedButton(
                                  onPressed: (){
                                    if(idx==exerciseNames.length-1)
                                    {
                                      print("USER ID: "+ userId);
                                      print("session ID: "+ sessionId);

                                      progressDetails={
                                        "user_id": userId,
                                        "session": sessionId,
                                        "status": "Complete",
                                      };
                                      provider.setCompletedSessionId(sessionId);
                                      progressController.postProgress(progressDetails);
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SessionCompleteScreen()));
                                    }
                                    else
                                    {
                                      return null;
                                    }
                                  },
                                  child:  Text(S.of(context).Finish,style: TextStyle(fontWeight: FontWeight.bold),),
                                  style: ElevatedButton.styleFrom(
                                      primary: idx==exerciseNames.length-1 ?  kRedColor :kDarkGreyColor,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                                ),
                              ),
                            )
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            if (countDown != 0)
              Container(
                color: Colors.black.withOpacity(0.5),
                height: size.height,
                width: size.width,
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    Text(
                      S.of(context).prepareFor,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Session",
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(height: size.height / 6),
                    Center(
                        child: Text(
                          "$countDown",
                          style: const TextStyle(
                            fontSize: 100,
                          ),
                        )),
                  ],
                ),
              ),
          ],
        ),
      ),
    );

  }

  Widget getStopWatch(String name,){
    for(StopWatchModelClass obj in stopWatchWidgets){
      log(obj.text.toString());
      if(name==obj.name) {
        return MyStopWatch(
          lang: obj.lang,
          texts: obj.text,
          key: obj.key,
          name: obj.name,
          seconds: obj.time,
          vibrationIntervals: obj.vibrationInterval,
          constantVibration: obj.contVibration,
        );
      }
    }

    return Container();

  }

  void populateStopWatchWidgetList(List<Exercise> exerciseList,String  lang) {
    for (Exercise exercise in exerciseList) {
      exerciseNames.add(exercise.title);
      stopWatchWidgets.add(
          StopWatchModelClass(exercise.title, exercise.time, 500, false, UniqueKey(),exercise.text,lang));
    }
  }
}
