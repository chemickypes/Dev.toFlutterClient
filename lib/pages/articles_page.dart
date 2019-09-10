
import 'package:devtoclient/blocs/article_bloc/article_bloc.dart';
import 'package:devtoclient/blocs/article_bloc/article_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class ArticlesPage extends StatefulWidget {
  ArticlesPage({Key key}) : super(key: key);

  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  

  
  ArticleBloc _bloc = ArticleBloc();

  Widget _bodyWidget;

  @override
  void initState() {
    super.initState();
    _bloc.getArticles(page: 1);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dev.to Articles"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.person,),
          onPressed: () {
            print('click');
          },)
        ],
      ),
      body: Container(
        child: BlocProvider<ArticleBloc>(
          builder: (context) => _bloc,
          child: BlocListener<ArticleBloc, ArticleState>(
            listener: (context, state) {
              if (state is ArticleLoadingState) {
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Loading...',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      ],
                    ),
                    backgroundColor: Colors.indigoAccent,
                  ));
              } // mettere errore TODO
              else {
                Scaffold.of(context)..hideCurrentSnackBar();
              }
            },
            child: BlocBuilder<ArticleBloc, ArticleState>(
              condition: (preStatus, currentStatus) {
                if (preStatus == currentStatus &&
                    currentStatus is ArticleLoadedState) {
                  return (preStatus as ArticleLoadedState).articles.length !=
                      (currentStatus as ArticleLoadedState).articles.length;
                } else {
                  return preStatus != currentStatus;
                }
              },
              builder: (context, status) {
                return _buildHomeWidget(status);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHomeWidget(ArticleState state) {
    if (_bodyWidget == null) _bodyWidget = Container();

    if (state is InitialArticleState) {}

    if (state is ArticleLoadedState) {
      _bodyWidget = ListView.builder(
        itemCount: state.articles.length,
        itemBuilder: (context, index) {
          return Text(
              '${state.articles[index].id} ${state.articles[index].title}');
        },
      );
    }

    return _bodyWidget;
  }
}
