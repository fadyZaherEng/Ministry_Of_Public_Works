import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/dashboards/circle_chart.dart';
import 'package:aim/src/domain/repositories/variations_repository.dart';

class GetVariationsCircleChartUseCase {
  final VariationsRepository _variationsRepository;

  GetVariationsCircleChartUseCase(this._variationsRepository);

  Future<DataState<CircleChart>> call(
    String phaseId,
    String sectorId,
  ) async {
    return _variationsRepository.getVariationCircleChart(phaseId,sectorId);
  }
}
