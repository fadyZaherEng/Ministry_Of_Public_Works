import 'package:equatable/equatable.dart';

class Design extends Equatable {
  final String? id;
  final String? projectName;
  final String? agreementNumber;
  final double? planningPlanned;
  final double? planningActual;
  final double? designTenderingPlanned;
  final double? designTenderingActual;
  final double? dataCollectingPlanned;
  final double? dataCollectingActual;
  final double? conceptDesignPlanned;
  final double? conceptDesignActual;
  final double? designDevelopmentPlanned;
  final double? designDevelopmentActual;
  final double? preliminaryDesignPlanned;
  final double? preliminaryDesignActual;
  final double? finalDesignPlanned;
  final double? finalDesignActual;
  final double? constructionTenderPlanned;
  final double? constructionTenderActual;
  final double? designKPI;

  const Design({
    this.id = "",
    this.projectName = "",
    this.agreementNumber = "",
    this.designTenderingPlanned = 0.0,
    this.designTenderingActual = 0.0,
    this.planningActual = 0.0,
    this.planningPlanned = 0.0,
    this.conceptDesignPlanned = 0.0,
    this.conceptDesignActual = 0.0,
    this.designDevelopmentPlanned = 0.0,
    this.designDevelopmentActual = 0.0,
    this.preliminaryDesignPlanned = 0.0,
    this.preliminaryDesignActual = 0.0,
    this.finalDesignPlanned = 0.0,
    this.finalDesignActual = 0.0,
    this.constructionTenderPlanned = 0.0,
    this.constructionTenderActual = 0.0,
    this.designKPI = 0.0,
    this.dataCollectingPlanned = 0.0,
    this.dataCollectingActual = 0.0,
  });

  @override
  List<Object?> get props => [
        id,
        projectName,
        agreementNumber,
        planningActual,
        planningPlanned,
        designTenderingPlanned,
        designTenderingActual,
        dataCollectingPlanned,
        dataCollectingActual,
        conceptDesignPlanned,
        conceptDesignActual,
        designDevelopmentPlanned,
        designDevelopmentActual,
        preliminaryDesignPlanned,
        preliminaryDesignActual,
        finalDesignPlanned,
        finalDesignActual,
        constructionTenderPlanned,
        constructionTenderActual,
        designKPI,
      ];
}
