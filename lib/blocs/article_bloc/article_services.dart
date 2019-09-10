import 'package:devtoclient/server/server_module.dart';
import 'package:dio/dio.dart';
import 'package:devtoclient/models/articles.dart';
import 'package:devtoclient/server/articles_retrofit.dart';

class ArticleServices {
  ArticleServices();
  Dio dio = ServerModule().getDio;

  Future<List<Article>> getArticles({int page = 1}) {
    // return Future.delayed(Duration(seconds: 4),() => [
    //   Article(id: 1, title: "Title 1"),Article(id: 2, title: "title 2")
    // ]);

    return Future.delayed(Duration(seconds: 4),() => ArticlesRestClient(dio).getPosts(page));
  }
}
