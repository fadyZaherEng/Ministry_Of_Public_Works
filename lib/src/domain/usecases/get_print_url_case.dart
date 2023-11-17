import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/repositories/reports_repository.dart';

class GetPrintUrlUseCase {
  final ReportsRepository reportsRepository;

  GetPrintUrlUseCase(this.reportsRepository);

  Future<DataState<String>> call() async {
    return reportsRepository.getPrintUrl();
  }
}
