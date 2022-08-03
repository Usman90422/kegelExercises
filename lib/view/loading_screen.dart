import 'package:flutter/material.dart';
import 'package:kegel_training/view/subscription_screen.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/user_controller.dart';
import 'main_screens/home.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key,required this.userDetails,required this.deviceID}) : super(key: key);

  final List userDetails;
  final String deviceID;

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {



   DateTime date=DateTime.now();
   var formatter =  DateFormat('yyyy-MM-dd');
   late String startDate = formatter.format(date);

   String userID="";
   int index=0;

   getUserId()
  {
    for (int i = 0; i < widget.userDetails.length; i++)
    {
      if (widget.deviceID == widget.userDetails[i]["uuid"] )
      {
       setState(() {
         userID=widget.userDetails[i]['_id'];
         index=i;
       });
       break;
      }
      else{
        userID='';
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserId();

    Future.delayed(const Duration(seconds: 2),() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('UniqueUserId', userID);


      if(userID!="" && date!=widget.userDetails[index]['end_date'])
      {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  const Home()));
      }
      else
      {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  const SubscriptionScreen()));
      }

  });

   }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Please wait a moment!"),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: CircularProgressIndicator(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
