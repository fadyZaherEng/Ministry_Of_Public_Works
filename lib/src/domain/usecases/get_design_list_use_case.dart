import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/design/request/design_list_request.dart';
import 'package:aim/src/domain/entities/design/design_data.dart';
import 'package:aim/src/domain/repositories/design_repository.dart';

class GetDesignListUseCase {
  final DesignRepository _designRepository;

  GetDesignListUseCase(this._designRepository);

  Future<DataState<DesignData>> call(DesignListRequest request) async {
    return _designRepository.getDesignList(request);
  }
}
