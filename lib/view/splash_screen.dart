import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:kegel_training/controller/user_controller.dart';
import 'package:kegel_training/view/loading_screen.dart';
import 'package:kegel_training/view/subscription_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/change_language.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  final getUser=UserController();
  List userDetails=[];

  getUserDetails()async{
    userDetails=await getUser.getUser();
  }

  String deviceID='';

  Future<String?> getID() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) { // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor;
      // unique ID on iOS
    } else if(Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId;
     // unique ID on Android
    }
  }

  getDeviceId()async{
    deviceID=(await getID())!;
    setState(() { });
    print(deviceID);
  }



  bool isLoading=false;
  @override
  void initState() {
    getDeviceId();
     super.initState();
     getUserDetails();



    Future.delayed(const Duration(milliseconds: 10),() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("UID", deviceID);
      String? language = prefs.getString('language');
      if(language=="ar")
        {
          context.read<ChangeLanguageProvider>().requestLanguage('ar');
          context.read<ChangeLanguageProvider>().changeLocale('hi');
        }
      else
        {
          context.read<ChangeLanguageProvider>().requestLanguage('en');
          context.read<ChangeLanguageProvider>().changeLocale('en');

        }
      setState(() {
        isLoading=true;
      });

      Future.delayed(const Duration(seconds: 4),() {
      //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>   const SubscriptionScreen()));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>   LoadingScreen(userDetails: userDetails,deviceID: deviceID,)));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [

          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey ,)
              ),
              child:  const Text(
                "Kegel Exercises",
                style: TextStyle(
                    color: Colors.white, fontSize:  20 , fontWeight: FontWeight.w100),
              ),
            ),
          ),
          // Center(
          //   child: AnimatedContainer(
          //     duration: const Duration(seconds:3),
          //     width: isLoading ? size.width :size.width*0.8,
          //     height:  size.height,
          //     decoration:  const BoxDecoration(
          //       image: DecorationImage(
          //         image: AssetImage("assets/images/splash_screen.jpg"),
          //       ),
          //     ),
          //
          //   ),
          // ),
          // Positioned(
          //   bottom: 40,
          //   child:   Center(
          //     child: AnimatedTextKit(
          //     repeatForever: false,
          //     animatedTexts: [
          //       RotateAnimatedText(
          //         'Longer',
          //         textStyle: const TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold,letterSpacing: 5),
          //         duration:  Duration(milliseconds: 400),
          //       ),
          //
          //       RotateAnimatedText(
          //
          //         'Harder',
          //         textStyle: const TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold,letterSpacing: 5),
          //         duration:   Duration(milliseconds:400),
          //       ),
          //
          //       RotateAnimatedText(
          //         'Stronger',
          //         textStyle: const TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold,letterSpacing: 5),
          //         duration:   Duration(milliseconds: 400),
          //       ),
          //
          //     ],
          // ),
          //   ),),
          // Positioned(
          //   bottom: 20,
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10),
          //      border: Border.all(color: Colors.grey ,)
          //     ),
          //     child:  const Text(
          //       "Kegel Exercises",
          //       style: TextStyle(
          //           color: Colors.white, fontSize:  20 , fontWeight: FontWeight.w100),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
