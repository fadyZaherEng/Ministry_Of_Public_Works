import 'package:aim/src/data/sources/remote/aim/contract/entity/remote_operation_analysis_item.dart';
import 'package:aim/src/domain/entities/contract/operation_analysis.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_operation_analysis.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteOperationAnalysis extends OperationAnalysis {
  @JsonKey(name: 'sanitary')
  final RemoteOperationAnalysisItem? sanitary;

  const RemoteOperationAnalysis({
    this.sanitary = const RemoteOperationAnalysisItem(),
  });

  @override
  List<Object?> get props => [
        sanitary,
      ];

  factory RemoteOperationAnalysis.fromJson(Map<String, dynamic> json) =>
      _$RemoteOperationAnalysisFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteOperationAnalysisToJson(this);
}
