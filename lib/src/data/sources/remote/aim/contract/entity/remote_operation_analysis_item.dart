import 'package:aim/src/domain/entities/contract/operation_analysis_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_operation_analysis_item.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteOperationAnalysisItem extends OperationAnalysisItem {
  @JsonKey(name: 'a_LessThan')
  final int? ALessThan;
  @JsonKey(name: 'b_Between')
  final int? BBetween;
  @JsonKey(name: 'c_MoreThan')
  final int? CMoreThan;

  const RemoteOperationAnalysisItem({
    this.ALessThan = 0,
    this.BBetween = 0,
    this.CMoreThan = 0,
  });

  @override
  List<Object?> get props => [
        ALessThan,
        BBetween,
        CMoreThan,
      ];

  factory RemoteOperationAnalysisItem.fromJson(Map<String, dynamic> json) =>
      _$RemoteOperationAnalysisItemFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteOperationAnalysisItemToJson(this);
}
