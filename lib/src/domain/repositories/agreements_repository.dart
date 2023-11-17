import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/agreements/request/agreements_request.dart';
import 'package:aim/src/domain/entities/agreement/agreement.dart';
import 'package:aim/src/domain/entities/agreement/agreements_data.dart';

abstract class AgreementsRepository {
  Future<DataState<AgreementsData>> getAgreements(AgreementsRequest request);

  Future<DataState<Agreement>> getAgreementById(
    String agreementId,
    bool isEnglishLanguage,
  );
}
