import 'package:flutter/cupertino.dart';
import 'package:kegel_training/controller/session_controller.dart';

import '../model/sessionModel.dart';

class SessionProvider extends ChangeNotifier{

  late List<SessionDataClass> sessions=[];

  final sessionsController=SessionController();

  getSessions()async{
    sessions= await sessionsController.getSessions("en");
    notifyListeners();
    print("Session List Filled");
    return sessions;
  }

  int sessionIndex=0;
  late String completedSessionId='';

  setCompletedSessionId(String id){
    completedSessionId=id;
    notifyListeners();
  }

  incrementSessionIndex(){
    sessionIndex++;
    print('incremented');
    notifyListeners();
  }

  resetSessionIndex(){
    sessionIndex=0;
    print("reseted");

    notifyListeners();
  }


}