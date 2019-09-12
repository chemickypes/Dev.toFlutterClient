
import 'package:devtoclient/abstract_injection_module.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:dio/dio.dart';

class ServerModule extends AInjecstionModule{

  static const String SCOPE_MODULE = "server_module";


  @override
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
    String apiKey = dioHeader.apiKey;
    //print(dioHeader.toString());
    if(apiKey != null || apiKey?.isNotEmpty == true){
      dio.options.headers['api-key'] = apiKey;
    }
    return dio;
  }

  Injector _getInjector() {
    return super.getInjector(SCOPE_MODULE);
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