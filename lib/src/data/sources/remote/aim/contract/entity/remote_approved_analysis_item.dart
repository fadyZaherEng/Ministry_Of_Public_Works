import 'package:aim/src/data/sources/remote/aim/risks/entity/remote_levels.dart';
import 'package:aim/src/domain/entities/contract/approve_analysis_item.dart';
import 'package:aim/src/domain/entities/contract/approved_analysis.dart';
import 'package:aim/src/domain/entities/dashboards/levels.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_approved_analysis_item.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteApprovedAnalysisItem extends ApprovedAnalysisItem {
  @JsonKey(name: 'approved')
  final int? approved;
  @JsonKey(name: 'notApproved')
  final int? notApproved;

  const RemoteApprovedAnalysisItem(
      this.approved,
      this.notApproved,
      ) : super(
    approved: approved ?? 0,
    notApproved: notApproved ?? 0,
  );

  factory RemoteApprovedAnalysisItem.fromJson(Map<String, dynamic> json) =>
      _$RemoteApprovedAnalysisItemFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteApprovedAnalysisItemToJson(this);

}
