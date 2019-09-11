import 'package:devtoclient/models/articles.dart';
import 'package:devtoclient/widgets/user_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/article_bloc/bloc.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<ArticleBloc, ArticleState>(
        condition: (preStatus, currentStatus) {
          if (preStatus == currentStatus &&
              currentStatus is ArticleLoadedState) {
            return (preStatus as ArticleLoadedState).articles.length !=
                currentStatus.articles.length;
          } else {
            return preStatus != currentStatus;
          }
        },
        builder: (context, status) {
          return _buildHomeWidget(status);
        },
      ),
    );
  }

  Widget _buildHomeWidget(ArticleState state) {
    Widget _bodyWidget;
    if (_bodyWidget == null) _bodyWidget = Container();

    if (state is InitialArticleState) {}

    if (state is ArticleLoadedState) {
      _bodyWidget = ListView.builder(
        itemCount: state.articles.length,
        itemBuilder: (context, index) {
          return ArticleCard(
            article: state.articles[index],
          );
        },
      );
    }

    return _bodyWidget;
  }
}

class ArticleCard extends StatelessWidget {
  const ArticleCard({Key key, this.article}) : super(key: key);

  final Article article;

  List<Widget> _populateCard() {
    var ws = <Widget>[];
    if (article.coverImage != null) {
      /* ws.add(
        Stack(
          children: <Widget>[
            Center(
              child: CircularProgressIndicator(),
            ),
            Image.network(
              article.coverImage,
              fit: BoxFit.cover,
            )
          ],
        ),
      ); */
    }

    ws.add(Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: UserIcon(
              user: article.user,
              height: 45,
              width: 45,
            ),
          ),
        ),
        Flexible(
        
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  article.title,
                  maxLines: 2,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 25),
                ),
                Text('Author: ${article.user.name}'),
                Wrap(
                  children: article.tagList.map((tag) {
                    return Chip(
                      label: Text(
                        tag,
                        style: TextStyle(fontSize: 12),
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          ),
        )
      ],
    ));

    return ws;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Card(
        child: Column(
          children: _populateCard(),
        ),
      ),
    );
  }
}
