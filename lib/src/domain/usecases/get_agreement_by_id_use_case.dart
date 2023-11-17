import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/agreements/request/agreements_request.dart';
import 'package:aim/src/domain/entities/agreement/agreement.dart';
import 'package:aim/src/domain/entities/agreement/agreements_data.dart';
import 'package:aim/src/domain/repositories/agreements_repository.dart';

class GetAgreementByIdUseCase {
  final AgreementsRepository _agreementsRepository;

  GetAgreementByIdUseCase(this._agreementsRepository);

  Future<DataState<Agreement>> call(
      String agreementId, bool isEnglishLanguage) async {
    return _agreementsRepository.getAgreementById(
        agreementId, isEnglishLanguage);
  }
}
