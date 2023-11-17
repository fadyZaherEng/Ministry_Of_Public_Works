import 'dart:io';

import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/milestones/milestones_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/milestones/request/milestones_request.dart';
import 'package:aim/src/domain/entities/milestones/milestone.dart';
import 'package:aim/src/domain/entities/milestones/milestones_data.dart';
import 'package:aim/src/domain/repositories/milestones_repository.dart';
import 'package:dio/dio.dart';

class MilestonesRepositoryImplementation extends MilestonesRepository {
  final MilestonesApiService _milestonesApiService;

  MilestonesRepositoryImplementation(this._milestonesApiService);

  @override
  Future<DataState<MilestonesData>> getMilestones(
      MilestonesRequest request) async {
    try {
      final httpResponse = await _milestonesApiService.getMilestones(request);

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
  Future<DataState<Milestone>> getMilestoneById(
      String milestoneId, bool isEnglishLanguage) async {
    try {
      final httpResponse = await _milestonesApiService.getMilestoneById(
          milestoneId, isEnglishLanguage);

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
}
