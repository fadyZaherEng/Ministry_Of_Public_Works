import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/analysis/request/analysis_list_request.dart';
import 'package:aim/src/domain/entities/analysis/analysis_data.dart';
import 'package:aim/src/domain/entities/analysis/extension_item.dart';

abstract class AnalysisRepository {
  Future<DataState<AnalysisData>> getAnalysisList(AnalysisListRequest request);

  Future<DataState<List<ExtensionItem>>> getExtensionPeriod(
    String sectorId,
    int year,
    bool isEnglishLanguage,
  );
}
