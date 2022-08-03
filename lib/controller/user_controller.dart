import 'dart:convert';
import 'package:http/http.dart' as http;

class UserController{

  registerUser(Map userDetail) async {

    var url=Uri.parse("https://keggel.herokuapp.com/user");
    var response=await http.post(url,body: userDetail);
    if(response.statusCode!=200)
    {
      print("response error");
      print(response.statusCode);
    }
    else {
      print("Registered");
      return null;
    }
  }

  getUser() async{
    var url=Uri.parse("https://keggel.herokuapp.com/user");
    var response= await http.get(url);
    var data=json.decode(response.body);
    return data["data"];
  }

}