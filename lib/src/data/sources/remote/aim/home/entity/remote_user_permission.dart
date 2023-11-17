import 'package:aim/src/domain/entities/home/home.dart';
import 'package:aim/src/domain/entities/home/permission.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_user_permission.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteUserPermission extends UserPermission {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;

  const RemoteUserPermission(
    this.id,
    this.name,
  ) : super(
          id: id ?? 0,
          name: name ?? "",
        );

  factory RemoteUserPermission.fromJson(Map<String, dynamic> json) =>
      _$RemoteUserPermissionFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteUserPermissionToJson(this);
}
