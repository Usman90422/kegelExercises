import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kegel_training/model/exercises.dart';

class ExerciseController{

  getExercises(String lang) async {

    var url=Uri.parse("https://keggel.herokuapp.com/exercises");
    var response= await http.get(url, headers: {"preferred-language" : lang});
    var data=json.decode(response.body);
    return data["data"];
  }


}