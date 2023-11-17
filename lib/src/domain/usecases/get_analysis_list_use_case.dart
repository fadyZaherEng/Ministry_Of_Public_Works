import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/analysis/request/analysis_list_request.dart';
import 'package:aim/src/domain/entities/analysis/analysis_data.dart';
import 'package:aim/src/domain/repositories/analysis_repository.dart';

class GetAnalysisListUseCase {
  final AnalysisRepository _analysisRepository;

  GetAnalysisListUseCase(this._analysisRepository);

  Future<DataState<AnalysisData>> call(AnalysisListRequest request) async {
    return _analysisRepository.getAnalysisList(request);
  }
}
