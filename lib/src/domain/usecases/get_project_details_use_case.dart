import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/project/project_details.dart';
import 'package:aim/src/domain/repositories/project_repository.dart';

class GetProjectDetailsUseCase {
  final ProjectRepository _projectRepository;

  GetProjectDetailsUseCase(this._projectRepository);

  Future<DataState<ProjectDetails>> call(
      String projectId, bool isEnglishLanguage) async {
    return _projectRepository.getProjectDetails(projectId, isEnglishLanguage);
  }
}
