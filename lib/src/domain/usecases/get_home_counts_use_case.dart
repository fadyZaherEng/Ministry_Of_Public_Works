import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/home/home.dart';
import 'package:aim/src/domain/repositories/home_repository.dart';

class GetHomeCountsUseCase {
  final HomeRepository _homeRepository;

  GetHomeCountsUseCase(this._homeRepository);

  Future<DataState<Home>> call() async {
    return await _homeRepository.getHomeCounts();
  }
}
