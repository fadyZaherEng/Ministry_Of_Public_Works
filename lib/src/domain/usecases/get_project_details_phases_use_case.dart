import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/project/details_phase.dart';
import 'package:aim/src/domain/entities/project/project_details.dart';
import 'package:aim/src/domain/repositories/project_repository.dart';

class GetProjectDetailsPhasesUseCase {
  final ProjectRepository _projectRepository;

  GetProjectDetailsPhasesUseCase(this._projectRepository);

  Future<DataState<List<DetailsPhase>>> call(
      String projectId, bool isEnglishLanguage) async {
    return _projectRepository.getProjectDetailsPhases(
      projectId,
      isEnglishLanguage,
    );
  }
}
