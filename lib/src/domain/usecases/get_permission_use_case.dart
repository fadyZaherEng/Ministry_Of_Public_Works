import 'package:aim/src/domain/repositories/home_repository.dart';

class GetLocalPermissionUserCase {
  final HomeRepository homeRepository;

  GetLocalPermissionUserCase(this.homeRepository);

  Future<String> call() async {
    return homeRepository.getLocalUserPermission();
  }
}
