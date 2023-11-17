import 'package:aim/src/data/sources/remote/aim/package/entity/remote_package.dart';
import 'package:aim/src/domain/entities/package/package_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_package_data.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemotePackageData extends PackageData {
  @JsonKey(name: 'checklistsList')
  final List<RemotePackage>? packages;
  @JsonKey(name: 'recordsTotal')
  final int? recordsTotal;

  RemotePackageData(
      this.packages,
      this.recordsTotal,
      ) : super(
    packages: packages ?? [],
    recordsTotal: recordsTotal ?? 0,
  );

  factory RemotePackageData.fromJson(Map<String, dynamic> json) =>
      _$RemotePackageDataFromJson(json);

  Map<String, dynamic> toJson() => _$RemotePackageDataToJson(this);
}
