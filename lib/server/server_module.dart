
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:dio/dio.dart';

class ServerModule {
  Injector _injector;

  void init(){
    

    _getInjector().map<Dio>((i) => _initDio(), isSingleton: true);
    _getInjector().map<DioHeader>((i) => DioHeader(), isSingleton: true);
  }

  void insertApiKey(String apikey){
    _getInjector().get<DioHeader>().apiKey = apikey;
  }

  Dio get getDio {
    Dio dio = _getInjector().get<Dio>();
    DioHeader dioHeader = _getInjector().get<DioHeader>();
    String api_key = dioHeader.apiKey;
    //print(dioHeader.toString());
    if(api_key != null || api_key?.isNotEmpty == true){
      dio.options.headers['api-key'] = api_key;
    }
    return dio;
  }

  Injector _getInjector() {
    if(_injector == null){
      _injector  =  Injector.getInjector("server_module");
    }

    return _injector;
  }

  Dio _initDio(){

    return Dio()
    ..interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options){
        print("header: ${options.headers.toString()}");
      }
    ));

  }
}

class DioHeader{

  String apiKey;

  @override
  String toString() {
    
    return 'DioHeader: api-key: $apiKey ';
  }
}