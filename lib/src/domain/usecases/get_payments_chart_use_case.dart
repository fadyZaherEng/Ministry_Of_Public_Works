import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_sector.dart';
import 'package:aim/src/domain/entities/dashboards/payments_chart.dart';
import 'package:aim/src/domain/repositories/payments_repository.dart';
import 'package:aim/src/domain/repositories/risks_repository.dart';

class GetPaymentsChartUseCase {
  final PaymentsRepository _paymentsRepository;

  GetPaymentsChartUseCase(this._paymentsRepository);

  Future<DataState<PaymentsChart>> call(
    String phaseId,
    String sectorId,
    int color,
  ) {
    return _paymentsRepository.getPaymentsChart(phaseId, sectorId,color);
  }
}
