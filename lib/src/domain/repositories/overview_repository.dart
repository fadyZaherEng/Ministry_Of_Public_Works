import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/overview/request/overview_list_request.dart';
import 'package:aim/src/domain/entities/overview/overview_chart_by_phase.dart';
import 'package:aim/src/domain/entities/overview/overview_chart_by_sector.dart';
import 'package:aim/src/domain/entities/overview/overview_data.dart';

abstract class OverviewRepository {

  Future<DataState<OverviewData>> getOverviewList(OverviewListRequest request);

  Future<DataState<OverviewChartByPhase>> getOverviewProjectsByPhase(
      String phaseId,
      String sectorId,
      );

  Future<DataState<OverviewChartBySector>> getOverviewProjectsBySector(
      String phaseId,
      String sectorId,
      );

  Future<DataState<int>> getProjectsInProgress(
      String phaseId,
      String sectorId,
      );

  Future<DataState<List<String>>> getOverviewCards(
      String phaseId,
      String sectorId,
      );
}
