import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_project_type.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteProjectType extends ProjectType {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'principleName')
  final String? principleName;

  const RemoteProjectType(
    this.id,
    this.name,
    this.principleName,
  ) : super(
          id: id ?? "",
          name: name ?? "",
          principleName: principleName ?? "",
        );

  factory RemoteProjectType.fromJson(Map<String, dynamic> json) =>
      _$RemoteProjectTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteProjectTypeToJson(this);
}
