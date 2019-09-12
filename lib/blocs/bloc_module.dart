

import 'package:devtoclient/abstract_injection_module.dart';
import 'package:devtoclient/blocs/article_bloc/bloc.dart';
import 'package:devtoclient/blocs/user_bloc/user_bloc.dart';

class BlocsModule extends AInjecstionModule{

  static const String SCOPE_VALUE = "blocs_module";


  @override
  void init(){
      getInjector(SCOPE_VALUE).map<UserBloc>((i) => UserBloc(), isSingleton: true);
      getInjector(SCOPE_VALUE).map<ArticleBloc>((i) => ArticleBloc(), isSingleton: true);
  }


  T get<T>() => getInjector(SCOPE_VALUE).get<T>();

}