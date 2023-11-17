import 'package:aim/src/domain/entities/contract/contract.dart';
import 'package:equatable/equatable.dart';

class ContractData extends Equatable {
  final List<Contract>? contracts;
  final int? recordsTotal;

  const ContractData({
    this.contracts = const [],
    this.recordsTotal = 0,
  });

  @override
  List<Object?> get props => [
    contracts,
        recordsTotal,
      ];
}
