import 'package:aim/src/domain/entities/filter/warranty_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_warranty_type.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteWarrantyType extends WarrantyType {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'isAllowed')
  final String? isAllowed;

  const RemoteWarrantyType(
    this.id,
    this.name,
    this.isAllowed,
  ) : super(
          id: id ?? 0,
          name: name ?? "",
          isAllowed: isAllowed ?? "",
        );

  factory RemoteWarrantyType.fromJson(Map<String, dynamic> json) =>
      _$RemoteWarrantyTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteWarrantyTypeToJson(this);
}
