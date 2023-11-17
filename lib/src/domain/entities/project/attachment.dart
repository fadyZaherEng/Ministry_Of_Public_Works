import 'package:equatable/equatable.dart';

class Attachment extends Equatable {
  final String? id;
  final String? name;
  final String? url;
  final String? mediaExtension;

  const Attachment({
    this.id = "",
    this.name = "",
    this.url = "",
    this.mediaExtension="",
  });

  @override
  List<Object?> get props => [
        id,
        name,
        url,
        mediaExtension,
      ];
}
