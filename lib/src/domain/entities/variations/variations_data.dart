import 'package:aim/src/domain/entities/variations/variation.dart';
import 'package:equatable/equatable.dart';

class VariationsDate extends Equatable {
  final List<Variation>? variations;
  final int? recordsTotal;

  const VariationsDate({
    this.variations = const [],
    this.recordsTotal = 0,
  });

  @override
  List<Object?> get props => [
        variations,
        recordsTotal,
      ];
}
