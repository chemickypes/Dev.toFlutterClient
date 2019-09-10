
import 'dart:async';

import 'package:devtoclient/server/articles_retrofit.dart';
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

  void saveApiKey(String s) {
    serverModule.insertApiKey(s);
    dio = serverModule.getDio;
  }

  
}