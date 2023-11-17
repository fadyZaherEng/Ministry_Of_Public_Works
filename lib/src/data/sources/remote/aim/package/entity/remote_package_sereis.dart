import 'package:aim/src/domain/entities/package/package_series.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_package_sereis.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemotePackageSeries extends PackageSeries {
  @JsonKey(name: 'data')
  final List<double>? data;
  @JsonKey(name: 'name')
  final List<String>? name;

  const RemotePackageSeries(
      this.data,
      this.name,
      ) : super(
    data: data ?? const [],
    name: name ?? const [],
  );

  factory RemotePackageSeries.fromJson(Map<String, dynamic> json) =>
      _$RemotePackageSeriesFromJson(json);

  Map<String, dynamic> toJson() => _$RemotePackageSeriesToJson(this);
}
