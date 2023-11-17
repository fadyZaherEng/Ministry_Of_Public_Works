import 'package:aim/src/domain/entities/dashboards/levels.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_levels.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteLevels extends Levels {
  @JsonKey(name: 'low')
  final int? low;
  @JsonKey(name: 'meduim')
  final int? meduim;
  @JsonKey(name: 'high')
  final int? high;

  const RemoteLevels(
    this.low,
    this.meduim,
    this.high,
  ) : super(
    low: low ?? 0,
    meduim: meduim ?? 0,
    high: high ?? 0,
  );

  factory RemoteLevels.fromJson(Map<String, dynamic> json) =>
      _$RemoteLevelsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteLevelsToJson(this);

}
