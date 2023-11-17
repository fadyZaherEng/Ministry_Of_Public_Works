import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/issues/issue.dart';
import 'package:aim/src/domain/entities/penalties/penalty.dart';
import 'package:aim/src/domain/repositories/issues_repository.dart';
import 'package:aim/src/domain/repositories/penalties_repository.dart';

class GetPenaltyByIdUseCase {
  final PenaltiesRepository _penaltiesRepository;

  GetPenaltyByIdUseCase(this._penaltiesRepository);

  Future<DataState<Penalty>> call(String penaltyId, bool isEnglishLanguage) {
    return _penaltiesRepository.getPenaltyById(penaltyId, isEnglishLanguage);
  }
}
