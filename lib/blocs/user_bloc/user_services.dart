import 'dart:async';

import 'package:devtoclient/server/articles_retrofit.dart';
import 'package:devtoclient/server/generic_services.dart';
import 'package:devtoclient/models/articles.dart';

class UserServices extends GenericService {
  UserServices() : super();

  Future<User> getUser() async {
    return execute(Future.sync(() async {
      List<Article> ll = await ArticlesRestClient(dio).getUserPosts(1);
      return Future.value(ll.first.user);
    }));
  }

  Future<User> login(String apiKey) async {
    super.saveApiKey(apiKey);
    return getUser();
  }

  Future<bool> logout() async {
    super.removeApiKey();
    return Future.delayed(Duration(milliseconds: 500), () => true);
  }
}
