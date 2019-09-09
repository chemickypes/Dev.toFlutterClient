import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  @override
  UserState get initialState => InitialUserState();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if( event  is UserLoadingEvent){
      yield UserLoadingState();
    }else if (event is UserLoadedEvent){
      yield UserLoadedState(user:event.user);
    }else if(event is UserLodingErrorEvent){
      yield UserLoadingErrorState();
    }
  }

  void getUser(){
    dispatch(UserLoadingEvent());
    
  }

}


