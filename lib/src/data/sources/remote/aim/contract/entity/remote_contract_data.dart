import 'package:aim/src/data/sources/remote/aim/contract/entity/remote_contract.dart';
import 'package:aim/src/domain/entities/contract/contract_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_contract_data.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteContractData extends ContractData {
  @JsonKey(name: 'projectsList')
  final List<RemoteContract>? contracts;
  @JsonKey(name: 'recordsTotal')
  final int? recordsTotal;

  const RemoteContractData({
    this.contracts = const [],
    this.recordsTotal = 0,
  });

  @override
  List<Object?> get props => [
    contracts,
        recordsTotal,
      ];

  factory RemoteContractData.fromJson(Map<String, dynamic> json) =>
      _$RemoteContractDataFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteContractDataToJson(this);
}
