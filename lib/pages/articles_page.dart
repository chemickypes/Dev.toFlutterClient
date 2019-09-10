import 'package:devtoclient/blocs/article_bloc/article_bloc.dart';
import 'package:devtoclient/blocs/article_bloc/article_state.dart';
import 'package:devtoclient/blocs/user_bloc/bloc.dart';
import 'package:devtoclient/blocs/user_bloc/user_bloc.dart';
import 'package:devtoclient/widgets/articles_widget.dart';
import 'package:devtoclient/widgets/user_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticlesPage extends StatefulWidget {
  ArticlesPage({Key key}) : super(key: key);

  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  ArticleBloc _bloc = ArticleBloc();
  UserBloc _userBloc = UserBloc();

  @override
  void initState() {
    super.initState();
    _bloc.getArticles(page: 1);
    _userBloc.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ArticleBloc>(
          builder: (context) => _bloc,
        ),
        BlocProvider<UserBloc>(
          builder: (context) => _userBloc,
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dev.to Articles"),
          actions: <Widget>[
            UserIcon()
          ],
        ),
        body: Container(
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
            child: ArticleList(),
          ),
        ),
      ),
    );
  }
}
