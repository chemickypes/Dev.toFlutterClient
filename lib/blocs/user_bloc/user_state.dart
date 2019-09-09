import 'package:devtoclient/models/articles.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UserState extends Equatable {
  UserState([List props = const <dynamic>[]]) : super(props);
}

class InitialUserState extends UserState {}

class UserLoadingState extends UserState {
  
}

class UserLoadedState extends UserState {
  final User user;
  UserLoadedState({this.user}): super([user]);
}

class UserLoadingErrorState extends UserState {
  
}
