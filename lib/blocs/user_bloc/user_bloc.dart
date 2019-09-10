import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:devtoclient/blocs/user_bloc/user_services.dart';
import './bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserServices _services = UserServices();
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
    _services.getUser().then(
      (user){
        dispatch(UserLoadedEvent(user:user));
      }
    ).catchError((e){
      print(e);
    });
  }

}


