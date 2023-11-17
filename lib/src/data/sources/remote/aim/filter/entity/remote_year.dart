import 'package:aim/src/domain/entities/filter/year.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_year.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteYear extends Year {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'isAllowed')
  final String? isAllowed;

  const RemoteYear(
      this.id,
      this.name,
      this.isAllowed,
      ) : super(
    id: id ?? "",
    name: name ?? "",
    isAllowed: isAllowed ?? "",
  );

  factory RemoteYear.fromJson(Map<String, dynamic> json) =>
      _$RemoteYearFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteYearToJson(this);
}
