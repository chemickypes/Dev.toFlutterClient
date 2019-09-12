

import 'package:shared_preferences/shared_preferences.dart';

class DCSession {

  void saveApiKeyOnStore(String s) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("api-key", s);
  }

  void removeApiKey() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("api-key");
  }
}