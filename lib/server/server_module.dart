
import 'package:devtoclient/abstract_injection_module.dart';
import 'package:devtoclient/storage/session_shared_pref.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:dio/dio.dart';

class ServerModule extends AInjecstionModule{

  static const String SCOPE_MODULE = "server_module";


  @override
  void init(){
    _getInjector().map<Dio>((i) => _initDio(), isSingleton: true);
    _getInjector().map<DioHeader>((i) => DioHeader(), isSingleton: true);
    _getInjector().map<DCSession>((i) => DCSession(), isSingleton: true);
  }

  bool restoreApiKey(){
    if(!hasApiKey()){
      final restoringApiKey = _getInjector().get<DCSession>().gApiKey();
      print('restoringApiKey: $restoringApiKey');
      insertApiKey(restoringApiKey);
    }

    return hasApiKey();
    
  }

  Future<bool> initDCSession() async {
    return _getInjector().get<DCSession>().init();
  }

  bool hasApiKey(){
    var f = _getInjector().get<DioHeader>().apiKey;
    return (f != null && f.isNotEmpty);
  }

  void insertApiKey(String apikey){
    _getInjector().get<DioHeader>().apiKey = apikey;

    Dio dio = _getInjector().get<Dio>();
    dio.options.headers['api-key'] = apikey;
    
  }

  Dio get getDio {
    return _getInjector().get<Dio>();
    
  }

  Injector _getInjector() {
    return super.getInjector(SCOPE_MODULE);
  }

  Dio _initDio(){

    return Dio()
    ..interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options){
        print("request: ${options.path}");
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