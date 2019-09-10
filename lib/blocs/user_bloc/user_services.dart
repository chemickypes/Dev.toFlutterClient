
import 'dart:async';

import 'package:devtoclient/server/articles_retrofit.dart';
import 'package:dio/dio.dart';
import 'package:devtoclient/models/articles.dart';
import 'package:devtoclient/server/server_module.dart';

class UserServices {

  Dio dio = ServerModule().getDio;
  
  Future<User> getUser() async {
      List<Article> ll = await ArticlesRestClient(dio).getUserPosts(1);
      return Future.value(ll.first.user);
  }

  
}