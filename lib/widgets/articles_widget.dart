import 'package:devtoclient/models/articles.dart';
import 'package:devtoclient/widgets/user_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
      ws.add(
        Container(
          height: 140,
          child: CachedNetworkImage(
            imageUrl: article.coverImage,
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Center(
              child: Icon(Icons.error),
            ),
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      );
    }

    ws.add(
      ArticleInfo(
        article: article,
      ),
    );

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

class ArticleInfo extends StatelessWidget {
  const ArticleInfo({Key key, @required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                  article.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 25),
                ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: UserIcon(
                      user: article.user,
                      height: 45,
                      width: 45,
                    ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Author: ${article.user.name}'),
                   
                    Wrap(
                      spacing: 3,
                      runSpacing: 0,
                      children: article.tagList.map((tag) {
                        return Chip(
                          label: Text(
                            tag,
                            style: TextStyle(fontSize: 12),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
