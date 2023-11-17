// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variations_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _VariationsApiService implements VariationsApiService {
  _VariationsApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://aim-api.transitiondemo.com/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<AIMResponse<RemoteVariationsData>>> getVariations(
      request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<AIMResponse<RemoteVariationsData>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'VariationOrders/GetVariationOrders',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AIMResponse<RemoteVariationsData>.fromJson(
      _result.data!,
      (json) => RemoteVariationsData.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<AIMResponse<AIMResponse<RemoteVariation>>>>
      getVariationById(
    variationId,
    isEnglishLanguage,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'isEnglishLanguage': isEnglishLanguage
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<AIMResponse<AIMResponse<RemoteVariation>>>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  'VariationOrders/GetVariationOrdersById/${variationId}',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AIMResponse<AIMResponse<RemoteVariation>>.fromJson(
      _result.data!,
      (json) => AIMResponse<RemoteVariation>.fromJson(
        json as Map<String, dynamic>,
        (json) => RemoteVariation.fromJson(json as Map<String, dynamic>),
      ),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<AIMResponse<RemoteVariationsData>>> getVariationsList(
      request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<AIMResponse<RemoteVariationsData>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Dashboards/VariationOrderList',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AIMResponse<RemoteVariationsData>.fromJson(
      _result.data!,
      (json) => RemoteVariationsData.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<AIMChartResponse<AIMResponse<RemoteVariationsChart>>>>
      getVariationsChart(
    phaseId,
    sectorId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'phase': phaseId,
      r'sector': sectorId,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
            HttpResponse<AIMChartResponse<AIMResponse<RemoteVariationsChart>>>>(
        Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Dashboards/VariationOrderChart',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AIMChartResponse<AIMResponse<RemoteVariationsChart>>.fromJson(
      _result.data!,
      (json) => AIMResponse<RemoteVariationsChart>.fromJson(
        json as Map<String, dynamic>,
        (json) => RemoteVariationsChart.fromJson(json as Map<String, dynamic>),
      ),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<AIMChartResponse<RemoteVariationCircleChart>>>
      getVariationsCircleChart(
    phaseId,
    sectorId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'phase': phaseId,
      r'sector': sectorId,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        HttpResponse<AIMChartResponse<RemoteVariationCircleChart>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'Dashboards/VariationOrdersMinistryChart',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AIMChartResponse<RemoteVariationCircleChart>.fromJson(
      _result.data!,
      (json) =>
          RemoteVariationCircleChart.fromJson(json as Map<String, dynamic>),
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
