import 'package:devtoclient/models/articles.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UserEvent extends Equatable {
  UserEvent([List props = const <dynamic>[]]) : super(props);
}

class UserLoadingEvent extends UserEvent {
  
}

class UserLoadedEvent extends UserEvent{
  final User user;
  UserLoadedEvent({this.user}):super([user]);
}

class UserLodingError extends UserEvent {
  
}
