import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_phase.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemotePhase extends Phase {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'isAllowed')
  final String? isAllowed;

  const RemotePhase(
    this.id,
    this.name,
    this.isAllowed,
  ) : super(
          id: id ?? 0,
          name: name ?? "",
          isAllowed: isAllowed ?? "",
        );

  factory RemotePhase.fromJson(Map<String, dynamic> json) =>
      _$RemotePhaseFromJson(json);

  Map<String, dynamic> toJson() => _$RemotePhaseToJson(this);
}
