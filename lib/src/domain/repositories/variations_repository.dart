import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/variation/request/variations_list_request.dart';
import 'package:aim/src/data/sources/remote/aim/variation/request/variations_request.dart';
import 'package:aim/src/domain/entities/dashboards/circle_chart.dart';
import 'package:aim/src/domain/entities/dashboards/variations_chart.dart';
import 'package:aim/src/domain/entities/variations/variation.dart';
import 'package:aim/src/domain/entities/variations/variations_data.dart';

abstract class VariationsRepository {
  Future<DataState<VariationsDate>> getVariations(VariationsRequest request);

  Future<DataState<Variation>> getVariationById(
    String variationId,
    bool isEnglishLanguage,
  );

  Future<DataState<VariationsDate>> getVariationsList(
      VariationsListRequest request);

  Future<DataState<VariationsChart>> getVariationsChart(
    String phaseId,
    String sectorId,
  );

  Future<DataState<CircleChart>> getVariationCircleChart(
    String phaseId,
    String sectorId,
  );
}
