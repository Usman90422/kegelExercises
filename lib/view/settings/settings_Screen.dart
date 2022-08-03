import 'package:flutter/material.dart';
import 'package:kegel_training/view/settings/language.dart';
import 'package:kegel_training/widgets/text_icon_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/constant.dart';
import '../../generated/l10n.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  String uid='';

  getId()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      uid = prefs.getString('UID')!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getId();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
       body: Container(
         width: width,
         height: height,
         decoration:  const BoxDecoration(
           gradient: LinearGradient(colors: [
             Colors.black,
             kGreyColor,
           ],
             begin: Alignment.topCenter,
             end: Alignment.bottomCenter,
           ),
         ),
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 40),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Column(
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       GestureDetector(
                         onTap: (){
                           Navigator.pop(context);
                           },
                         child:  const Icon(Icons.arrow_back_ios,color: Colors.white,),
                       ),
                       Text(S.of(context).settings,style: TextStyle(fontSize: height*0.04,fontWeight: FontWeight.w600),),
                       const Icon(Icons.arrow_back_ios,color: Colors.transparent,),
                     ],
                   ),
                   const SizedBox(height: 40),
                    TextIconTile(title: S.of(context).language,onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>const Language()));
                   }),
                   const SizedBox(height: 40),
                    TextIconTile(title: S.of(context).rateUs),
                   const SizedBox(height: 40),
                    TextIconTile(title: S.of(context).privacyPolicy),
                   const SizedBox(height: 40),
                    TextIconTile(title: S.of(context).feedback),
                   const SizedBox(height: 40),
                    TextIconTile(title: S.of(context).resetProgress,textColor: Colors.red,),
                 ],
               ),
               Column(
                 children:  [
                   Text(S.of(context).userID,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                   const SizedBox(height: 10),
                    Text(uid,style: const TextStyle(color: Colors.grey,fontSize: 15),),
                   const SizedBox(height: 10),
                   Text(S.of(context).version,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),

                 ],
               ),
             ],
           ),
         ),
       ),
      ),
    );
  }
}
