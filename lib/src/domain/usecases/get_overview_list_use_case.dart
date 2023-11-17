import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/overview/request/overview_list_request.dart';
import 'package:aim/src/domain/entities/overview/overview_data.dart';
import 'package:aim/src/domain/repositories/overview_repository.dart';

class GetOverviewListUseCase {
  final OverviewRepository _overviewRepository;

  GetOverviewListUseCase(this._overviewRepository);

  Future<DataState<OverviewData>> call(OverviewListRequest request) async {
    return _overviewRepository.getOverviewList(request);
  }
}
