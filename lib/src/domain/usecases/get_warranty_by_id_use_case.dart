import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/issues/issue.dart';
import 'package:aim/src/domain/entities/milestones/milestone.dart';
import 'package:aim/src/domain/entities/warranties/warranty.dart';
import 'package:aim/src/domain/repositories/issues_repository.dart';
import 'package:aim/src/domain/repositories/milestones_repository.dart';
import 'package:aim/src/domain/repositories/warranties_repository.dart';

class GetWarrantyByIdUseCase {
  final WarrantiesRepository _warrantiesRepository;

  GetWarrantyByIdUseCase(this._warrantiesRepository);

  Future<DataState<Warranty>> call(String warrantyId, bool isEnglishLanguage) {
    return _warrantiesRepository.getWarrantyById(warrantyId, isEnglishLanguage);
  }
}
