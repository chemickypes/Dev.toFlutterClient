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
          return Text(
              '${state.articles[index].id} ${state.articles[index].title}');
        },
      );
    }

    return _bodyWidget;
  }
}
