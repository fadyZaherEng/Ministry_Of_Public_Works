import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/package/package_analysis_chart.dart';
import 'package:aim/src/domain/repositories/package_repository.dart';

class GetPackageAnalysisChartUseCase {
  final PackageRepository _packageRepository;

  GetPackageAnalysisChartUseCase(this._packageRepository);

  Future<DataState<PackageAnalysisChart>> call(String sectorId,int color) async {
    return _packageRepository.getPackageAnalysisChart(sectorId,color);
  }
}
