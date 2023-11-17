import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/penalties/request/penalties_list_request.dart';
import 'package:aim/src/domain/entities/project/project_data.dart';
import 'package:aim/src/domain/repositories/penalties_repository.dart';

class GetPenaltiesListUseCase {
  final PenaltiesRepository _penaltiesRepository;

  GetPenaltiesListUseCase(this._penaltiesRepository);

  Future<DataState<ProjectData>> call(PenaltiesListRequest request) async {
    return _penaltiesRepository.getPenaltiesList(request);
  }
}
