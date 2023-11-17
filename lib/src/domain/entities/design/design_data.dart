import 'package:aim/src/domain/entities/design/design.dart';
import 'package:equatable/equatable.dart';

class DesignData extends Equatable {
  final List<Design>? designs;
  final int? recordsTotal;

  const DesignData({
    this.designs = const [],
    this.recordsTotal = 0,
  });

  @override
  List<Object?> get props => [
        designs,
        recordsTotal,
      ];
}
