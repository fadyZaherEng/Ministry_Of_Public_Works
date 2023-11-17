import 'package:aim/src/data/sources/remote/aim/contract/entity/remote_delay_analysis_item.dart';
import 'package:aim/src/domain/entities/contract/delay_analysis.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_delay_analysis.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteDelayAnalysis extends DelayAnalysis {
  @JsonKey(name: 'mega')
  final RemoteDelayAnalysisItem? mega;
  @JsonKey(name: 'sanitary')
  final RemoteDelayAnalysisItem? sanitary;
  @JsonKey(name: 'construction')
  final RemoteDelayAnalysisItem? construction;

  const RemoteDelayAnalysis({
    this.mega = const RemoteDelayAnalysisItem(),
    this.sanitary = const RemoteDelayAnalysisItem(),
    this.construction = const RemoteDelayAnalysisItem(),
  });

  @override
  List<Object?> get props => [
        mega,
        sanitary,
        construction,
      ];

  factory RemoteDelayAnalysis.fromJson(Map<String, dynamic> json) =>
      _$RemoteDelayAnalysisFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteDelayAnalysisToJson(this);
}
