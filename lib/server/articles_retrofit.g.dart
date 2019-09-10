// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_retrofit.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ArticlesRestClient implements ArticlesRestClient {
  _ArticlesRestClient(this._dio) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  final String baseUrl = 'https://dev.to/api';

  @override
  getPosts(page) async {
    ArgumentError.checkNotNull(page, 'page');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'page': page};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/articles',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Article.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  getUserPosts(page) async {
    ArgumentError.checkNotNull(page, 'page');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'page': page};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/articles/me',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Article.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }
}
