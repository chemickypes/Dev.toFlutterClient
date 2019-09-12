
import 'dart:async';

import 'package:devtoclient/server/articles_retrofit.dart';
import 'package:devtoclient/storage/session_shared_pref.dart';
import 'package:dio/dio.dart';
import 'package:devtoclient/models/articles.dart';
import 'package:devtoclient/server/server_module.dart';

class UserServices {

  ServerModule serverModule ;
  Dio dio;

  UserServices(){
    serverModule = ServerModule();
    dio = serverModule.getDio;
  }


  
  Future<User> getUser() async {
      List<Article> ll = await ArticlesRestClient(dio).getUserPosts(1);
      return Future.value(ll.first.user);
  }


  Future<User> login(String apiKey) async {
      DCSession().saveApiKeyOnStore(apiKey);
      serverModule.insertApiKey(apiKey);
      dio = serverModule.getDio;
      return getUser();
  }

  Future<bool> logout() async{
    DCSession().removeApiKey();
    return Future.delayed(Duration(milliseconds: 500), () => true);
  }

  
}