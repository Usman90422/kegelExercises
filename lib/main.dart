import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kegel_training/constants/constant.dart';
import 'package:kegel_training/generated/l10n.dart';
import 'package:kegel_training/provider/change_language.dart';
import 'package:kegel_training/provider/session_provider.dart';

import 'package:kegel_training/view/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ChangeLanguageProvider()),
          ChangeNotifierProvider(create: (context) => SessionProvider()),

        ],
     child:  Builder(
       builder: (context)=>
        MaterialApp(
         locale: Provider.of<ChangeLanguageProvider>(context,listen: true).currentLocale,
         localizationsDelegates: const [
           S.delegate,
           GlobalMaterialLocalizations.delegate,
           GlobalWidgetsLocalizations.delegate,
           GlobalCupertinoLocalizations.delegate,
         ],
         supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
          scaffoldBackgroundColor: kScaffoldColor,
          primarySwatch: Colors.red,
          dialogTheme: DialogTheme(
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )
          ),
          textTheme: const TextTheme(
            bodyText1: TextStyle(),
            bodyText2: TextStyle(),
          ).apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
        ),
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
    ),
     ));
  }
}

