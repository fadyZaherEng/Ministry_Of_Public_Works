import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/project/project_details.dart';
import 'package:aim/src/domain/repositories/project_repository.dart';

class GetProjectPhasesUseCase {
  final ProjectRepository _projectRepository;

  GetProjectPhasesUseCase(this._projectRepository);

  Future<DataState<List<ProjectDetails>>> call(
      String projectId, bool isEnglishLanguage) async {
    return _projectRepository.getProjectPhases(
      projectId,
      isEnglishLanguage,
    );
  }
}
