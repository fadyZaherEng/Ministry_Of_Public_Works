import 'package:equatable/equatable.dart';

class Month extends Equatable {
  final int? id;
  final String? name;
  final String? isAllowed;

  const Month({
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
