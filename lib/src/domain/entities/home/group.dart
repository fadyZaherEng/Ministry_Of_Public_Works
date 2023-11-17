import 'package:equatable/equatable.dart';

class Group extends Equatable {
  final int? id;
  final String? name;

  const Group({
    this.id = 0,
    this.name = "",
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
