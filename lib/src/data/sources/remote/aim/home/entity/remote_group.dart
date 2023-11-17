import 'package:aim/src/domain/entities/home/group.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_group.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteGroup extends Group {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;

  const RemoteGroup(
    this.id,
    this.name,
  ) : super(
          id: id ?? 0,
          name: name ?? "",
        );

  factory RemoteGroup.fromJson(Map<String, dynamic> json) =>
      _$RemoteGroupFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGroupToJson(this);
}
