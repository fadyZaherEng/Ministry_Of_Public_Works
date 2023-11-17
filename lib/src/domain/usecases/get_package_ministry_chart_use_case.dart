import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/package/package_circle_chart.dart';
import 'package:aim/src/domain/repositories/package_repository.dart';

class GetPackageMinistryChartUseCase {
  final PackageRepository _packageRepository;

  GetPackageMinistryChartUseCase(this._packageRepository);

  Future<DataState<PackageCircleChart>> call(String sectorId,int color) async {
    return _packageRepository.getPackageMinistryChart(sectorId,color);
  }
}
