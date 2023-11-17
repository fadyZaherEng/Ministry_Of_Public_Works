import 'package:equatable/equatable.dart';

class EndUser extends Equatable {
  final String? id;
  final String? name;
  final String? isAllowed;

  const EndUser({
    this.id = "",
    this.name = "",
    this.isAllowed = "",
  });

  @override
  List<Object?> get props => [
        id,
        name,
        isAllowed,
      ];
}
