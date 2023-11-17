import 'package:aim/src/data/sources/remote/aim/project/entity/remote_project.dart';
import 'package:aim/src/domain/entities/project/project_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_project_data.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteProjectData extends ProjectData {
  @JsonKey(name: 'projectsList')
  final List<RemoteProject>? projects;
  @JsonKey(name: 'recordsTotal')
  final int? recordsTotal;

  RemoteProjectData(
    this.projects,
    this.recordsTotal,
  ) : super(
          projects: projects ?? [],
          recordsTotal: recordsTotal ?? 0,
        );

  factory RemoteProjectData.fromJson(Map<String, dynamic> json) =>
      _$RemoteProjectDataFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteProjectDataToJson(this);
}
