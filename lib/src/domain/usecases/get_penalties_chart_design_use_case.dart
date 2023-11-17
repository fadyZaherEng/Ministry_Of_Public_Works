import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/dashboards/penalties_chart.dart';
import 'package:aim/src/domain/repositories/penalties_repository.dart';

class GetPenaltiesChartDesignUseCase {
  final PenaltiesRepository _penaltiesRepository;

  GetPenaltiesChartDesignUseCase(this._penaltiesRepository);

  Future<DataState<PenaltiesChart>> call(
      String sectorId,
      int color,
      ) {
    return _penaltiesRepository.getPenaltiesChartDesign(sectorId,color);
  }
}
