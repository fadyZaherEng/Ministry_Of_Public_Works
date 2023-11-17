import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/project/request/projects_request.dart';
import 'package:aim/src/domain/entities/project/details_phase.dart';
import 'package:aim/src/domain/entities/project/project_data.dart';
import 'package:aim/src/domain/entities/project/project_details.dart';

abstract class ProjectRepository {
  Future<DataState<ProjectData>> getProjects(ProjectsRequest request);

  Future<DataState<ProjectDetails>> getProjectDetails(
    String projectId,
    bool isEnglishLanguage,
  );

  Future<DataState<List<ProjectDetails>>> getProjectPhases(
    String projectId,
    bool isEnglishLanguage,
  );

  Future<DataState<ProjectDetails>> getProjectPhase(
    String projectId,
    bool isEnglishLanguage,
  );

  Future<DataState<List<DetailsPhase>>> getProjectDetailsPhases(
      String projectId,
      bool isEnglishLanguage,
      );
}
