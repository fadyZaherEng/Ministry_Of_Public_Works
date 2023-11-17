import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/filter/request/filter_request.dart';
import 'package:aim/src/domain/entities/filter/end_user.dart';
import 'package:aim/src/domain/entities/filter/month.dart';
import 'package:aim/src/domain/entities/filter/penalty_type.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/filter/status.dart';
import 'package:aim/src/domain/entities/filter/warranty_type.dart';
import 'package:aim/src/domain/entities/filter/year.dart';

abstract class FilterRepository {
  Future<DataState<List<Phase>>> getPhases(FilterRequest request);

  Future<DataState<List<ProjectType>>> getProjectTypes(FilterRequest request);

  Future<DataState<List<EndUser>>> getEndUsers(FilterRequest request);

  Future<DataState<List<Month>>> getMonths(FilterRequest request);

  Future<DataState<List<Year>>> getYears(FilterRequest request);

  Future<DataState<List<PenaltyType>>> getPenaltyTypes(FilterRequest request);

  Future<DataState<List<Status>>> getProjectStatus(FilterRequest request);

  Future<DataState<List<Status>>> getPaymentStatus(FilterRequest request);

  Future<DataState<List<Status>>> getImpactOnCostStatus(FilterRequest request);

  Future<DataState<List<WarrantyType>>> getWarrantyTypes(FilterRequest request);
}
