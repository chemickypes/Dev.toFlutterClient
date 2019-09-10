
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:dio/dio.dart';

class ServerModule {
  Injector _injector;

  void init(){
    

    _getInjector().map<Dio>((i) => Dio(), isSingleton: true);
    _getInjector().map<String>((i) => "", key: 'api-key');
  }

  void insertApiKey(String apikey){
      _getInjector().map<String>((i) => apikey, key: 'api-key');
  }

  Dio get getDio {
    Dio dio = _getInjector().get<Dio>();
    String api_key = _getInjector().get<String>(key: 'api-key');
    if(api_key != null || api_key.isNotEmpty){
      dio..options.headers['api-key'] = api_key;
    }
    return dio;
  }

  Injector _getInjector() {
    if(_injector == null){
      _injector  =  Injector.getInjector("server_module");
    }

    return _injector;
  }
}