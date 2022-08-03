import 'dart:convert';
import 'package:http/http.dart' as http;

class ProgressController{

  getProgress() async {
    var url=Uri.parse("https://keggel.herokuapp.com/progress");
    var response= await http.get(url);
    var data=json.decode(response.body);
    return data["data"];
  }

  postProgress(Map progress)async{
    var url=Uri.parse("https://keggel.herokuapp.com/progress");
    var response=await http.post(url,body: progress);
    if(response.statusCode!=200 || response.statusCode!=201)
    {
      print("response error");
      print(response.statusCode);
    }
    else {
      print("Progress Updated");
      return null;
    }
  }

}