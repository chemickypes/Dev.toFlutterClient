import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:devtoclient/blocs/user_bloc/user_services.dart';
import './bloc.dart';
import 'package:dio/dio.dart';

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
    }else if(event is UserUnloggedEvent){
      yield InitialUserState();
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

  void login(String apiKey){
    dispatch(UserLoadingEvent());
    _services.login(apiKey).then(
      (user){
        dispatch(UserLoadedEvent(user:user));
      }
    ).catchError((e){
      print(e);
      switch(e.runtimeType){
        case DioError:
        final res = (e as DioError).response;
        dispatch(UserLodingErrorEvent(apiKeyError: res.statusCode == 401));
      }
    });
  }

  void logout() {
    dispatch(UserLoadingEvent());
    _services.logout().then((boolean) {
      dispatch(UserUnloggedEvent());
    });
  }

}


