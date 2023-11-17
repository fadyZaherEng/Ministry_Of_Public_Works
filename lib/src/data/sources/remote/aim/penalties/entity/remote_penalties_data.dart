import 'package:aim/src/data/sources/remote/aim/penalties/entity/remote_penalty.dart';
import 'package:aim/src/domain/entities/penalties/penalties_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_penalties_data.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemotePenaltiesData extends PenaltiesData {
  @JsonKey(name: 'penaltiesList')
  final List<RemotePenalty>? penalties;
  @JsonKey(name: 'recordsTotal')
  final int? recordsTotal;

  RemotePenaltiesData(
      this.penalties,
      this.recordsTotal,
      ) : super(
    penalties: penalties ?? [],
    recordsTotal: recordsTotal ?? 0,
  );

  factory RemotePenaltiesData.fromJson(Map<String, dynamic> json) =>
      _$RemotePenaltiesDataFromJson(json);

  Map<String, dynamic> toJson() => _$RemotePenaltiesDataToJson(this);
}
