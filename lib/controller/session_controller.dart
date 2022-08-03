import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kegel_training/model/exercises.dart';
import 'package:kegel_training/model/sessionModel.dart';


class SessionController{

  Future<List<SessionDataClass>> getSessions(String language) async {

    var url=Uri.parse("https://keggel.herokuapp.com/session" );
    var response= await http.get(url, headers: {"preferred-language" : language});
    var session= SessionModel.fromJson(jsonDecode(response.body)) ;
    return session.allSessionsDataList;
  }


}