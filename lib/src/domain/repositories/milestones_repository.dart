import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/milestones/request/milestones_request.dart';
import 'package:aim/src/domain/entities/milestones/milestone.dart';
import 'package:aim/src/domain/entities/milestones/milestones_data.dart';

abstract class MilestonesRepository {
  Future<DataState<MilestonesData>> getMilestones(MilestonesRequest request);

  Future<DataState<Milestone>> getMilestoneById(
    String milestoneId,
    bool isEnglishLanguage,
  );
}
