import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/project/request/projects_request.dart';
import 'package:aim/src/domain/entities/project/project_data.dart';
import 'package:aim/src/domain/repositories/project_repository.dart';

class GetProjectsUseCase {
  final ProjectRepository _projectRepository;

  GetProjectsUseCase(this._projectRepository);

  Future<DataState<ProjectData>> call(ProjectsRequest request) async {
    return await _projectRepository.getProjects(request);
  }
}
