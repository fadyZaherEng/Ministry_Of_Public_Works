import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/package/request/package_list_request.dart';
import 'package:aim/src/domain/entities/package/package_data.dart';
import 'package:aim/src/domain/repositories/package_repository.dart';

class GetPackageListUseCase {
  final PackageRepository _packageRepository;

  GetPackageListUseCase(this._packageRepository);

  Future<DataState<PackageData>> call(PackageListRequest request) async {
    return _packageRepository.getPackageList(request);
  }
}
