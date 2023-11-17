import 'package:equatable/equatable.dart';

class ProjectType extends Equatable {
  final String? id;
  final String? name;
  final String? principleName;

  const ProjectType({
    this.id = "",
    this.name = "",
    this.principleName = "",
  });

  @override
  List<Object?> get props => [
        id,
        name,
        principleName,
      ];
}
