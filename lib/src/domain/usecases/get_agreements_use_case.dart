import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/agreements/request/agreements_request.dart';
import 'package:aim/src/domain/entities/agreement/agreements_data.dart';
import 'package:aim/src/domain/repositories/agreements_repository.dart';

class GetAgreementsUseCase {
  final AgreementsRepository _agreementsRepository;

  GetAgreementsUseCase(this._agreementsRepository);

  Future<DataState<AgreementsData>> call(AgreementsRequest request) async {
    return _agreementsRepository.getAgreements(request);
  }
}
