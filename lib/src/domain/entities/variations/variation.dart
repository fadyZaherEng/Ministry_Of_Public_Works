import 'package:aim/src/domain/entities/project/attachment.dart';
import 'package:equatable/equatable.dart';

class Variation extends Equatable {
  final String? id;
  final String? projectName;
  final String? agreementNumber;
  final String? projectEngineer;
  final String? sector;
  final String? variation;
  final String? contractAmount;
  final String? date;
  final String? projectPhase;
  final String? impactOnCost;
  final double? variationKPI;
  final String? variationValueStr;
  final String? userWhoAskedForVariationOrderstr;
  final String? justification;

  final List<Attachment>? attachments;

  const Variation({
    this.id = "",
    this.projectName = "",
    this.agreementNumber = "",
    this.projectPhase = "",
    this.projectEngineer = "",
    this.variationValueStr = "",
    this.justification = "",
    this.userWhoAskedForVariationOrderstr = "",
    this.sector = "",
    this.variation = "",
    this.contractAmount = "",
    this.variationKPI = 0.0,
    this.date = "",
    this.impactOnCost = "",
    this.attachments = const [],
  });

  @override
  List<Object?> get props => [
        id,
        projectName,
        agreementNumber,
        projectPhase,
        projectEngineer,
        sector,
        variationKPI,
        variation,
        variationValueStr,
        userWhoAskedForVariationOrderstr,
        justification,
        contractAmount,
        date,
        impactOnCost,
        attachments,
      ];
}
