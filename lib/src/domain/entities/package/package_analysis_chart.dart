import 'package:aim/src/domain/entities/package/packaget_levels.dart';
import 'package:equatable/equatable.dart';

class PackageAnalysisChart extends Equatable {
  final PackageLevels? mega;
  final PackageLevels? sanitary;
  final PackageLevels? construction;

  const PackageAnalysisChart({
    this.mega = const PackageLevels(),
    this.sanitary = const PackageLevels(),
    this.construction = const PackageLevels(),
   });

  @override
  List<Object?> get props => [
    mega,
    sanitary,
    construction,
  ];
}
