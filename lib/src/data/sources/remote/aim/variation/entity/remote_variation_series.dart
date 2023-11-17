import 'package:aim/src/domain/entities/dashboards/series.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_variation_series.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteVariationSeries extends Series {
  @JsonKey(name: 'data')
  final List<double>? data;
  @JsonKey(name: 'name')
  final List<String>? name;

  const RemoteVariationSeries(
      this.data,
      this.name,
      ) : super(
    data: data ?? const [],
    name: name ?? const [],
  );

  factory RemoteVariationSeries.fromJson(Map<String, dynamic> json) =>
      _$RemoteVariationSeriesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteVariationSeriesToJson(this);
}
