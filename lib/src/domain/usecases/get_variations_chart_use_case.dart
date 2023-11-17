import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/dashboards/variations_chart.dart';
import 'package:aim/src/domain/repositories/variations_repository.dart';

class GetVariationsChartUseCase {
  final VariationsRepository _variationsRepository;

  GetVariationsChartUseCase(this._variationsRepository);

  Future<DataState<VariationsChart>> call(
    String phaseId,
    String sectorId,
  ) async {
    return _variationsRepository.getVariationsChart(phaseId, sectorId);
  }
}
