import 'package:aim/src/domain/entities/filter/penalty_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_penalty_type.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemotePenaltyType extends PenaltyType {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'isAllowed')
  final String? isAllowed;

  const RemotePenaltyType(
    this.id,
    this.name,
    this.isAllowed,
  ) : super(
          id: id ?? "",
          name: name ?? "",
          isAllowed: isAllowed ?? "",
        );

  factory RemotePenaltyType.fromJson(Map<String, dynamic> json) =>
      _$RemotePenaltyTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RemotePenaltyTypeToJson(this);
}
