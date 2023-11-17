import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/dashboards/penalties_chart.dart';
import 'package:aim/src/domain/repositories/penalties_repository.dart';

class GetPenaltiesChartExecutionUseCase {
  final PenaltiesRepository _penaltiesRepository;

  GetPenaltiesChartExecutionUseCase(this._penaltiesRepository);

  Future<DataState<PenaltiesChart>> call(
    String sectorId,
    int color,
  ) {
    return _penaltiesRepository.getPenaltiesChartExecution(sectorId,color);
  }
}
