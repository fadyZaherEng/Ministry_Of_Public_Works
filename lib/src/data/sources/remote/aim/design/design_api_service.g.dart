// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'design_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _DesignApiService implements DesignApiService {
  _DesignApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://aim-api.transitiondemo.com/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<AIMResponse<RemoteDesignData>>> getDesignList(
      request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<AIMResponse<RemoteDesignData>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Dashboards/DesignProcessList',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AIMResponse<RemoteDesignData>.fromJson(
      _result.data!,
      (json) => RemoteDesignData.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<AIMChartResponse<RemoteDesignCircleChart>>>
      getDesignMinistry(sectorId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'sector': sectorId};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<AIMChartResponse<RemoteDesignCircleChart>>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  'Dashboards/DesignMinistryChart',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AIMChartResponse<RemoteDesignCircleChart>.fromJson(
      _result.data!,
      (json) => RemoteDesignCircleChart.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<AIMResponse<AIMChartResponse<RemoteDesignChart>>>>
      getDesignChart(sectorId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'sector': sectorId};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        HttpResponse<AIMResponse<AIMChartResponse<RemoteDesignChart>>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'Dashboards/DesignChart',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AIMResponse<AIMChartResponse<RemoteDesignChart>>.fromJson(
      _result.data!,
      (json) => AIMChartResponse<RemoteDesignChart>.fromJson(
        json as Map<String, dynamic>,
        (json) => RemoteDesignChart.fromJson(json as Map<String, dynamic>),
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
