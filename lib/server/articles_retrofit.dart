import 'package:devtoclient/models/articles.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'articles_retrofit.g.dart';

@RestApi(baseUrl: "https://dev.to/api")
abstract class ArticlesRestClient {
  factory ArticlesRestClient(Dio dio) = _ArticlesRestClient;

  @GET("/articles")
  Future<List<Article>> getPosts(@Query('page') int page);
}
