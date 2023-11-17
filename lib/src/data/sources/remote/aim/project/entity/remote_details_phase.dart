import 'package:aim/src/domain/entities/project/details_phase.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_details_phase.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteDetailsPhase extends DetailsPhase {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'isAllowed')
  final String? isAllowed;

  RemoteDetailsPhase(
      this.id,
      this.name,
      this.isAllowed,
      ) : super(
    id: id ?? "",
    name: name ?? "",
    isAllowed: isAllowed ?? "",

  );

  factory RemoteDetailsPhase.fromJson(Map<String, dynamic> json) =>
      _$RemoteDetailsPhaseFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteDetailsPhaseToJson(this);
}
