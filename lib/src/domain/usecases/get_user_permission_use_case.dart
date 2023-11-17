import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/home/home.dart';
import 'package:aim/src/domain/entities/home/permission.dart';
import 'package:aim/src/domain/repositories/home_repository.dart';

class GetUserPermissionUseCase {
  final HomeRepository _homeRepository;

  GetUserPermissionUseCase(this._homeRepository);

  Future<DataState<UserPermission>> call(bool isEnglishLanguage) async {
    return await _homeRepository.getUserPermission(isEnglishLanguage);
  }
}
