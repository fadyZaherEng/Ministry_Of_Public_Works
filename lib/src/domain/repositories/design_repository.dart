import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/design/request/design_list_request.dart';
import 'package:aim/src/domain/entities/dashboards/circle_chart.dart';
import 'package:aim/src/domain/entities/design/design_chart.dart';
import 'package:aim/src/domain/entities/design/design_data.dart';

abstract class DesignRepository {
  Future<DataState<DesignData>> getDesignList(DesignListRequest request);

  Future<DataState<DesignChart>> getDesignChart(
    String sectorId,
  );

  Future<DataState<CircleChart>> getDesignMinistry(
    String sectorId,
  );
}
