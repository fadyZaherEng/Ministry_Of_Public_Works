import 'package:aim/src/domain/entities/filter/month.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_month.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteMonth extends Month {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'isAllowed')
  final String? isAllowed;

  const RemoteMonth(
    this.id,
    this.name,
    this.isAllowed,
  ) : super(
          id: id ?? 0,
          name: name ?? "",
          isAllowed: isAllowed ?? "",
        );

  factory RemoteMonth.fromJson(Map<String, dynamic> json) =>
      _$RemoteMonthFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteMonthToJson(this);
}
