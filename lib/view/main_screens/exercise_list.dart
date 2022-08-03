import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kegel_training/constants/constant.dart';
import 'package:kegel_training/provider/change_language.dart';
import 'package:kegel_training/view/main_screens/exercise_screen.dart';
import 'package:kegel_training/widgets/exercise_card.dart';
import 'package:kegel_training/widgets/exercise_card2.dart';
import 'package:provider/provider.dart';

import '../../controller/exercise_controller.dart';
import '../../generated/l10n.dart';

class ExerciseList extends StatefulWidget {
  const ExerciseList({Key? key, this.showAppbar}) : super(key: key);

 final bool? showAppbar;

  @override
  _ExerciseListState createState() => _ExerciseListState();
}

class _ExerciseListState extends State<ExerciseList> {

  final exercises=ExerciseController();


  @override
  Widget build(BuildContext context) {
    final provider= Provider.of<ChangeLanguageProvider>(context);

    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: widget.showAppbar==true?null:kGreyColor.withOpacity(0.01),
      appBar:  widget.showAppbar==true?
      AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        title:   Text(S.of(context).CapitalAllExercises,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 28),textAlign: TextAlign.center,),
        leading:   GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios,color: Colors.grey,),
        ),
      ): null,
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          decoration:  BoxDecoration(
            gradient: widget.showAppbar==true ?const LinearGradient(colors: [
              Colors.black,
              kGreyColor,
            ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,

            ):null,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                   Text(S.of(context).hereYouCanRefineExercisesTechnique,style: TextStyle(fontSize: 15,color: Colors.grey),),
                 SizedBox(
                   height: size.height*0.78,
                   child: FutureBuilder(
                     future: exercises.getExercises(provider.language),
                     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                       if(snapshot.data==null)
                       {
                         return Center(child: const CircularProgressIndicator());
                       }
                       else{
                         return  ListView.builder(
                           itemCount: snapshot.data.length,
                           shrinkWrap: true,
                           scrollDirection: Axis.vertical,
                           itemBuilder: (BuildContext context, int i) {
                             return  ExerciseCard(
                               name: "${snapshot.data[i]["title"]}",
                               onPress: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                     ExerciseScreen(
                                       title: "${snapshot.data[i]["title"]}",
                                       description: '${snapshot.data[i]["description"]}',
                                       delay: snapshot.data[i]["delay"],
                                       texts: snapshot.data[i]['text'],
                                       time: snapshot.data[i]["time"],)));
                               },);
                           },
                         );
                       }

                   },),
                 ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

