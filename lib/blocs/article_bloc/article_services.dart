import 'package:devtoclient/server/generic_services.dart';
import 'package:devtoclient/models/articles.dart';
import 'package:devtoclient/server/articles_retrofit.dart';

class ArticleServices extends GenericService {
  ArticleServices():super();

  Future<List<Article>> getArticles({int page = 1}) async {
    // return Future.delayed(Duration(seconds: 4),() => [
    //   Article(id: 1, title: "Title 1"),Article(id: 2, title: "title 2")
    // ]);

    return await execute(
      Future.delayed(Duration(seconds: 2),() => ArticlesRestClient(dio).getPosts(page))
    );
  }
}
