import 'package:aim/src/data/sources/remote/aim/variation/entity/remote_variation.dart';
import 'package:aim/src/domain/entities/variations/variations_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_variations_data.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteVariationsData extends VariationsDate {
  @JsonKey(name: 'variationOrdersList')
  final List<RemoteVariation>? variations;
  @JsonKey(name: 'recordsTotal')
  final int? recordsTotal;

  const RemoteVariationsData({
    this.variations = const [],
    this.recordsTotal = 0,
  });

  @override
  List<Object?> get props => [
        variations,
        recordsTotal,
      ];

  factory RemoteVariationsData.fromJson(Map<String, dynamic> json) =>
      _$RemoteVariationsDataFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteVariationsDataToJson(this);
}
