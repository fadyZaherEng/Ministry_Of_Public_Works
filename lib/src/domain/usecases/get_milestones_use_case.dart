import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/milestones/request/milestones_request.dart';
import 'package:aim/src/domain/entities/milestones/milestones_data.dart';
import 'package:aim/src/domain/repositories/milestones_repository.dart';

class GetMilestonesUseCase {
  final MilestonesRepository _milestonesRepository;

  GetMilestonesUseCase(this._milestonesRepository);

  Future<DataState<MilestonesData>> call(MilestonesRequest request) async {
    return _milestonesRepository.getMilestones(request);
  }
}
