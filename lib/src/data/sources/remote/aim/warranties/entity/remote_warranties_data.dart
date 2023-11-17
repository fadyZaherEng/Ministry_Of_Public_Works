import 'package:aim/src/data/sources/remote/aim/warranties/entity/remote_warranty.dart';
import 'package:aim/src/domain/entities/warranties/warranties_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_warranties_data.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteWarrantiesData extends WarrantiesData {
  @JsonKey(name: 'warrantiesList')
  final List<RemoteWarranty>? warranties;
  @JsonKey(name: 'recordsTotal')
  final int? recordsTotal;

  RemoteWarrantiesData(
    this.warranties,
    this.recordsTotal,
  ) : super(
          warranties: warranties ?? [],
          recordsTotal: recordsTotal ?? 0,
        );

  factory RemoteWarrantiesData.fromJson(Map<String, dynamic> json) =>
      _$RemoteWarrantiesDataFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteWarrantiesDataToJson(this);
}
