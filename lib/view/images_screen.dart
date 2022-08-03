import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stories/flutter_stories.dart';
import 'package:kegel_training/constants/constant.dart';
import 'package:kegel_training/view/session_screens/before_start_screen2.dart';
import 'package:kegel_training/view/main_screens/exercise_list.dart';
import 'package:kegel_training/widgets/button.dart';
import 'package:story_view/story_view.dart';

import '../generated/l10n.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({Key? key,this.forBeforeStartScreen}) : super(key: key);

  final bool? forBeforeStartScreen;

  @override
  _ImagesScreenState createState() => _ImagesScreenState();
}

final controller = StoryController();

var momentCount = 5;
var momentDuration = const Duration(seconds: 5);

final images = List.generate(
  momentCount,
  (index) => Image(
    image: AssetImage('assets/images/${index}.jpg'),
  ),
);

class _ImagesScreenState extends State<ImagesScreen> {


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Story(
            fullscreen: false,
            onFlashForward: () {
              setState(() {
                _showModalBottomSheet();
              });
            },
            momentCount: 5,
            momentDurationGetter: (index) => momentDuration,
            momentBuilder: (context, index) => images[index],
          ),
        ),
      ),
    );
  }

  _showModalBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isDismissible: false,
      context: context,
      builder: (context) {
        var size = MediaQuery.of(context).size;
        return WillPopScope(
            onWillPop: () async => false,
            child: Container(
              margin: EdgeInsets.all(20),
              height: size.height * 0.35,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(50),
                gradient: const LinearGradient(
                  colors: [
                    kDarkGreyColor,
                    kGreyColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: size.width * 0.8,
                      child:  Text(
                        S.of(context).didYouManaged,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 25),
                        textAlign: TextAlign.center,
                      )),
                  const SizedBox(height: 40),
                  MyButton(
                      onPressed: () {
                        if(widget.forBeforeStartScreen==null){
                          int count = 2;
                          Navigator.of(context).popUntil((_) => count-- <= 0);
                        }
                       else{

                          int count = 4;
                          Navigator.of(context).popUntil((_) => count-- <= 0);
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>const BeforeStartScreen2()));
                        }
                      },
                      text: S.of(context).yesIDid,
                      textColor: Colors.white,
                      buttonColor: kGreyColor,
                      height: 50,
                      width: size.width * 0.8,
                      letterSpacing: 0,
                      borderRadius: 50,
                      textSize: 18),
                  const SizedBox(height: 20),
                  MyButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    super.widget));
                      },
                      text: S.of(context).noIDont,
                      textColor: kRedColor,
                      buttonColor: kGreyColor,
                      height: 50,
                      width: size.width * 0.8,
                      letterSpacing: 0,
                      borderRadius: 50,
                      textSize: 18),
                ],
              ),
            ));
      },
    );
  }
}
