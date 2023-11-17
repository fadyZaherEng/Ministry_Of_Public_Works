import 'package:aim/src/domain/entities/contract/delay_analysis_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_delay_analysis_item.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteDelayAnalysisItem extends DelayAnalysisItem {
  @JsonKey(name: 'a_LessThan')
  final int? ALessThan;
  @JsonKey(name: 'b_Between')
  final int? BBetween;
  @JsonKey(name: 'c_MoreThan')
  final int? CMoreThan;

  const RemoteDelayAnalysisItem({
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

  factory RemoteDelayAnalysisItem.fromJson(Map<String, dynamic> json) =>
      _$RemoteDelayAnalysisItemFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteDelayAnalysisItemToJson(this);
}
