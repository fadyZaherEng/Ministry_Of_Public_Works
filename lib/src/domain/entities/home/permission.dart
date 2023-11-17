import 'package:equatable/equatable.dart';

class UserPermission extends Equatable {
  final int? id;
  final String? name;

  const UserPermission({
    this.id = 0,
    this.name = "",
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
