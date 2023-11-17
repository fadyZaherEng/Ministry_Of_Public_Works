import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/contract/request/contract_list_request.dart';
import 'package:aim/src/domain/entities/contract/approved_analysis.dart';
import 'package:aim/src/domain/entities/contract/contract_data.dart';
import 'package:aim/src/domain/entities/contract/delay_analysis.dart';
import 'package:aim/src/domain/entities/contract/operation_analysis.dart';

abstract class ContractRepository {
  Future<DataState<ContractData>> getContractList(ContractListRequest request);

  Future<DataState<ApprovedAnalysis>> getApprovedAnalysis(String sectorId);

  Future<DataState<DelayAnalysis>> getDelayAnalysis();

  Future<DataState<OperationAnalysis>> getOperationAnalysis();
}
