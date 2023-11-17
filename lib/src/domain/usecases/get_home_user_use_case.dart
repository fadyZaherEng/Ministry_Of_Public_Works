import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/home/home.dart';
import 'package:aim/src/domain/entities/home/user.dart';
import 'package:aim/src/domain/repositories/home_repository.dart';

class GetHomeUserUseCase {
  final HomeRepository _homeRepository;

  GetHomeUserUseCase(this._homeRepository);

  Future<DataState<User>> call() async {
    return await _homeRepository.getUser();
  }
}
