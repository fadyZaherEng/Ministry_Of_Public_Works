import 'package:aim/src/data/sources/remote/aim/home/entity/remote_group.dart';
import 'package:aim/src/domain/entities/home/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_user.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteUser extends User {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'principleName')
  final String? principleName;
  @JsonKey(name: 'userGroup')
  final String? userGroup;
  @JsonKey(name: 'isDeleted')
  final bool? isDeleted;
  @JsonKey(name: 'groups')
  final List<RemoteGroup>? groups;

  const RemoteUser(
    this.id,
    this.name,
    this.email,
    this.principleName,
    this.userGroup,
    this.isDeleted,
    this.groups,
  ) : super(
          id: id ?? "",
          name: name ?? "",
          email: email ?? "0",
          principleName: principleName ?? "0",
          userGroup: userGroup ?? "0",
          isDeleted: isDeleted ?? false,
          groups: groups ?? const [],
        );

  factory RemoteUser.fromJson(Map<String, dynamic> json) =>
      _$RemoteUserFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteUserToJson(this);
}
