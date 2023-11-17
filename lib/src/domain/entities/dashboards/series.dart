import 'package:equatable/equatable.dart';

class Series extends Equatable {
  final List<double>? data;
  final List<String>? name;

  const Series({
    this.data = const [],
    this.name = const [],
  });

  @override
  List<Object?> get props => [
        data,
        name,
      ];
}
