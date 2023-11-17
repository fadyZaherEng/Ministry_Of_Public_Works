import 'dart:io';

import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/project/project_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/project/request/projects_request.dart';
import 'package:aim/src/domain/entities/project/details_phase.dart';
import 'package:aim/src/domain/entities/project/project_data.dart';
import 'package:aim/src/domain/entities/project/project_details.dart';
import 'package:aim/src/domain/repositories/project_repository.dart';
import 'package:dio/dio.dart';

class  ProjectRepositoryImplementation extends ProjectRepository {
  final ProjectApiService _projectApiService;

  ProjectRepositoryImplementation(this._projectApiService);

  @override
  Future<DataState<ProjectData>> getProjects(ProjectsRequest request) async {
    try {
      final httpResponse = await _projectApiService.getProjects(request);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.data!);
      } else {
        return DataFailed(DioError(
            error: httpResponse.response.statusMessage,
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioErrorType.response));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<ProjectDetails>> getProjectDetails(
      String projectId, bool isEnglishLanguage) async {
    try {
      final httpResponse = await _projectApiService.getProjectDetails(
          projectId, isEnglishLanguage);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.data!.data!);
      } else {
        return DataFailed(DioError(
            error: httpResponse.response.statusMessage,
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioErrorType.response));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<ProjectDetails>> getProjectPhase(
      String projectId, bool isEnglishLanguage) async {
    try {
      final httpResponse = await _projectApiService.getProjectPhase(
          projectId, isEnglishLanguage);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.data!.data!);
      } else {
        return DataFailed(DioError(
            error: httpResponse.response.statusMessage,
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioErrorType.response));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<ProjectDetails>>> getProjectPhases(
      String projectId, bool isEnglishLanguage) async {
    try {
      final httpResponse = await _projectApiService.getProjectPhases(
          projectId, isEnglishLanguage);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.data!.data!);
      } else {
        return DataFailed(DioError(
            error: httpResponse.response.statusMessage,
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioErrorType.response));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<DetailsPhase>>> getProjectDetailsPhases(String projectId, bool isEnglishLanguage) async {
    try {
      final httpResponse = await _projectApiService.getProjectDetailsPhases(
          projectId, isEnglishLanguage);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioError(
            error: httpResponse.response.statusMessage,
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioErrorType.response));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
