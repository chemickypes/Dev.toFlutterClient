import 'dart:async';

import 'package:devtoclient/storage/session_shared_pref.dart';
import 'package:dio/dio.dart';
import 'package:devtoclient/server/server_module.dart';

abstract class GenericService {
  ServerModule serverModule;
  Dio dio;

  GenericService() {
    serverModule = ServerModule();
    dio = serverModule.getDio;
  }

  void saveApiKey(String apiKey) {
    DCSession().saveApiKeyOnStore(apiKey);
    serverModule.insertApiKey(apiKey);
    dio = serverModule.getDio;
  }

  void removeApiKey() {
    DCSession().removeApiKey();
  }

  Future<T> execute<T>(FutureOr<T> action) async {
    //var f = await _restoreApiKeyFromStorage();
    return Future.value(action);
  }

}
