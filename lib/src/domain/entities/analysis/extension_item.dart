import 'package:equatable/equatable.dart';

class ExtensionItem extends Equatable {
  final double? extensionPeriod;
  final int? month;

  const ExtensionItem({
    this.extensionPeriod = 0.0,
    this.month = 0,
  });

  @override
  List<Object?> get props => [
    extensionPeriod,
    month,
  ];
}
