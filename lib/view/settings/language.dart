import 'package:flutter/material.dart';
import 'package:kegel_training/provider/change_language.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/constant.dart';
import '../../generated/l10n.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {


  var language="en";

  Future<void> setPref(String lang) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("language", lang);
  }

  Future<String> getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang=prefs.getString('language')!;
    return lang;
  }

  setLanguage() async{
   String lang=await getPref();
    setState(() {
      language=lang;
    });
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setLanguage();
  }

  @override
  Widget build(BuildContext context) {
    final provider= Provider.of<ChangeLanguageProvider>(context);

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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child:  const Icon(Icons.arrow_back_ios,color: Colors.white,),
                      ),
                    ),
                    Text(S.of(context).language,style: TextStyle(fontSize: height*0.04,fontWeight: FontWeight.w600),),
                    const Icon(Icons.arrow_back_ios,color: Colors.transparent,),
                  ],
                ),
              const SizedBox(height: 40),
              InkWell(
              onTap: ()
              {
                setState(()   {
                  language="en";
                  setPref(language);
                  provider.requestLanguage(language);
                  context.read<ChangeLanguageProvider>().changeLocale('en');
                });
              },
              child: SizedBox(
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    const Text("English",style:  TextStyle(fontSize: 18,fontWeight: FontWeight.w600, color: Colors.white),),
                   if(language=="en")
                   const Icon(Icons.check,color:  kRedColor,size: 20,),
                  ],),
              ),
            ),


                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    setState(()   {
                      language="ar";
                      setPref(language);
                      provider.requestLanguage(language);
                      context.read<ChangeLanguageProvider>().changeLocale('hi');

                    });
                  },
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text("عربى",style:  TextStyle(fontSize: 18,fontWeight: FontWeight.w600, color: Colors.white),),
                        if(language=="ar" )
                          const Icon(Icons.check,color:  kRedColor,size: 20,),
                      ],),
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
