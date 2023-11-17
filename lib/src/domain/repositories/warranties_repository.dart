import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/warranties/request/warranties_request.dart';
import 'package:aim/src/domain/entities/warranties/warranties_data.dart';
import 'package:aim/src/domain/entities/warranties/warranty.dart';

abstract class WarrantiesRepository {
  Future<DataState<WarrantiesData>> getWarranties(WarrantiesRequest request);

  Future<DataState<Warranty>> getWarrantyById(
    String warrantyId,
    bool isEnglishLanguage,
  );
}
