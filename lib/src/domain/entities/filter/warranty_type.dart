import 'package:equatable/equatable.dart';

class WarrantyType extends Equatable {
  final int? id;
  final String? name;
  final String? isAllowed;

  const WarrantyType({
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
