import 'package:aim/src/data/sources/remote/aim/overview/entity/remote_overview.dart';
import 'package:aim/src/domain/entities/overview/overview_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_overview_data.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteOverviewData extends OverviewData {
  @JsonKey(name: 'overviewList')
  final List<RemoteOverview>? overviews;
  @JsonKey(name: 'recordsTotal')
  final int? recordsTotal;

  RemoteOverviewData(
    this.overviews,
    this.recordsTotal,
  ) : super(
          overviews: overviews ?? [],
          recordsTotal: recordsTotal ?? 0,
        );

  factory RemoteOverviewData.fromJson(Map<String, dynamic> json) =>
      _$RemoteOverviewDataFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteOverviewDataToJson(this);
}
