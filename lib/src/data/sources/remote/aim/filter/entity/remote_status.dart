import 'package:aim/src/domain/entities/filter/status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_status.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteStatus extends Status {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'isAllowed')
  final String? isAllowed;

  const RemoteStatus(
    this.id,
    this.name,
    this.isAllowed,
  ) : super(
          id: id ?? 0,
          name: name ?? "",
          isAllowed: isAllowed ?? "",
        );

  factory RemoteStatus.fromJson(Map<String, dynamic> json) =>
      _$RemoteStatusFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteStatusToJson(this);
}
