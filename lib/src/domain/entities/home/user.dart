import 'package:aim/src/domain/entities/home/group.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? name;
  final String? email;
  final String? principleName;
  final String? userGroup;
  final bool? isDeleted;
  final List<Group>? groups;

  const User({
    this.id = "",
    this.name = "",
    this.email = "",
    this.principleName = "",
    this.userGroup = "",
    this.isDeleted = false,
    this.groups = const [],
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        principleName,
        userGroup,
        isDeleted,
        groups,
      ];
}
