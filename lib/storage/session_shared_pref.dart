

import 'package:shared_preferences/shared_preferences.dart';

class DCSession {
  SharedPreferences prefs;

  Future<bool> init() async {
    _openSharedPrefs();
    if(prefs == null) prefs = await SharedPreferences.getInstance();
    return true;
  }

  void _openSharedPrefs() async{
    if(prefs == null) prefs = await SharedPreferences.getInstance();
  }

  void saveApiKeyOnStore(String s) async{
    _openSharedPrefs();
    await prefs.setString("api-key", s);
  }

  void removeApiKey() async {
     _openSharedPrefs();
    await prefs.remove("api-key");
  }

  String gApiKey() { 
    //if(prefs == null) prefs = await SharedPreferences.getInstance();
    return prefs.getString("api-key")??"";
  }
}