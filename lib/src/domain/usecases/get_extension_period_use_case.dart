import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/analysis/request/analysis_list_request.dart';
import 'package:aim/src/domain/entities/analysis/analysis_data.dart';
import 'package:aim/src/domain/entities/analysis/extension_item.dart';
import 'package:aim/src/domain/repositories/analysis_repository.dart';

class GetExtensionPeriodUseCase {
  final AnalysisRepository _analysisRepository;

  GetExtensionPeriodUseCase(this._analysisRepository);

  Future<DataState<List<ExtensionItem>>> call(
    String sectorId,
    int year,
    bool isEnglishLanguage,
  ) async {
    return _analysisRepository.getExtensionPeriod(
      sectorId,
      year,
      isEnglishLanguage,
    );
  }
}
