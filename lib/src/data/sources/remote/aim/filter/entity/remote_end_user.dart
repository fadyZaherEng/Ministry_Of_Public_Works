import 'package:aim/src/domain/entities/filter/end_user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_end_user.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteEndUser extends EndUser {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'isAllowed')
  final String? isAllowed;

  const RemoteEndUser(
      this.id,
      this.name,
      this.isAllowed,
      ) : super(
    id: id ?? "",
    name: name ?? "",
    isAllowed: isAllowed ?? "",
  );

  factory RemoteEndUser.fromJson(Map<String, dynamic> json) =>
      _$RemoteEndUserFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteEndUserToJson(this);
}
