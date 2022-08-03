import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kegel_training/constants/constant.dart';
import 'package:kegel_training/generated/l10n.dart';
import 'package:kegel_training/model/exercises.dart';
import 'package:kegel_training/view/main_screens/exercise_list.dart';
import 'package:kegel_training/view/session_screens/session_screen.dart';
import 'package:kegel_training/view/main_screens/stopwatch_screen.dart';
import 'package:kegel_training/view/session_screens/training_home.dart';
import 'package:kegel_training/widgets/button.dart';
import 'package:provider/provider.dart';
import '../../controller/exercise_controller.dart';
import '../../provider/change_language.dart';
import '../../provider/session_provider.dart';
import '../../widgets/current_goal.dart';

import 'exercise_screen.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {

  int currentIndex=0;
  final exercises=ExerciseController();
  final sessionProvider=SessionProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sessionProvider.getSessions();
  }


  @override
  Widget build(BuildContext context) {
    final provider= Provider.of<ChangeLanguageProvider>(context);
    final sessionProvider=Provider.of<SessionProvider>(context);

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kGreyColor.withOpacity(0.2),
      appBar: AppBar(
        toolbarHeight: 90,
        leading: const Text(""),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kGreyColor.withOpacity(0.01),
        title:  Text(
          S.of(context).title,
          style:
          TextStyle(fontWeight: FontWeight.bold, fontSize: height * 0.03,),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
                onPressed: ()  async {

                }, icon: const Icon(FontAwesomeIcons.circleInfo)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CurrentGoal(),
              ),
              const SizedBox(
                height: 20
              ),
             Container(
               margin: const EdgeInsets.symmetric(horizontal: 20),
               height: height*0.4,
               decoration:  BoxDecoration(
                 color: Colors.black,
                 borderRadius: BorderRadius.circular(20),
               ),
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                          foregroundDecoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black,
                                Colors.black,
                                Colors.transparent,
                                Colors.black
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0, 0.0, 0.0, 1],
                            ),
                          ),
                          width: width,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: const Image(image: AssetImage("assets/images/dum2.jpg"),))),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      right: 20,
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Month 1 Day 1",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: height * 0.02),
                          ),
                          // Row(
                          //   children: [
                          //     const Icon(
                          //       Icons.timer,
                          //       color: Colors.white,
                          //     ),
                          //     const SizedBox(
                          //       width: 10,
                          //     ),
                          //     Text(
                          //       "3 min",
                          //       style: TextStyle(
                          //           fontWeight: FontWeight.bold,
                          //           color: Colors.white,
                          //           fontSize: height * 0.02),
                          //     ),
                          //
                          //
                          //   ],
                          // )
                        ],
                      ),),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      child:  Column(
                        children: [
                          Text(
                            "${S.of(context).completed}:0/2",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: height * 0.028),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            S.of(context).completeDesc,
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: height * 0.02),textAlign:TextAlign.center,
                          ),
                          const SizedBox(height:20),
                          MyButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const TrainingHome()));

                          }, text: S.of(context).start, textColor: Colors.white, buttonColor: kRedColor, height: 50,letterSpacing: 0,width: width*0.8,borderRadius: 50,textSize: 20,)

                        ],
                      )),
                  ],
                )
             ),
              const SizedBox(
                height: 20
              ),
              Container(
                width: width * 0.9,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          S.of(context).CapitalAllExercises,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        Row(
                          children:  [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ExerciseList(showAppbar: true,)));
                              },
                              child:  Text(
                                S.of(context).seeAll,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                              size: 15,
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20
                    ),
                    Container(
                      color: Colors.transparent,
                      height: 60,
                      child:  FutureBuilder(
                        future: exercises.getExercises(provider.language),
                        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                        if(snapshot.data==null)
                          {
                            return const Center(child: const CircularProgressIndicator());
                          }
                        else{
                          return   ListView.builder(
                            itemCount: 4,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int i) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                      ExerciseScreen(
                                        title: "${snapshot.data[i]["title"]}",
                                        description: '${snapshot.data[i]["description"]}',
                                        delay: snapshot.data[i]["delay"],
                                        texts: snapshot.data[i]["text"],
                                        time: snapshot.data[i]["time"],

                                      ),



                                  ));
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  height: 60,
                                  width: width*0.35,
                                  decoration:  BoxDecoration(
                                      color:  kDarkGreyColor.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child:  Center(child: Text(snapshot.data[i]["title"],style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 15),)),
                                ),
                              );
                            },
                          );
                        }
                      },),



                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 20
              ),
            ],
          ),
        ),
      ),
    );
  }
}


