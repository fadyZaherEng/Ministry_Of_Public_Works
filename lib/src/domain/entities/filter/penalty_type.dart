import 'package:equatable/equatable.dart';

class PenaltyType extends Equatable {
  final String? id;
  final String? name;
  final String? isAllowed;

  const PenaltyType({
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
