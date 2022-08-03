import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kegel_training/view/main_screens/exercise_list.dart';
import 'package:kegel_training/view/session_screens/training_menu.dart';

import '../../constants/constant.dart';
import '../../generated/l10n.dart';

class TrainingHome extends StatefulWidget {
  const TrainingHome({Key? key}) : super(key: key);

  @override
  _TrainingHomeState createState() => _TrainingHomeState();
}

class _TrainingHomeState extends State<TrainingHome> {

  final PageController pageController = PageController(initialPage:0);

  bool myWorkout=true;
  bool allExercises=false;

  final List<Widget> screens =
  [
    const TrainingMenu(),
    const ExerciseList(showAppbar: false),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kGreyColor.withOpacity(0.2),
      appBar: AppBar(
        toolbarHeight: 150,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: kGreyColor.withOpacity(0.01),
        title:  Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child:
              const Icon(Icons.arrow_back_ios,color: Colors.white,),),
            Column(
              children: [
                Text(
                  S.of(context).title,
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: size.height * 0.03),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    width: size.width*0.7,
                    height: 40,
                    decoration: BoxDecoration(
                      color: kDarkGreyColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            setPage(0);
                            setState(() {
                              myWorkout=true;
                              allExercises=false;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: size.width*0.35,
                            decoration: BoxDecoration(
                              color: myWorkout==false ?  kDarkGreyColor :  kGreyColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child:  Center(child: Text(S.of(context).myWorkout,style: TextStyle(fontSize: 15, color: myWorkout==false ? Colors.grey :Colors.white ),),),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            setPage(1);
                            setState(() {
                              myWorkout=false;
                              allExercises=true;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: size.width*0.35,
                            decoration: BoxDecoration(
                              color: allExercises==true ?  kGreyColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(child: Text(S.of(context).allExercises,style: TextStyle(fontSize: 15,color: allExercises==true ?  Colors.white: Colors.grey ),),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
                onTap: () {
                 // pageController.jumpToPage(1);
                }, child: const Icon(FontAwesomeIcons.circleInfo))
          ],
        ),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: screens.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return screens[index];
        },
      ),
    );
  }

  void setPage(int index){
    setState(() {
      pageController.jumpToPage(index);
    });
  }
}
