import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/contract/request/contract_list_request.dart';
import 'package:aim/src/domain/entities/contract/contract_data.dart';
import 'package:aim/src/domain/repositories/contract_repository.dart';

class GetContractListUseCase {
  final ContractRepository _contractRepository;

  GetContractListUseCase(this._contractRepository);

  Future<DataState<ContractData>> call(ContractListRequest request) async {
    return _contractRepository.getContractList(request);
  }
}
