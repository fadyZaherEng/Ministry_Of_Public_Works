import 'package:aim/src/domain/entities/agreement/agreement.dart';
import 'package:equatable/equatable.dart';

class AgreementsData extends Equatable {
  final List<Agreement>? agreements;
  final int? recordsTotal;

  const AgreementsData({
    this.agreements = const [],
    this.recordsTotal = 0,
  });

  @override
  List<Object?> get props => [
        agreements,
        recordsTotal,
      ];
}
