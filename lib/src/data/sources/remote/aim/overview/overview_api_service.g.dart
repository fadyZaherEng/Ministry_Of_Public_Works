// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overview_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _OverviewApiService implements OverviewApiService {
  _OverviewApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://aim-api.transitiondemo.com/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<AIMResponse<RemoteOverviewData>>> getOverviewList(
      request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<AIMResponse<RemoteOverviewData>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Dashboards/OverviewList',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AIMResponse<RemoteOverviewData>.fromJson(
      _result.data!,
      (json) => RemoteOverviewData.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<AIMChartResponse<AIMResponse<int>>>>
      getProjectsInProgress(
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
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<AIMChartResponse<AIMResponse<int>>>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  'Dashboards/OverViewProjectsInProgress',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AIMChartResponse<AIMResponse<int>>.fromJson(
      _result.data!,
      (json) => AIMResponse<int>.fromJson(
        json as Map<String, dynamic>,
        (json) => json as int,
      ),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<
          HttpResponse<
              AIMChartResponse<AIMResponse<RemoteOverviewChartByPhase>>>>
      getOverviewProjectsByPhase(
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
        HttpResponse<
            AIMChartResponse<AIMResponse<RemoteOverviewChartByPhase>>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'Dashboards/OverViewProjectsByPhase',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        AIMChartResponse<AIMResponse<RemoteOverviewChartByPhase>>.fromJson(
      _result.data!,
      (json) => AIMResponse<RemoteOverviewChartByPhase>.fromJson(
        json as Map<String, dynamic>,
        (json) =>
            RemoteOverviewChartByPhase.fromJson(json as Map<String, dynamic>),
      ),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<
          HttpResponse<
              AIMChartResponse<AIMResponse<RemoteOverviewChartBySector>>>>
      getOverviewProjectsBySector(
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
            HttpResponse<
                AIMChartResponse<AIMResponse<RemoteOverviewChartBySector>>>>(
        Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Dashboards/OverViewProjectsBySector',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        AIMChartResponse<AIMResponse<RemoteOverviewChartBySector>>.fromJson(
      _result.data!,
      (json) => AIMResponse<RemoteOverviewChartBySector>.fromJson(
        json as Map<String, dynamic>,
        (json) =>
            RemoteOverviewChartBySector.fromJson(json as Map<String, dynamic>),
      ),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<AIMChartResponse<AIMResponse<List<String>>>>>
      getOverviewCards(
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
        HttpResponse<AIMChartResponse<AIMResponse<List<String>>>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'Dashboards/OverViewCards',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AIMChartResponse<AIMResponse<List<String>>>.fromJson(
      _result.data!,
      (json) => AIMResponse<List<String>>.fromJson(
        json as Map<String, dynamic>,
        (json) =>
            (json as List<dynamic>).map<String>((i) => i as String).toList(),
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
