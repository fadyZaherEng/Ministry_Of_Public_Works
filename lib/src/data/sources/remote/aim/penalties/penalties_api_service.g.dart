// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'penalties_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _PenaltiesApiService implements PenaltiesApiService {
  _PenaltiesApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://aim-api.transitiondemo.com/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<AIMResponse<RemotePenaltiesData>>> getPenalties(
      request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<AIMResponse<RemotePenaltiesData>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Penalties/GetPenalties',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AIMResponse<RemotePenaltiesData>.fromJson(
      _result.data!,
      (json) => RemotePenaltiesData.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<AIMResponse<AIMResponse<RemotePenalty>>>> getPenaltyById(
    penaltyId,
    isEnglishLanguage,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'isEnglishLanguage': isEnglishLanguage
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<AIMResponse<AIMResponse<RemotePenalty>>>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  'Penalties/GetPenaltiesById/${penaltyId}',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AIMResponse<AIMResponse<RemotePenalty>>.fromJson(
      _result.data!,
      (json) => AIMResponse<RemotePenalty>.fromJson(
        json as Map<String, dynamic>,
        (json) => RemotePenalty.fromJson(json as Map<String, dynamic>),
      ),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<AIMResponse<RemoteProjectData>>> getPenaltiesList(
      request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<AIMResponse<RemoteProjectData>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Dashboards/PenaltiesList',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AIMResponse<RemoteProjectData>.fromJson(
      _result.data!,
      (json) => RemoteProjectData.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<AIMChartResponse<AIMResponse<RemotePenaltiesChart>>>>
      getPenaltiesChartDesign(
    sectorId,
    color,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'sector': sectorId,
      r'Color': color,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
            HttpResponse<AIMChartResponse<AIMResponse<RemotePenaltiesChart>>>>(
        Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Dashboards/PenalitesChartDesign',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AIMChartResponse<AIMResponse<RemotePenaltiesChart>>.fromJson(
      _result.data!,
      (json) => AIMResponse<RemotePenaltiesChart>.fromJson(
        json as Map<String, dynamic>,
        (json) => RemotePenaltiesChart.fromJson(json as Map<String, dynamic>),
      ),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<AIMChartResponse<AIMResponse<RemotePenaltiesChart>>>>
      getPenaltiesChartExecution(
    sectorId,
    color,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'sector': sectorId,
      r'Color': color,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
            HttpResponse<AIMChartResponse<AIMResponse<RemotePenaltiesChart>>>>(
        Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Dashboards/PenalitesChartExecution',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AIMChartResponse<AIMResponse<RemotePenaltiesChart>>.fromJson(
      _result.data!,
      (json) => AIMResponse<RemotePenaltiesChart>.fromJson(
        json as Map<String, dynamic>,
        (json) => RemotePenaltiesChart.fromJson(json as Map<String, dynamic>),
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
