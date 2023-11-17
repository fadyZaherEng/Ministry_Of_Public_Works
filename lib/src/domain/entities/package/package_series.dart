import 'package:equatable/equatable.dart';

class PackageSeries extends Equatable {
  final List<double>? data;
  final List<String>? name;

  const PackageSeries({
    this.data = const [],
    this.name = const [],
  });

  @override
  List<Object?> get props => [
        data,
        name,
      ];
}
