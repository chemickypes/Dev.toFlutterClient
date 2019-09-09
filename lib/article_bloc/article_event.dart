import 'package:devtoclient/models/articles.dart' as prefix0;
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ArticleEvent extends Equatable {
  ArticleEvent([List props = const <dynamic>[]]) : super(props);
}

class ArticleLoadingEvent extends ArticleEvent {
  
}

class ArticleLoadedEvent extends ArticleEvent {
  final List<prefix0.Article> articles;

  ArticleLoadedEvent({this.articles}): super([articles]);
}

class ArticleLoadingErrorEvent extends ArticleEvent{}
