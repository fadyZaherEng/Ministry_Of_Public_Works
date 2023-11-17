import 'package:aim/src/data/sources/remote/aim/risks/entity/remote_risk.dart';
import 'package:aim/src/domain/entities/risks/risks_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_risks_data.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteRisksData extends RisksData {
  @JsonKey(name: 'projectRisksList')
  final List<RemoteRisk>? risks;
  @JsonKey(name: 'recordsTotal')
  final int? recordsTotal;

  RemoteRisksData(
    this.risks,
    this.recordsTotal,
  ) : super(
          risks: risks ?? [],
          recordsTotal: recordsTotal ?? 0,
        );

  factory RemoteRisksData.fromJson(Map<String, dynamic> json) =>
      _$RemoteRisksDataFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteRisksDataToJson(this);
}
