import 'package:equatable/equatable.dart';

class DetailsPhase extends Equatable {
  final String? id;
  final String? name;
  final String? isAllowed;

  const DetailsPhase({
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
