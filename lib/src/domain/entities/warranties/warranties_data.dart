import 'package:aim/src/domain/entities/warranties/warranty.dart';
import 'package:equatable/equatable.dart';

class WarrantiesData extends Equatable {
  final List<Warranty>? warranties;
  final int? recordsTotal;

  const WarrantiesData({
    this.warranties = const [],
    this.recordsTotal = 0,
  });

  @override
  List<Object?> get props => [
        warranties,
        recordsTotal,
      ];
}
