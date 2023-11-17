// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _AnalysisApiService implements AnalysisApiService {
  _AnalysisApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://aim-api.transitiondemo.com/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<AIMResponse<RemoteAnalysisData>>> getAnalysisList(
      request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<AIMResponse<RemoteAnalysisData>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Dashboards/AnalysisModuleList',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AIMResponse<RemoteAnalysisData>.fromJson(
      _result.data!,
      (json) => RemoteAnalysisData.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<AIMChartResponse<AIMResponse<List<RemoteExtensionItem>>>>>
      getExtensionPeriod(
    id,
    year,
    isEnglishLanguage,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'id': id,
      r'year': year,
      r'isEnglishLanguage': isEnglishLanguage,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        HttpResponse<
            AIMChartResponse<AIMResponse<List<RemoteExtensionItem>>>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'Dashboards/ExtensionPeriod',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        AIMChartResponse<AIMResponse<List<RemoteExtensionItem>>>.fromJson(
      _result.data!,
      (json) => AIMResponse<List<RemoteExtensionItem>>.fromJson(
        json as Map<String, dynamic>,
        (json) => (json as List<dynamic>)
            .map<RemoteExtensionItem>(
                (i) => RemoteExtensionItem.fromJson(i as Map<String, dynamic>))
            .toList(),
      ),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
