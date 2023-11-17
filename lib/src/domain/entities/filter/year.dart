import 'package:equatable/equatable.dart';

class Year extends Equatable {
  final String? id;
  final String? name;
  final String? isAllowed;

  const Year({
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
