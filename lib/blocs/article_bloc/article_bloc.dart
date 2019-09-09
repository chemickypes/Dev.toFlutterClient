import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:devtoclient/blocs/article_bloc/article_services.dart';
import './bloc.dart';
import 'package:dio/dio.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {

  Dio dio;

  ArticleBloc({this.dio}){
    _services = ArticleServices(dio: dio);
  }

  ArticleServices _services;
  

  @override
  ArticleState get initialState => InitialArticleState();

  @override
  Stream<ArticleState> mapEventToState(
    ArticleEvent event,
  ) async* {
    if(event is ArticleLoadingEvent){
      yield ArticleLoadingState();
    }else if(event is ArticleLoadedEvent){
      if(currentState is ArticleLoadedState){
        (currentState as ArticleLoadedState).articles.addAll(event.articles);
        yield currentState; 
      }else{
        yield ArticleLoadedState(articles: event.articles);
      }
    }else if(event is ArticleLoadingErrorEvent){
      yield ArticleErrorState();
    }
  }

  void getArticles({int page = 1} ){
    dispatch(ArticleLoadingEvent());
    _services.getArticles(page: page).then((articles) {
      dispatch(ArticleLoadedEvent(articles: articles));
    }).catchError((error) {
      dispatch(ArticleLoadingErrorEvent());
    });
  }
}
