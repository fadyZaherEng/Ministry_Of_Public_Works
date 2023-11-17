import 'package:aim/src/domain/entities/package/package.dart';
import 'package:equatable/equatable.dart';

class PackageData extends Equatable {
  final List<Package>? packages;
  final int? recordsTotal;

  const PackageData({
    this.packages = const [],
    this.recordsTotal = 0,
  });

  @override
  List<Object?> get props => [
        packages,
        recordsTotal,
      ];
}
