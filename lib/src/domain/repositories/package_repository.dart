import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/overview/request/overview_list_request.dart';
import 'package:aim/src/data/sources/remote/aim/package/request/package_list_request.dart';
import 'package:aim/src/domain/entities/overview/overview_chart_by_phase.dart';
import 'package:aim/src/domain/entities/overview/overview_chart_by_sector.dart';
import 'package:aim/src/domain/entities/overview/overview_data.dart';
import 'package:aim/src/domain/entities/package/package_analysis_chart.dart';
import 'package:aim/src/domain/entities/package/package_circle_chart.dart';
import 'package:aim/src/domain/entities/package/package_data.dart';

abstract class PackageRepository {

  Future<DataState<PackageData>> getPackageList(PackageListRequest request);

  Future<DataState<PackageAnalysisChart>> getPackageAnalysisChart(
      String sectorId,
      int color,
      );

  Future<DataState<PackageCircleChart>> getPackageMinistryChart(
      String sectorId,
      int color,
      );

}
