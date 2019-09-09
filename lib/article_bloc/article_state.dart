import 'package:devtoclient/models/articles.dart' as prefix0;
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ArticleState extends Equatable {
  ArticleState([List props = const <dynamic>[]]) : super(props);
}

class InitialArticleState extends ArticleState {}

class ArticleLoadingState extends ArticleState {}

class ArticleErrorState extends ArticleState {
  
}

class ArticleLoadedState extends ArticleState {
  final List<prefix0.Article> articles;

  ArticleLoadedState({this.articles}): super([articles]);
}
