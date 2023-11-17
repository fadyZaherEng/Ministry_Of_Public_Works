import 'package:aim/src/domain/entities/project/attachment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_attachment.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteAttachment extends Attachment {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'caption')
  final String? name;
  @JsonKey(name: 'mediaUrl')
  final String? url;
  @JsonKey(name: 'mediaExtension')
  final String? mediaExtension;

  const RemoteAttachment(
    this.id,
    this.name,
    this.url,
    this.mediaExtension,
  ) : super(
    id: id ?? "",
    name: name ?? "",
    url: url ?? "",
    mediaExtension: mediaExtension ?? "",
  );

  factory RemoteAttachment.fromJson(Map<String, dynamic> json) =>
      _$RemoteAttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAttachmentToJson(this);

}