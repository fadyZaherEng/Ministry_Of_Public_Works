import 'package:aim/src/data/sources/remote/aim/contract/entity/remote_approved_analysis_item.dart';
import 'package:aim/src/data/sources/remote/aim/risks/entity/remote_levels.dart';
import 'package:aim/src/domain/entities/contract/approve_analysis_item.dart';
import 'package:aim/src/domain/entities/contract/approved_analysis.dart';
import 'package:aim/src/domain/entities/dashboards/levels.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_approved_analysis.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteApprovedAnalysis extends ApprovedAnalysis {
  @JsonKey(name: 'mega')
  final RemoteApprovedAnalysisItem? mega;
  @JsonKey(name: 'sanitary')
  final RemoteApprovedAnalysisItem? sanitary;
  @JsonKey(name: 'construction')
  final RemoteApprovedAnalysisItem? construction;

  const RemoteApprovedAnalysis(
      this.mega,
      this.sanitary,
      this.construction,
      ) : super(
    mega: mega ?? const ApprovedAnalysisItem(),
    sanitary: sanitary ?? const ApprovedAnalysisItem(),
    construction: construction ?? const ApprovedAnalysisItem(),
  );

  factory RemoteApprovedAnalysis.fromJson(Map<String, dynamic> json) =>
      _$RemoteApprovedAnalysisFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteApprovedAnalysisToJson(this);

}
