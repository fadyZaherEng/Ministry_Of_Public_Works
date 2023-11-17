import 'package:equatable/equatable.dart';

class Phase extends Equatable {
  final int? id;
  final String? name;
  final String? isAllowed;

  const Phase({
    this.id = 0,
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
