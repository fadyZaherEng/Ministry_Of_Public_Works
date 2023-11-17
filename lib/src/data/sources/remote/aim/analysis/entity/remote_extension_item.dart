import 'package:aim/src/data/sources/remote/aim/analysis/entity/remote_analysis.dart';
import 'package:aim/src/data/sources/remote/aim/reports/entity/remote_report.dart';
import 'package:aim/src/domain/entities/analysis/analysis.dart';
import 'package:aim/src/domain/entities/analysis/analysis_data.dart';
import 'package:aim/src/domain/entities/analysis/extension_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_extension_item.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteExtensionItem extends ExtensionItem {
  @JsonKey(name: 'extensionPeriod')
  final double? extensionPeriod;
  @JsonKey(name: 'month')
  final int? month;

  RemoteExtensionItem(
    this.extensionPeriod,
    this.month,
  ) : super(
    extensionPeriod: extensionPeriod ?? 0.0,
          month: month ?? 0,
        );

  factory RemoteExtensionItem.fromJson(Map<String, dynamic> json) =>
      _$RemoteExtensionItemFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteExtensionItemToJson(this);
}
