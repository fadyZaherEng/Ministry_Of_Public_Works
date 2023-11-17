import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/issues/issue.dart';
import 'package:aim/src/domain/entities/milestones/milestone.dart';
import 'package:aim/src/domain/repositories/issues_repository.dart';
import 'package:aim/src/domain/repositories/milestones_repository.dart';

class GetMilestoneByIdUseCase {
  final MilestonesRepository _milestonesRepository;

  GetMilestoneByIdUseCase(this._milestonesRepository);

  Future<DataState<Milestone>> call(
      String milestoneId, bool isEnglishLanguage) {
    return _milestonesRepository.getMilestoneById(
        milestoneId, isEnglishLanguage);
  }
}
