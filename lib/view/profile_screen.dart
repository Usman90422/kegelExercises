import 'package:flutter/material.dart';
import 'package:kegel_training/view/settings/settings_Screen.dart';

import '../constants/constant.dart';
import '../generated/l10n.dart';

class ProfileScreen extends StatefulWidget {

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        leading: Text(''),
        backgroundColor: Colors.black,
        title: Text(
          S.of(context).profile,
          style:
          TextStyle(fontWeight: FontWeight.bold, fontSize: height * 0.03),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Settings()));
                }, icon: const Icon(Icons.settings,color:Colors.white70,)),
          )
        ],
      ),
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.black,
            Colors.black,
            kGreyColor,
          ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,

          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                // Text(
                //   "Vibro Training Program",
                //   style:
                //   TextStyle( fontSize: height * 0.02,color:Colors.white),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
                  decoration: BoxDecoration(
                      color: kDarkGreyColor,
                      borderRadius: BorderRadius.circular(20)),
                  width: width * 0.9,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Month 1",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: height * 0.02),
                              ),
                              const SizedBox(height:10,),
                              SizedBox(
                                width: width * 0.3,
                                child: Text(
                                  "30 days left",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: height * 0.02),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Non-active",style:  TextStyle(fontWeight:FontWeight.bold,
                              color: Colors.grey, fontSize: height * 0.02),
                          ),


                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GridView.builder(
                          shrinkWrap:true,
                          itemCount: 31,
                          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:7,
                              mainAxisSpacing:10
                              ,crossAxisSpacing:10
                          ) , itemBuilder:
                          (BuildContext context,int index)
                      {
                        return GestureDetector(
                          onTap:(){
                            setState(() {
                              currentIndex=index;
                            });
                          },
                          child: Container(
                            decoration:BoxDecoration(
                                shape:BoxShape.circle,
                                color:currentIndex!=index?Colors.white10:Colors.white
                            ),
                            child:Center(child: Text("$index",style:TextStyle(color:currentIndex==index?Colors.red:Colors.white,fontWeight:FontWeight.bold,fontSize:height*0.02),)),
                          ),
                        );
                      }
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
