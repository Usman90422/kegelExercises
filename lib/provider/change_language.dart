import 'package:flutter/cupertino.dart';
import 'package:kegel_training/controller/exercise_controller.dart';

class ChangeLanguageProvider extends ChangeNotifier{

  Locale _locale= Locale("en");

  Locale get currentLocale => _locale;

  void changeLocale(String locale){
    _locale=Locale(locale);
    notifyListeners();
  }

  final exerciseController=ExerciseController();

  String language="";

  void requestLanguage(String lang){
    language=lang;
  //  exerciseController.getExercises(language);
    notifyListeners();
  }





}