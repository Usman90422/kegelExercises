import 'package:flutter/material.dart';
import 'package:kegel_training/constants/constant.dart';
import 'package:kegel_training/controller/session_controller.dart';
import 'package:kegel_training/controller/user_controller.dart';
import 'package:kegel_training/provider/session_provider.dart';
import 'package:kegel_training/services/paypal_payment.dart';
import 'package:kegel_training/view/main_screens/home.dart';
import 'package:kegel_training/widgets/button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../generated/l10n.dart';
import 'package:intl/intl.dart';
import 'main_screens/exercise_list.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);



  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {

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

  bool weekly=false;
  bool sixMonths=false;
  bool monthly=false;
  String price='';
  String package='';

  final session=SessionController();
  final registerUser=UserController();

  DateTime now=DateTime.now();
  var formatter =  DateFormat('yyyy-MM-dd');
  late String startDate = formatter.format(now);
  late String endingDate='';

  Map details= {};


  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<SessionProvider>(context);

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: size.width,
                    height: size.height*0.28,
                    child: const Image(image: AssetImage("assets/img1.jpg"))),
                // const Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20),
                //   child: Center(
                //     child: Text("Get unlimited access to your personal plan",style: TextStyle(color: Colors.white,fontSize: 25,),textAlign: TextAlign.center,),
                //   ),
                // ),
                Row(
                  children: [
                    SizedBox(
                        width: size.width * 0.3,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Divider(
                            color: kRedColor,
                            thickness: 2,
                          ),
                        )),
                    SizedBox(
                        width: size.width * 0.4,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kRedColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(10),
                          child:  Center(child: Text(S.of(context).plans,style: TextStyle(letterSpacing: 2),)),
                        )),
                    SizedBox(
                        width: size.width * 0.3,
                        child: const Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: Divider(
                            color: kRedColor,
                            thickness: 2,
                          ),
                        )),
                  ],
                ),

                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [

                      GestureDetector(
                        onTap: (){
                          setState(() {
                            weekly=true;
                            price='1.49';
                            late DateTime endDate = now.add(const Duration(days: 7));
                            endingDate = formatter.format(endDate);
                            package="One Week";
                            sixMonths=false;
                            monthly=false;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 90,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: weekly ? kRedColor: kGreyColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: size.width*0.4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  [
                                  //  Center(child: Text("1",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                    Center(child: Text(S.of(context).weekly,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                    // SizedBox(height: 10),
                                    // Center(child: Text("50.00 \$/month ",style: TextStyle(fontSize: 12),)),
                                  ],
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 100,
                                color: kScaffoldColor,
                              ),
                              SizedBox(
                                width: size.width*0.4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Center(child: Text("1.49 \$",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                    // SizedBox(height: 10),
                                    // Center(child: Text("per week",style: TextStyle(fontSize: 12),)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                weekly=false;
                                sixMonths=true;
                                price='19.99';
                                package="Six Month";
                                late DateTime endDate = now.add(const Duration(days: 182));
                                endingDate = formatter.format(endDate);
                                monthly=false;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              height: 90,
                              width: size.width,
                              decoration: BoxDecoration(
                                color: sixMonths ? kRedColor : kGreyColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: size.width*0.4,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:  [
                                        Center(child: Text(S.of(context).six,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                        Center(child: Text(S.of(context).months,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                        // SizedBox(height: 10),
                                        // Center(child: Text("19.99 \$/month ",style: TextStyle(fontSize: 12),)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 100,
                                    color: kScaffoldColor,
                                  ),
                                  SizedBox(
                                    width: size.width*0.4,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Center(child: Text("19.99 \$",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                        // SizedBox(height: 10),
                                        // Center(child: Text("per month",style: TextStyle(fontSize: 12),)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: -10,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: sixMonths? kGreyColor:kRedColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child:  Text(S.of(context).save,style: TextStyle(fontSize: 10),),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      GestureDetector(
                        onTap: (){
                          setState(() {
                            weekly=false;
                            sixMonths=false;
                            monthly=true;
                            price='3.99';
                            package="One Month";
                            late DateTime endDate = now.add(const Duration(days: 30));
                            endingDate = formatter.format(endDate);

                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 90,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: monthly? kRedColor: kGreyColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: size.width*0.4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  [
                                 //   Center(child: Text("3",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                    Center(child: Text(S.of(context).Monthly,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                   // SizedBox(height: 10),
                                    // Center(child: Text("3.99 \$/month ",style: TextStyle(fontSize: 12),)),
                                  ],
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 100,
                                color: kScaffoldColor,
                              ),
                              SizedBox(
                                width: size.width*0.4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Center(child: Text("3.99 \$",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                    // SizedBox(height: 10),
                                    // Center(child: Text("per week",style: TextStyle(fontSize: 12),)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      MyButton(onPressed: () async{
                        // provider.getSessions();
                        // session.getSessions('en');


                        if(price!=''){
                          details={
                            "uuid": uid,
                            "user_package": package,
                            "start_date": startDate,
                            "end_date": endingDate,
                          };
                          registerUser.registerUser(details);
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home()));
                        }

                        // if(price!=''){
                        //   Navigator.push(context, MaterialPageRoute(builder: (context)=> PaypalPayment(amount: price,onFinish: (num)async{
                        //     print('order id: '+num);
                        //   } )));
                        // }


                      },
                        text: S.of(context).continueText, textColor: Colors.white, buttonColor: kRedColor, height: 50,width: size.width,textSize: 15,),

                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          const Text("Terms of Use"),
                          const SizedBox(width: 10),
                          Container(
                            height: 10,
                            width: 1,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10),
                          const Text("Privacy Policy"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text("Subscription Terms"),
                      const SizedBox(height: 20),


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
