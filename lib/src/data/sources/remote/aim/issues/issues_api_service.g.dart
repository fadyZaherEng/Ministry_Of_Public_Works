// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issues_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _IssuesApiService implements IssuesApiService {
  _IssuesApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://aim-api.transitiondemo.com/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<AIMResponse<RemoteIssuesData>>> getIssues(request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<AIMResponse<RemoteIssuesData>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'ProjectIssues/GetProjectIssues',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AIMResponse<RemoteIssuesData>.fromJson(
      _result.data!,
      (json) => RemoteIssuesData.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<AIMResponse<AIMResponse<RemoteIssue>>>> getIssueById(
    issueId,
    isEnglishLanguage,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'isEnglishLanguage': isEnglishLanguage
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<AIMResponse<AIMResponse<RemoteIssue>>>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  'ProjectIssues/GetProjectIssuesById/${issueId}',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AIMResponse<AIMResponse<RemoteIssue>>.fromJson(
      _result.data!,
      (json) => AIMResponse<RemoteIssue>.fromJson(
        json as Map<String, dynamic>,
        (json) => RemoteIssue.fromJson(json as Map<String, dynamic>),
      ),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<AIMResponse<RemoteIssuesData>>> getIssuesList(
      request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<AIMResponse<RemoteIssuesData>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Dashboards/IssuesList',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AIMResponse<RemoteIssuesData>.fromJson(
      _result.data!,
      (json) => RemoteIssuesData.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<AIMChartResponse<RemoteIssuesAnalysisChartBySector>>>
      getIssuesAnalysisChartBySector(
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
            HttpResponse<AIMChartResponse<RemoteIssuesAnalysisChartBySector>>>(
        Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Dashboards/IssuesAnalysisChartBySector',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AIMChartResponse<RemoteIssuesAnalysisChartBySector>.fromJson(
      _result.data!,
      (json) => RemoteIssuesAnalysisChartBySector.fromJson(
          json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<AIMChartResponse<RemoteIssuesAnalysisChartByPhase>>>
      getIssuesAnalysisChartByPhase(
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
            HttpResponse<AIMChartResponse<RemoteIssuesAnalysisChartByPhase>>>(
        Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Dashboards/IssuesAnalysisChartByPhase',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AIMChartResponse<RemoteIssuesAnalysisChartByPhase>.fromJson(
      _result.data!,
      (json) => RemoteIssuesAnalysisChartByPhase.fromJson(
          json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<AIMChartResponse<List<int>>>> getIssuesCounts(
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
        _setStreamType<HttpResponse<AIMChartResponse<List<int>>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Dashboards/IssuesGetCounts',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AIMChartResponse<List<int>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>).map<int>((i) => i as int).toList(),
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
