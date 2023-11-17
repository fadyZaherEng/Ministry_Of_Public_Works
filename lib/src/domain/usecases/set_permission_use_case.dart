import 'package:aim/src/domain/repositories/home_repository.dart';

class SetPermissionUseCase {
  final HomeRepository homeRepository;

  SetPermissionUseCase(this.homeRepository);

  Future<bool> call(String permission) async {
    return homeRepository.setUserPermission(permission);
  }
}
