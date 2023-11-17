import 'package:aim/src/data/sources/remote/aim/design/entity/remote_design.dart';
import 'package:aim/src/data/sources/remote/aim/variation/entity/remote_variation.dart';
import 'package:aim/src/domain/entities/design/design_data.dart';
import 'package:aim/src/domain/entities/variations/variations_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_design_data.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteDesignData extends DesignData {
  @JsonKey(name: 'checklistsList')
  final List<RemoteDesign>? designs;
  @JsonKey(name: 'recordsTotal')
  final int? recordsTotal;

  const RemoteDesignData({
    this.designs = const [],
    this.recordsTotal = 0,
  });

  @override
  List<Object?> get props => [
        designs,
        recordsTotal,
      ];

  factory RemoteDesignData.fromJson(Map<String, dynamic> json) =>
      _$RemoteDesignDataFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteDesignDataToJson(this);
}
