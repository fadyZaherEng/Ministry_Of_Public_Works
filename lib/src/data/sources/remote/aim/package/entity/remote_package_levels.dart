import 'package:aim/src/domain/entities/package/packaget_levels.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_package_levels.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemotePackageLevels extends PackageLevels {
  @JsonKey(name: 'totalNoLess')
  final int? totalNoLess;
  @JsonKey(name: 'totalNoBetween')
  final int? totalNoBetween;
  @JsonKey(name: 'totalNoMore')
  final int? totalNoMore;

  const RemotePackageLevels(
      this.totalNoLess,
      this.totalNoBetween,
      this.totalNoMore,
      ) : super(
    totalNoLess: totalNoLess ?? 0,
    totalNoBetween: totalNoBetween ?? 0,
    totalNoMore: totalNoMore ?? 0,
  );

  factory RemotePackageLevels.fromJson(Map<String, dynamic> json) =>
      _$RemotePackageLevelsFromJson(json);

  Map<String, dynamic> toJson() => _$RemotePackageLevelsToJson(this);
}
