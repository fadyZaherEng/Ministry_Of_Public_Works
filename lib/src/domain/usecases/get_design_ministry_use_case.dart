import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/design/request/design_list_request.dart';
import 'package:aim/src/domain/entities/dashboards/circle_chart.dart';
import 'package:aim/src/domain/entities/design/design_data.dart';
import 'package:aim/src/domain/repositories/design_repository.dart';

class GetDesignMinistryUseCase {
  final DesignRepository _designRepository;

  GetDesignMinistryUseCase(this._designRepository);

  Future<DataState<CircleChart>> call(String sectorId) async {
    return _designRepository.getDesignMinistry(sectorId);
  }
}
