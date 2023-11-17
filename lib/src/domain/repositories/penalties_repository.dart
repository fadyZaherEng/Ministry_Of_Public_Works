import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/penalties/entity/remote_penalties_chart.dart';
import 'package:aim/src/data/sources/remote/aim/penalties/request/penalties_list_request.dart';
import 'package:aim/src/data/sources/remote/aim/penalties/request/penalties_request.dart';
import 'package:aim/src/domain/entities/penalties/penalties_data.dart';
import 'package:aim/src/domain/entities/penalties/penalty.dart';
import 'package:aim/src/domain/entities/project/project_data.dart';

abstract class PenaltiesRepository {
  Future<DataState<PenaltiesData>> getPenalties(PenaltiesRequest request);

  Future<DataState<Penalty>> getPenaltyById(
    String penaltyId,
    bool isEnglishLanguage,
  );

  Future<DataState<ProjectData>> getPenaltiesList(PenaltiesListRequest request);

  Future<DataState<RemotePenaltiesChart>> getPenaltiesChartDesign(
    String sectorId,
    int color,
  );

  Future<DataState<RemotePenaltiesChart>> getPenaltiesChartExecution(
    String sectorId,
    int color,
  );
}
